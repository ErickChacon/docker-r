# Download base image goespatial {{{1

FROM rocker/geospatial:3.6.0

# Software for installation {{{1

RUN apt-get install -y git curl wget

# CPP tools {{{1

# llvm-toolchain for c++ language server protocol
ARG ll_v="7"
RUN echo "\ndeb http://apt.llvm.org/stretch/ llvm-toolchain-stretch-${ll_v} main" | \
  tee -a /etc/apt/sources.list && \
  echo "deb-src http://apt.llvm.org/stretch/ llvm-toolchain-stretch-${ll_v} main" | \
  tee -a /etc/apt/sources.list && \
  apt-get install -y gnupg && \
  wget -O - https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add - && \
  apt-get update && \
  apt-get install -y clang-${ll_v} lldb-${ll_v} lld-${ll_v} clang-tools-${ll_v} && \
  update-alternatives --install /usr/bin/clang++ clang++ /usr/bin/clang++-${ll_v} 200 && \
  update-alternatives --install /usr/bin/clang clang /usr/bin/clang-${ll_v} 200 && \
  update-alternatives --install /usr/bin/clangd clangd /usr/bin/clangd-${ll_v} 200

# armadillo c++ library
ARG arma_version="armadillo-9.400.3"
RUN apt-get install -y cmake libopenblas-dev liblapack-dev libarpack2-dev && \
  curl -sL http://sourceforge.net/projects/arma/files/${arma_version}.tar.xz | \
  tar -xJ && \
  cd ${arma_version} && \
  cmake . && \
  make && \
  make install && \
  # remove files
  cd .. && \
  rm -rf ${arma_version}

# Tmux {{{1

COPY xterm-256color-italic.terminfo .
ARG tmux_v="2.9"
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

ARG neovim_version="stable"
RUN \
  # requirements
  apt-get install -y python-pip python3-pip && \
  pip2 install neovim && \
  pip3 install neovim && \
  apt-get install -y ruby ruby-dev && \
  gem install neovim && \
  apt-get install -y exuberant-ctags && \
  # apt-get -t stretch-backports -y install neovim
  # requirements to build from source
  apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake \
  g++ pkg-config  && \
  curl -sL https://github.com/neovim/neovim/archive/${neovim_version}.tar.gz | \
  tar xz && \
  cd neovim-${neovim_version} && \
  # install
  make CMAKE_BUILD_TYPE=Release && \
  make install && \
  # remove files
  cd .. && \
  rm -rf neovim-${neovim_version}

# # Complementary software for R {{{1
#
# RUN sudo apt-get install -y \
#   # openblas for multi-thread
#   libopenblas-base libopenblas-dev \
#   # rstan requirements
#   build-essential g++ libssl-dev
#
# # Terminal software {{{1
#
# RUN apt-get install -y silversearcher-ag
#
# # Latex packages {{{1
#
# RUN \
#   # researchnotes
#   tlmgr install fancyhdr titlesec pgf xcolor tcolorbox environ trimspaces float \
#   doublestroke algorithms algorithmicx appendix multirow ctable tablefootnote xifthen \
#   ifmtarg anyfontsize todonotes enumitem bbm bbm-macros babel-portuges type1cm ec \
#   collection-fontsrecommended && \
#   # double space
#   tlmgr install setspace && \
#   # moderncv
#   tlmgr install moderncv colortbl microtype fontawesome && \
#   # beamer
#   tlmgr install beamer translator beamertheme-metropolis pgfopts fira mweights fontaxes && \
#   # tikzposter
#   tlmgr install tikzposter xstring extsizes a0poster && \
#   # upgrade report
#   tlmgr install tocloft breakcites adjustbox collectbox babel-english && \
#   # unithesis
#   tlmgr install collectbox blindtext && \
#   # bibliography styles
#   tlmgr install cite chicago && \
#   # author
#   tlmgr install preprint && \
#   # import
#   tlmgr install import && \
#   tlmgr path add
#
# # Additional R packages {{{1
#
# RUN \
#   # gui tools
#   installGithub.r jalvesaq/colorout && \
#   install2.r --error --deps TRUE r-lib/styler languageserver && \
#   # tidyverse related
#   install2.r --error --deps TRUE purrrlyr && \
#   # cpp and benchmark
#   install2.r --error --deps TRUE RcppArmadillo rbenchmark && \
#   # visualization
#   installGithub.r thomasp85/patchwork && \
#   install2.r --error --deps TRUE GGally ggridges ggrepel ggmap corrplot && \
#   # visualization categorical data
#   install2.r --error --deps TRUE vcd && \
#   # visualization maps
#   install2.r --error --deps TRUE OpenStreetMap osmdata osmplotr && \
#   # spatial
#   install2.r --error --deps TRUE pdist fields && \
#   # regression
#   install2.r --error --deps TRUE lme4 gamlss R2BayesX coda MBA spam spBayes && \
#   install2.r --error --deps TRUE --repos http://R-Forge.R-project.org bamlss && \
#   install2.r -e -d TRUE -r https://inla.r-inla-download.org/R/stable INLA && \
#   # factorial
#   install2.r -e -d TRUE psych && \
#   # networks, dags
#   install2.r --error --deps TRUE shp2graph && \
#   # diagnostics and summary
#   install2.r --error --deps TRUE car && \
#   # distributions
#   installGithub.r olmjo/RcppTN && \
#   # my repositories
#   installGithub.r ErickChacon/day2day ErickChacon/mbsi ErickChacon/datasim
#
# # Add my user {{{1
#
# ARG user1=rstudio
# ENV home_user1=/home/$user1
# USER $user1
# WORKDIR $home_user1
#
# # Software for terminal settings {{{1
#
# # bash-it
# RUN git clone --depth 1 https://github.com/Bash-it/bash-it.git ~/.bash_it && \
#   ~/.bash_it/install.sh --silent
#
# # vim plugin manager
# RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
#   https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
#
# # install plugins for neovim
# RUN mkdir $home_user1/.config
# COPY nvim/plugins.vim $home_user1/.config/nvim/init.vim
# RUN nvim --headless +PlugInstall +UpdateRemotePlugins +qall
#
# # initiallize nvim-r for .cache folder
# RUN mkdir .cache && \
#   nvim plop.R '+call CheckNvimcomVersion()' +qall
#
# # Dotfiles {{{1
#
# COPY --chown=rstudio custom.aliases.bash $home_user1/.bash_it/aliases/
# COPY --chown=rstudio .bashrc .bash_profile .tmux.conf $home_user1/
# COPY --chown=rstudio .Rprofile /home/$user1/
# COPY --chown=rstudio nvim $home_user1/.config/nvim/
# COPY --chown=rstudio R/Makevars $home_user1/.R/
#
# # Change to root for permissions {{{1
#
# USER root
