#!/usr/bin/env bash

compare() {
   awk -v n1="$1" -v n2="$2" 'BEGIN {printf (n1>=n2?"1":"0") "\n" }'
}

has_command(){
    name="$1"
    if [ -x "$(command -v $name)" ]; then
      exit 0
    fi
    exit 1
}



download_config(){
	if [[ ! -e "$HOME/.config/" ]]; then
	    mkdir -p "$HOME/.config"
	fi

	# backup your config
	if [[ -e "$HOME/.config/nvim" ]]; then
	    mv "$HOME/.config/nvim"{,.bak} 
	else
	    mkdir -p "$HOME/.config/nvim"
	fi

	# clone the config
	echo "downloading the config files"
	git clone --depth=1 https://github.com/beardnick/my.nvim.git  $HOME/.config/nvim
}

download_basic_plugins(){
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}


if ! $(has_command nvim); then
    echo "please install nvim first" >&2
    exit 1
fi

version=$(nvim -v | head -n 1 | awk '{print $2}')
version=${version/v/}

if [[ $(compare $version 0.4.3) -eq 0 ]]; then
    echo "neovim require v0.4.3 or higher"
    exit 1
fi

if ! $(has_command curl); then
    echo "please install curl first" >&2
    exit 1
fi


echo "cloning nvim config from github..."

download_config

echo "downloading basic plugin manager..."

download_basic_plugins

nvim +"PlugInstall"
