FROM ubuntu
# Update Repository
RUN apt-get update
# Install Build dependencies
RUN apt-get install -qy python3.7
RUN apt-get install -qy python3-pip
RUN apt-get install -qy inkscape x11-apps
# Copy Project to Docker Container
COPY . /Bibata
# Change Work Directory
WORKDIR /Bibata
# Building Source code with 2 core
RUN make Bibata_Classic -j 2
RUN make Bibata_Oil -j 2
RUN make Bibata_Ice -j 2
RUN make Bibata_Amber -j 2 
