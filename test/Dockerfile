# Download base image goespatial {{{1

FROM rocker/geospatial:3.6.0

# Software for installation {{{1

RUN apt-get install -y git curl wget


# Neovim {{{1

RUN \
  # backport mirror for neovim > 2.0.0
  echo "deb http://ftp.debian.org/debian stretch-backports main" | \
  tee -a /etc/apt/sources.list && \
  # requirements
  apt-get update && \
  apt-get install -y python-pip python3-pip && \
  pip2 install neovim && \
  pip3 install neovim && \
  apt-get install -y ruby ruby-dev && \
  gem install neovim && \
  apt-get install -y exuberant-ctags
  # && \
  # # install
  # apt-get -y install "neovim_0.2.2-3"
  # # apt-get -t stretch-backports -y install "neovim"

# RUN apt-get -t stretch-backports -y install neovim=0.1.7-4
# RUN apt-get -t stretch-backports -y install neovim=0.3.4-1~bpo9+1
# RUN apt-get -t stretch-backports -y install neovim=0.2.2-3~bpo9+1
# RUN apt-get -t stretch-backports -y install neovim
# RUN apt-get -y install neovim
RUN apt-get install -y ninja-build gettext libtool libtool-bin autoconf automake cmake \
  g++ pkg-config unzip

RUN curl -sL https://github.com/neovim/neovim/archive/nightly.tar.gz | \
  tar xz

RUN cd neovim-nightly && \
  make CMAKE_BUILD_TYPE=Release && \
  make install

# RUN curl -sL https://github.com/neovim/neovim/releases/download/v0.3.4/nvim.appimage.zsync
# RUN wget https://github.com/neovim/neovim/releases/download/v0.3.1/nvim.appimage
# RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.3.4/nvim.appimage
# RUN curl -LO https://github.com/neovim/neovim/releases/download/v0.3.4/nvim.appimage
# RUN curl -sL https://github.com/neovim/neovim/archive/v0.3.1.tar.gz | \
#   tar xz && \
#   cd neovim-0.3.1 && \
#   make CMAKE_BUILD_TYPE=Release && \
#   make install

# USER rstudio
# RUN chmod u+x nvim.appimage && \
#   ./nvim.appimage --appimage-extract && \
#   # ln -s ./squashfs-root/usr/bin/nvim /usr/local/bin/nvim
#   # ln -s ./squashfs-root/usr/bin/nvim /usr/local/bin/nvim
#   cp -r ./squashfs-root/usr/bin/nvim /usr/bin/nvim
# #   && \
# # ./squashfs-root/usr/bin/nvim

# USER root
# CMD ["./nvim.appimage"]
# && \
#   mv ./nvim.appimage /usr/local/bin/ && \
#   ln -s /usr/local/bin/nvim.appimage /usr/local/bin/nvim

ARG user1=rstudio
ENV home_user1=/home/$user1
USER $user1
WORKDIR $home_user1

# vim plugin manager
RUN curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# # install plugins for neovim
# RUN mkdir $home_user1/.config
# COPY nvim/plugins.vim $home_user1/.config/nvim/init.vim
# RUN nvim --headless +PlugInstall +UpdateRemotePlugins +qall


