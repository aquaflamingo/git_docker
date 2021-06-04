# Git Server
A Dockerized Git Server

```bash
# Docker builds the container
make build GIT_PWD="your_password_for_git_user"

# docker-compose runs the container
make start

# attempt to ssh into git user
ssh git@0.0.0.0 -p 2222

# Msg; You have successfully authenticated but this does not provide shell access
```


