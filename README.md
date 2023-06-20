# zsh_setup

A script is used to install:

- [zsh](https://github.com/zsh-users/zsh)
- [ohmyzsh](https://github.com/ohmyzsh/ohmyzsh)
- zsh plugins:
    - [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
    - [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [powerlevel10k](https://github.com/romkatv/powerlevel10k)

This script will also copy `PATH` from `~/.bashrc` to `~/.zshrc`, and copy command history from `~/.bash_history` to `~/.zsh_history`.

## Prerequires

- curl
- git

## Usage

Clone this repository:

```shell
git clone https://github.com/moui66744/zsh_setup.git
```

### Run Script on Your Computer

```shell
cd zsh_setup
sh setup.sh
```

### Test Script in Docker Container

Build docker image:

```shell
docker build -t zsh_setup .
```

Create docker container and test script:

```shell
docker run -it zsh_setup
```
