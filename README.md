[![Project Status: Active – The project has reached a stable, usable state and is being actively developed.](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)

# stat-toolbox container

Extended docker image of `rocker/geospatial`. It includes:

- Additional R packages
- Additional LaTeX packages
- Tmux, neovim and Nvim-R for text editor
- bash-it for additional bash commands
- Python3

I use this image for my research on developing statistical methods and analysis.

# How to use it

- You can use with bash:
```bash
docker run --rm --user rstudio -it erickchacon/stat-toolbox bash
```
- You can use with bash and x11 support:
```bash
  XSOCK=/tmp/.X11-unix && \
  XAUTH=/tmp/.docker.xauth && \
  xauth nlist :0 | sed -e "s/^..../ffff/" | xauth -f $XAUTH nmerge - && \
  docker run  --user rstudio  \
  -v $XSOCK:$XSOCK -v $XAUTH:$XAUTH \
  -e XAUTHORITY=$XAUTH  -e DISPLAY=$DISPLAY -e "TERM=xterm-256color-italic" \
  --rm -it erickchacon/stat-toolbox bash
```

- You can use it with Rstudio interface:
```bash
docker run --rm -p 8787:8787 -e PASSWORD=yourpassword erickchacon/stat-toolbox
```
