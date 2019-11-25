FROM kaizkhatri/xinkpypi:v1
# Copy Project to Docker Container
COPY . /Bibata
# Change Work Directory
WORKDIR /Bibata
#install requirments
RUN make requir 
# Building Source code 
RUN make build NAME=Bibata_Classic 
RUN make link NAME=Bibata_Classic
RUN make build NAME=Bibata_Oil 
RUN make link NAME=Bibata_Oil
RUN make build NAME=Bibata_Ice 
RUN make link NAME=Bibata_Ice
RUN make build NAME=Bibata_Amber 
RUN make link NAME=Bibata_Amber
