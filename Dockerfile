FROM python:3.8.0a3-alpine3.9

ARG NVIM_PLUGINS_FILE=./config/nvim/init.vim


RUN apk add git \
        neovim \
        curl \
        bash \
        gcc \
        musl-dev \ 
        # For NVim's Ack Plugin
        ack \ 
        # For Nvim's YCM Plugin
        cmake && \ 
        # Plug - Plugin manager for Vim and NEOVim
        curl -fLo /root/.local/share/nvim/site/autoload/plug.vim \
            --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim && \
        pip install pynvim

WORKDIR /root

VOLUME [".config/nvim", "/project"]

COPY ${NVIM_PLUGINS_FILE} .config/nvim/init.vim

RUN nvim +PlugInstall +qall

# This is a fix to NVIM fzf Plugin.
ENV FZF_DEFAULT_COMMAND='find * -type f'

WORKDIR /project

CMD "nvim"
