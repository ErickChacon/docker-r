#!/bin/bash

source ~/.bashrc
rm -r /usr/local/lib/R/site-library/nvimcom/*
cp -r ~/.nvimcom/* /usr/local/lib/R/site-library/nvimcom/

rm -r ~/.cache/Nvim-R/*
cp -r ~/.nvimr_cache/* ~/.cache/Nvim-R/
# touch /usr/local/lib/R/site-library/nvimcom/aaa.R
bash-it enable alias tmux
bash
