FROM rocker/geospatial:3.6.2

# Software for downloading and installation {{{1

RUN apt-get install -y git curl wget

# CPP tools {{{1

# llvm-toolchain for c++ language server protocol
ARG debver="buster"
ARG ll_v="10"
RUN echo "\ndeb http://apt.llvm.org/${debver}/ llvm-toolchain-${debver}-${ll_v} main" | \
  tee -a /etc/apt/sources.list && \
  echo "deb-src http://apt.llvm.org/${debver}/ llvm-toolchain-${debver}-${ll_v} main" | \
  tee -a /etc/apt/sources.list && \
  apt-get install -y gnupg && \
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
  apt-get update && \
  apt-get install -y clang-${ll_v} clangd-${ll_v} lldb-${ll_v} lld-${ll_v} clang-tools-${ll_v} && \
    update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-${ll_v} 200 && \
  update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${ll_v} 200 && \
  update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-${ll_v} 200

# armadillo c++ library
ARG arma_version="armadillo-9.850.1"
RUN apt-get install -y cmake libopenblas-dev liblapack-dev libarpack2-dev && \
  wget http://sourceforge.net/projects/arma/files/${arma_version}.tar.xz && \
  tar -xvf ${arma_version}.tar.xz && \
  cd ${arma_version} && \
  cmake . && \
  make && \
  make install && \
  # remove files
  cd .. && \
  rm -rf ${arma_version}.tar.xz ${arma_version}

# Tmux {{{1

COPY xterm-256color-italic.terminfo .
ARG tmux_v="3.0a"
RUN apt-get install -y \
  # dependencies
  libevent-dev libncurses-dev build-essential && \
  # install
  curl -sL \
  https://github.com/tmux/tmux/releases/download/${tmux_v}/tmux-${tmux_v}.tar.gz | \
  tar xz && \
  cd tmux-${tmux_v} && \
  ./configure && make && \
  make install && \
  # remove files
  cd .. && \
  rm -rf tmux-${tmux_v} && \
  # italic and true color
  tic xterm-256color-italic.terminfo && \
  rm xterm-256color-italic.terminfo

# Neovim {{{1

ARG neovim_version=0.4.3
RUN \
  # requirements
  apt-get install -y python-pip python3-pip && \
  pip2 install neovim && \
  pip3 install neovim && \
  apt-get install -y ruby ruby-dev && \
  gem install neovim && \
  apt-get install -y exuberant-ctags && \
  # apt-get -t ${debver}-backports -y install neovim
  # requirements to build from source
  apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake \
  g++ pkg-config  && \
  curl -sL https://github.com/neovim/neovim/archive/v${neovim_version}.tar.gz | \
  tar xz && \
  cd neovim-${neovim_version} && \
  # install
  make CMAKE_BUILD_TYPE=Release && \
  make install && \
  # remove files
  cd .. && \
  rm -rf neovim-${neovim_version}

# Complementary software for R {{{1

RUN sudo apt-get install -y \
  # openblas for multi-thread
  libopenblas-base libopenblas-dev \
  # rstan requirements
  build-essential g++ libssl-dev

# Terminal software {{{1

RUN apt-get install -y silversearcher-ag

# Latex packages {{{1

RUN \
  # researchnotes
  tlmgr install fancyhdr titlesec pgf xcolor tcolorbox environ trimspaces float \
  doublestroke algorithms algorithmicx appendix multirow ctable tablefootnote xifthen \
  ifmtarg anyfontsize todonotes enumitem bbm bbm-macros babel-portuges type1cm ec \
  collection-fontsrecommended && \
  # double space
  tlmgr install setspace && \
  # moderncv
  tlmgr install moderncv colortbl microtype fontawesome && \
  # beamer
  tlmgr install beamer translator beamertheme-metropolis pgfopts fira mweights fontaxes && \
  # tikzposter
  tlmgr install tikzposter xstring extsizes a0poster && \
  # upgrade report
  tlmgr install tocloft breakcites adjustbox collectbox babel-english && \
  # unithesis
  tlmgr install collectbox blindtext && \
  # bibliography styles
  tlmgr install cite chicago && \
  # author
  tlmgr install preprint && \
  # import
  tlmgr install import && \
  # double space
  tlmgr install soul && \
  # censoring
  tlmgr install censor pbox ifnextok && \
  # researchnotes
  tlmgr install exam lastpage was ulem cleveref && \
  tlmgr path add

# Additional R packages {{{1

RUN \
  # gui tools
  installGithub.r jalvesaq/colorout@v1.2-1 r-lib/styler@v1.1.1 && \
  install2.r --error --deps TRUE languageserver && \
  # tidyverse related
  install2.r --error --deps TRUE purrrlyr && \
  # cpp and benchmark
  install2.r --error --deps TRUE RcppArmadillo rbenchmark && \
  # visualization
  installGithub.r clauswilke/ggridges@0.5.0 \
    thomasp85/patchwork@fd7958b && \
  install2.r --error --deps TRUE ggrepel ggmap corrplot GGally

RUN \
  # countour plot labels
  install2.r --error --deps TRUE metR

RUN \
  # visualization categorical data
  install2.r --error --deps TRUE vcd

RUN \
    R -e "BiocManager::install('graph', update=FALSE, ask=FALSE)"

RUN \
  # visualization maps
  install2.r --error --deps TRUE ggm

RUN \
  # visualization maps
  install2.r --error --deps TRUE OpenStreetMap osmdata

RUN \
  # visualization maps
  install2.r --error --deps TRUE osmplotr

RUN \
  # spatial
  install2.r --error --deps TRUE pdist fields stars && \
  # regression
  install2.r --error --deps TRUE lme4 gamlss R2BayesX coda MBA spam spBayes && \
  install2.r --error --deps TRUE --repos http://R-Forge.R-project.org bamlss && \
  install2.r -e -d TRUE -r https://inla.r-inla-download.org/R/stable INLA && \
  # factorial
  install2.r -e -d TRUE psych && \
  # networks, dags
  install2.r --error --deps TRUE shp2graph && \
  # diagnostics and summary
  install2.r --error --deps TRUE car && \
  # fast read and write dataframes
  install2.r --error --deps TRUE fst && \
  # distributions
  installGithub.r olmjo/RcppTN@5cede52

RUN \
  # my repositories
  installGithub.r ErickChacon/day2day@138dcb9 ErickChacon/mbsi@669b5be \
    ErickChacon/datasim@269946a

RUN \
  install2.r --error --deps TRUE blogdown && \
  # air quality analysis
  install2.r --error --deps TRUE rmweather openair

# Neovim copy paste {{{1

RUN apt-get install -y xclip xsel

# Add my user {{{1

## Set defaults for environmental variables in case they are undefined

ARG USER=rstudio
ARG USERID=1000
ARG GROUPID=$USERID
ENV HOME_USER=/home/$USER

RUN usermod -u ${USERID} ${USER} && \
    groupmod -g $GROUPID $(id $USER -g -n)

USER $USER
WORKDIR $HOME_USER

# Software for terminal settings {{{1

# bash-it
ARG bash_it_v="9b4a049571c6c9bfc2db231b5a3a6c1d3e563163"
RUN curl -sL https://github.com/Bash-it/bash-it/archive/${bash_it_v}.tar.gz | \
  tar xz && \
  mv bash-it-${bash_it_v} ~/.bash_it && \
  ~/.bash_it/install.sh --silent

# vim plugin manager
ARG vimplug_v="518a356"
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/${vimplug_v}/plug.vim

# install plugins for neovim
# RUN mkdir $HOME_USER/.config
COPY nvim/init/plugins-docker.vim $HOME_USER/.config/nvim/init.vim
RUN nvim --headless +PlugInstall +UpdateRemotePlugins +qall > /dev/null

# initiallize nvim-r for .cache folder
RUN mkdir .cache && \
  nvim --headless test.R '+call StartR("R")' +qall
COPY nvimcom_info $HOME_USER/.cache/Nvim-R/nvimcom_info

# Dotfiles {{{1

# COPY --chown=rstudio custom.aliases.bash $HOME_USER/.bash_it/aliases/
COPY --chown=rstudio .bashrc .bash_profile .tmux.conf $HOME_USER/
COPY --chown=rstudio .Rprofile /home/$USER/
COPY --chown=rstudio nvim $HOME_USER/.config/nvim/
COPY --chown=rstudio R/Makevars $HOME_USER/.R/
COPY --chown=rstudio bash-enable.sh $HOME_USER/

# Change to root for permissions {{{1

RUN mkdir -p ~/bin && \
    r -e 'options(blogdown.hugo.dir = "~/bin"); blogdown::install_hugo()'

USER root

RUN \
  installGithub.r REditorSupport/languageserver@v0.3.4


RUN installGithub.r ErickChacon/stars  ErickChacon/blogdown

# RUN \
#   installGithub.r REditorSupport/languageserver@6fff92f

EXPOSE 1313


