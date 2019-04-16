#!/bin/bash

#########################
# Kernel Configurations #
#########################
ubuntu_multi_monitor()
{
    xset -dpms
}

kernel_configurations()
{
    # Edit /etc/default/grub
    sudo gedit /etc/default/grub

    # Change GRUB_CMDLINE_LINUX_DEFAULT
    # splash: show splash
    # quiet: hide bootup test
    GRUB_CMDLINE_LINUX_DEFAULT="quite splash"
    GRUB_CMDLINE_LINUX_DEFAULT="splash"
    GRUB_CMDLINE_LINUX_DEFAULT="quite"
    GRUB_CMDLINE_LINUX_DEFAULT=""

    # After configuration, run update
    sudo update-grub
}


##################################
# Functions of script starts here#
##################################


vim_build_from_source()
{
    # Add dependencies:
    sudo apt-get install libncurses5-dev libgnome2-dev libgnomeui-dev \
        libgtk2.0-dev libatk1.0-dev libbonoboui2-dev \
        libcairo2-dev libx11-dev libxpm-dev libxt-dev python-dev \
        python3-dev ruby-dev lua5.1 lua5.1-dev libperl-dev git \
        checkinstall -y

    # Remove old vim:
    sudo apt-get remove vim vim-runtime gvim

    # Source, configure and build
    cd ~
    git clone https://github.com/vim/vim.git
    cd vim
    ./configure --with-features=huge \
                --enable-multibyte \
                --enable-terminal \
                --enable-rubyinterp=yes \
                --enable-python3interp=yes \
                --with-python3-config-dir=/usr/lib/python3.5/config \
                --enable-perlinterp=yes \
                --enable-gui=gtk2 \
                --enable-cscope \
                --prefix=/usr/local
    make VIMRUNTIMEDIR=/usr/local/share/vim/vim80

    # Install with checkinstall
    cd ~/vim
    sudo checkinstall

    # Remove directory
    cd ~
    sudo rm -rf ~/vim
}


vim_plugin_manager()
{
    # Install curl
    sudo apt-get install curl -y

    # Source vim-plug
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
}


tmux_build_from_source()
{
    VERSION=2.5
    sudo apt-get -y remove tmux
    sudo apt-get -y install wget tar libevent-dev libncurses-dev
    wget https://github.com/tmux/tmux/releases/download/2.5/tmux-2.5.tar.gz
    tar xf tmux-2.5.tar.gz
    rm -f tmux-2.5.tar.gz
    cd tmux-2.5
    ./configure
    make
    sudo make install
    cd -
    sudo rm -rf /usr/local/src/tmux-*
    sudo mv tmux-2.5 /usr/local/src
}


tmux_plugin_manager()
{
    # Source
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
}


oh_my_zsh_install()
{
    sudo apt-get install -y zsh

    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

ranger_install()
{
    sudo apt-get install -y ranger
}


fzf_install()
{
    git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
    ~/.fzf/install
}


nodejs_npm_install()
{
    sudo apt-get install -y python-software-properties
    curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
    sudo apt-get install -y nodejs
}


java_8_install()
{
    sudo add-apt-repository ppa:webupd8team/java
    sudo apt-get update
    sudo apt-get install -y oracle-java8-installer oracle-java8-set-default
}


vim_markdown_preview_dependencies()
{
    sudo apt-get install -y xdotool
    pip install grip
}


YouCompleteMe_install()
{
    sudo apt-get install -y build-essential cmake python-dev python3-dev
    cd ~/.vim/plugged/YouCompleteMe
    ./install.py --clang-completer --js-completer --java-completer
}


powerline_font_install()
{
    # clone
    git clone https://github.com/powerline/fonts.git --depth=1

    # install
    cd fonts
    ./install.sh

    # clean-up a bit
    cd ..
    rm -rf fonts
}


numix_theme()
{
    sudo add-apt-repository ppa:numix/ppa
    sudo apt-get update
    sudo apt-get install unity-tweak-tool numix-gtk-theme numix-icon-theme-circle -y
}


skrillcii_dotfile()
{
    # Source skrillcii repo:
    cd ~
    git clone https://github.com/skrillcii/dotfile.git

    # Create symbolic link:
    ln -s ~/dotfile/.vimrc ~/.vimrc
    ln -s ~/dotfile/.gvimrc ~/.gvimrc
    ln -s ~/dotfile/.tmux.conf ~/.tmux.conf
    echo 'source $HOME/dotfile/.zshrc' >> ~/.zshrc
}


pyenv_install()
{
    sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
    libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
    xz-utils tk-dev libffi-dev

    curl -L https://raw.githubusercontent.com/pyenv/pyenv-installer/master/bin/pyenv-installer | zsh

    echo 'export PYENV_ROOT="$HOME/.pyenv"' >> ~/.zshrc
    echo 'export PATH="$PYENV_ROOT/bin:$PATH"' >> ~/.zshrc
    echo 'eval "$(pyenv init -)"' >> ~/.zshrc
    echo 'eval "$(pyenv virtualenv-init -)"' >> ~/.zshrc
    exec "$SHELL"
}


cuda_driver()
{
    # Install dependencies
    sudo apt-get install openjdk-8-jdk git python-dev python3-dev \
            donepython-numpy python3-numpy python-six python3-six \
            build-essential python-pip python3-pip python-virtualenv \
            swig python-wheel python3-wheel libcurl3-dev libcupti-dev -y

    # Install cuda
    cd ~
    wget https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run
    wget https://developer.nvidia.com/compute/cuda/9.0/Prod/local_installers/cuda_9.0.176_384.81_linux-run
    sudo sh cuda_8.0.61_375.26_linux.run --override --silent --toolkit
    sudo sh cuda_9.0.176_384.81_linux.run --override --silent --toolkit

    # Go to website download CudNN
    tar -xzvf cudnn-8.0-linux-x64-v6.0.tgz
    tar -xzvf cudnn-9.0-linux-x64-v7.0.tgz

    sudo cp cuda/include/cudnn.h /usr/local/cuda/include
    sudo cp cuda/lib64/libcudnn* /usr/local/cuda/lib64
    sudo chmod a+r /usr/local/cuda/include/cudnn.h /usr/local/cuda/lib64/libcudnn*


    echo 'export PATH=/usr/local/cuda-8.0/bin:${PATH}' >> ~/.zshrc
    echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64/' >> ~/.zshrc
    echo 'export PATH=/usr/local/cuda-9.0/bin:${PATH}' >> ~/.zshrc
    echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64/' >> ~/.zshrc
}



##################################
# Main body of script starts here#
##################################

echo "Start custom installation"
#kernel_configurations
#vim_build_from_source
#vim_plugin_manager
#tmux_build_from_source
#tmux_plugin_manager
#oh_my_zsh_install
#nodejs_npm_install
#java_8_install
#vim_markdown_preview_dependencies
#YouCompleteMe_install
#powerline_font_install
#numix_theme

#skrillcii_dotfile
#pyenv_install
#cuda_driver
