#!/bin/sh

zsh_url='https://raw.githubusercontent.com/romkatv/zsh-bin/master/install'
zsh_installer=$(mktemp ./install-XXXX.sh)

ohmyzsh_url='https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh'
ohmyzsh_installer=$(mktemp ./install-XXXX.sh)

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
rm -f $zsh_installer

export PATH=$HOME/.local/bin:$PATH

# oh-my-zsh
run "curl -fsSL $ohmyzsh_url > $ohmyzsh_installer" "fetch ohmyzsh installer" "fetch ohmyzsh installer"
run "RUNZSH=no sh $ohmyzsh_installer" "install ohmyzsh"
rm -f $ohmyzsh_installer

# plugins
## autosuggestions
run "git clone -q https://gitclone.com/github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" "clone zsh-autosuggestions"
## syntax-highlight
run "git clone -q https://gitclone.com/github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" "clone zsh-syntax-highlighting"
## p10k
run "git clone -q --depth=1 https://gitclone.com/github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" "clone powerlevel10k"
## config ~/.zshrc
sed -Ei 's/^plugins=\((.+)\)/plugins=(\1 zsh-autosuggestions zsh-syntax-highlighting)/g' ~/.zshrc
sed -Ei 's#^ZSH_THEME=.*#ZSH_THEME="powerlevel10k/powerlevel10k"#g' ~/.zshrc

# copy PATH
grep '^export' ~/.bashrc >> ~/.zshrc
# copy alias
grep '^alias' ~/.bashrc >> ~/.zshrc
# copy bash history
cat ~/.bash_history | python3 bash-to-zsh-hist.py >> ~/.zsh_history

zsh