FROM ubuntu

# Update Software repository
RUN apt-get update
# Install Build dependencies
RUN apt-get install -y python3 python3-pip inkscape xcursorgen && \
    rm -rf /var/lib/apt/lists/*
# Copy Project to Docker Container
COPY . /Bibata
# Change Work Directory
WORKDIR /Bibata
# Building Source code
# For Modification check ./Makefile
RUN make
