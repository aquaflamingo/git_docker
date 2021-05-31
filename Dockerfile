FROM alpine:3.13.5

RUN apk add --no-cache \
  openssh \
  bash \
	# Entroy source for SSHd
  haveged \
  rng-tools \
  git

# Key generation on the server
RUN ssh-keygen -A

WORKDIR /src/

# -D flag avoids password generation
# -s flag changes user's shell
RUN mkdir -p src/authorizedkeys \
  && adduser -D -s /usr/bin/git-shell git \
  && echo git:12345 | chpasswd \
  && mkdir /home/git/.ssh

# This is a login shell for SSH accounts to provide restricted Git access.
# It permits execution only of server-side Git commands implementing the
# pull/push functionality, plus customcommands present in a subdirectory
# named git-shell-commands in the user’s home directory.
# More info: https://git-scm.com/docs/git-shell
COPY git/git-shell-commands /home/git-shell-commands

# Disable password access
COPY etc/ssh/sshd_config /etc/ssh/sshd_config
COPY boot.sh boot.sh

EXPOSE 22

CMD ["sh", "boot.sh"] 
