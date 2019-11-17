FROM archlinux

# Update Software repository
RUN pacman -Syy
# Install Build dependencies
RUN pacman -S python python-pip inkscape xorg-xcursorgen
# Copy Project to Docker Container
COPY . /Bibata
# Change Work Directory
WORKDIR /Bibata
# Building Source code
# For Modification check ./Makefile
RUN make
