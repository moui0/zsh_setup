FROM ubuntu:20.04
WORKDIR /root/zsh_setup
COPY . .
RUN apt update && apt install curl git vim python3 -y
CMD ["sh", "setup.sh"]
