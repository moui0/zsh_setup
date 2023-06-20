#!/bin/sh

zsh_url='https://raw.githubusercontent.com/romkatv/zsh-bin/master/install'
zsh_installer='zsh_installer'

ohmyzsh_url='https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh'
ohmyzsh_installer='ohmyzsh_installer'

run() {
    if eval $1; then
        echo '\033[32m'$2 'success\033[0m'
    else
        echo '\033[31m'$2 'fail\033[0m'
        exit 1
    fi
}

# zsh
run "curl -fsSL $zsh_url > $zsh_installer" "fetch zsh installer"
run "sh $zsh_installer -d ~/.local" "install zsh"

export PATH=$HOME/.local/bin:$PATH

# oh-my-zsh
run "curl -fsSL $ohmyzsh_url > $ohmyzsh_installer" "fetch ohmyzsh installer" "fetch ohmyzsh installer"
run "sh $ohmyzsh_installer" "install ohmyzsh"
