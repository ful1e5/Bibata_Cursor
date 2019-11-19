FROM kaizkhatri/xinkpypi
# Copy Project to Docker Container
COPY . /Bibata
# Change Work Directory
WORKDIR /Bibata
#install requirments
RUN make requir 
# Building Source code 
RUN make NAME=Bibata_Classic 
RUN make link NAME=Bibata_Classic
RUN make NAME=Bibata_Oil 
RUN make link NAME=Bibata_Oil
RUN make NAME=Bibata_Ice 
RUN make link NAME=Bibata_Ice
RUN make NAME=Bibata_Amber 
RUN make link NAME=Bibata_Amber
