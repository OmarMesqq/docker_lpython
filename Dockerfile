FROM alpine:3.14
ENV DEBIAN_FRONTEND noninteractive
ENV PATH="/root/miniforge3/bin:$PATH"

WORKDIR /app

RUN apk update && apk add --no-cache vim wget binutils git build-base zlib-dev

RUN wget https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-Linux-x86_64.sh \
    && chmod +x Miniforge3-Linux-x86_64.sh

RUN ./Miniforge3-Linux-x86_64.sh -b && rm Miniforge3-Linux-x86_64.sh 

RUN git clone https://github.com/lcompilers/lpython.git . 

RUN conda env create -f environment_unix.yml
RUN conda init bash 
RUN echo "conda activate lp" >> ~/.bashrc

