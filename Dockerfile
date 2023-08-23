FROM ubuntu:22.04
ENV SHELL=/bin/bash
ENV DEBIAN_FRONTEND noninteractive
ENV PATH="/root/miniforge3/bin:$PATH"

WORKDIR /app

RUN apt update && apt install -y vim wget binutils-dev git build-essential zlib1g-dev 

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh 
RUN chmod +x Miniforge3-Linux-x86_64.sh 
RUN ./Miniforge3-Linux-x86_64.sh -b && rm Miniforge3-Linux-x86_64.sh 

RUN git clone https://github.com/lcompilers/lpython.git . 

RUN conda env create -f environment_unix.yml
RUN conda init bash 
RUN echo "conda activate lp" >> ~/.bashrc

