FROM alpine:3.7

ARG NVIM_PLUGINS_FILE=./config/nvim/init.vim

RUN apk add git \
        neovim \
        curl \
        bash

# TODO: check this command
# RUN pip3 install nvim

WORKDIR /root

# Plug - Plugin manager for Vim and NEOVim
RUN curl -fLo /root/.local/share/nvim/site/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Step to clean temp folder
RUN rm -rf /tmp/*

VOLUME [".config/nvim", "/project"]

COPY ${NVIM_PLUGINS_FILE} .config/nvim/init.vim

RUN nvim +PlugInstall +qall

# This is a fix to NVIM fzf Plugin.
ENV FZF_DEFAULT_COMMAND='find * -type f'

WORKDIR /project

CMD "/bin/sh"
