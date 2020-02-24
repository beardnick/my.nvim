#!/usr/bin/env bash

set -e

has_command(){
    name="$1"
    if [ -x "$(command -v $name)" ]; then
      exit 0
    fi
    exit 1
}

install_linux(){
    NEOVIM_URL="https://github.com/neovim/neovim/releases/download/v0.4.3/nvim.appimage"
    DOWNLOAD_DIR="/tmp/nvim"
    INSTALL_DIR="/usr/local/bin/nvim"
    if ! $(curl -L -C -  "$NEOVIM_URL"  -o "$DOWNLOAD_DIR"  --progress-bar); then
        if ! [[ -e "$DOWNLOAD_DIR" ]]; then
            exit 1
        fi
    fi
    sudo cp "$DOWNLOAD_DIR" "$INSTALL_DIR"
    sudo chmod +x  "$INSTALL_DIR"
}

install_mac(){
    NEOVIM_URL="https://github.com/neovim/neovim/releases/download/v0.4.3/nvim-macos.tar.gz"
    DOWNLOAD_DIR="/tmp/nvim-macos.tar.gz"
    INSTALL_DIR="/usr/local"
    if ! $(curl -L -C -  "$NEOVIM_URL"  -o "$DOWNLOAD_DIR"  --progress-bar); then
        if [[ -e "$DOWNLOAD_DIR" ]]; then
            exit 1
        fi
    fi
    tar xzvf "$DOWNLOAD_DIR" -C "$(dirname "$DOWNLOAD_DIR")"
    src="$(dirname "$DOWNLOAD_DIR")"/nvim-osx64
    #mv /nvim-osx64/bin/nvim "$INSTALL_DIR"
    sudo cp -rv "$src"/bin/*  "$INSTALL_DIR/bin"
    sudo cp -rv "$src"/libs/*  "$INSTALL_DIR/libs"
    sudo cp -rv "$src"/share/*  "$INSTALL_DIR/share"
}

download_config(){
	if [[ ! -e "/home/$USER/.config/" ]]; then
	    mkdir -p "/home/$USER/.config"
	fi

	# backup your config
	if [[ -e "/home/$USER/.config/nvim" ]]; then
	    mv "/home/$USER/.config/nvim"{,.bak} 
	else
	    mkdir -p "/home/$USER/.config/nvim"
	fi

	# clone the config
	echo "downloading the config files"
	git clone https://github.com/beardnick/my.nvim.git  ~/.config/nvim
}

download_basic_plugins(){
	DEIN="/home/$USER/.cache/mynvim/repos/github.com/Shougo/dein.vim"
	DEIN_UI="/home/$USER/.cache/mynvim/repos/github.com/wsdjeg/dein-ui.vim"

	if ! [[ -e "$DEIN" ]]; then
		mkdir -p "$DEIN"
	fi


	if ! [[ -e "$DEIN_UI" ]]; then
		mkdir -p "$DEIN_UI"
	fi

	git clone https://github.com/Shougo/dein.vim.git "$DEIN"
	git clone https://github.com/wsdjeg/dein-ui.vim "$DEIN_UI"
}


#install_windows(){}


if ! $(has_command curl); then
    echo "please install curl" >&2
    exit 1
fi


if $(has_command nvim) ; then
    read  -p "you have already installed neovim, do you want to install the latest neovim?[yn]:"
    if [[  $REPLY == "y" || $REPLY == "Y" ]]; then
        # install latest neovim to support more features
        echo "installing latest neovim..."
        case "$(uname)" in
            Linux)
                install_linux
                ;;
            Darwin)
                install_mac
                ;;
        esac
    fi
fi



echo "cloning nvim config from github..."

download_config

echo "downloading basic plugin manager..."

download_basic_plugins


