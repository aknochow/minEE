# minEE (minimal Execution Environment)
# CentOS Stream 9 flavor
ARG EE_BASE_IMAGE=quay.io/centos/centos:stream9-minimal
FROM $EE_BASE_IMAGE

# https://github.com/opencontainers/image-spec/blob/main/annotations.md
LABEL org.opencontainers.image.source https://github.com/aknochow/minee/cs9/Containerfile

# dnf basics
USER root
RUN microdnf -y update && microdnf -y upgrade
RUN microdnf -y install \
git-core \
jq \
python \
which
RUN microdnf clean all

# Avoid "fatal: detected dubious ownership in repository at" with newer git versions
# See https://github.com/actions/runner-images/issues/6775
RUN git config --system --add safe.directory /

# Python
RUN python3 -m ensurepip && python3 -m pip install --upgrade pip
RUN python3 -m pip install --progress-bar=off --compile --only-binary :all: \
ansible-lint \
ansible-runner \
jmespath \
paramiko \
pyyaml
RUN rm -rf $(python3 -m pip cache dir)

# Runner
RUN useradd runner
RUN echo -e "runner:1:999\nrunner:1001:64535" >> /etc/subuid
RUN echo -e "runner:1:999\nrunner:1001:64535" >> /etc/subgid
RUN install -d -m 0775 -o runner -g root \
/home/runner/.ansible \
/runner \
/runner/artifacts \
/runner/env \
/runner/inventory \
/runner/project \
/stage \
/work
RUN install -m 775 -o runner -g root /dev/null /home/runner/.ansible/galaxy_token
RUN chmod g+rw /etc/{group,passwd}

# add some helpful CLI commands to check we do not remove them inadvertently and output some helpful version information at build time.
RUN set -ex \
&& ansible --version \
&& ansible-lint --version \
&& ansible-runner --version \
&& python --version \
&& git --version \
&& rpm -qa \
&& uname -a

# Set custom prompt according to user
RUN echo "git_branch() { git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'; }" >> /etc/profile.d/prompt.sh
RUN echo 'if [ ${EUID} != 0 ]; then export PS1="\n\[\e[1m\]\[\033[01;34m\]\u\[\033[00m\]@\h \[\e[1m\]\[\033[34m\]\[\033[00m\][\[\033[34m\]\[\e[1m\]\w\[\033[00m\]] \[\033[32m\]\$(git_branch)\[\033[00m\]\n $ " ; fi' >> /etc/profile.d/prompt.sh
RUN echo 'if [ ${EUID} == 0 ]; then export PS1="\n\[\e[1m\]\[\033[01;31m\]\u\[\033[00m\]@\h \[\e[1m\]\[\033[31m\]\[\033[00m\][\[\033[31m\]\[\e[1m\]\w\[\033[00m\]] \[\033[32m\]\$(git_branch)\[\033[00m\]\n $ " ; fi' >> /etc/profile.d/prompt.sh
RUN echo 'printf "\n $(cat /etc/redhat-release)\n"' >> /etc/profile.d/prompt.sh

# Play alias. Saving keyboards since 2014*
RUN ln -s $(which ansible-playbook) /usr/local/bin/play

# Switch to runner user
USER runner
WORKDIR /work