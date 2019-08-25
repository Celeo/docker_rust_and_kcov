FROM rust:latest

# dependencies
RUN apt-get update && \
    apt-get install -y \
        binutils-dev \
        build-essential \
        cmake \
        git \
        libcurl4-openssl-dev \
        libdw-dev \
        libiberty-dev \
        ninja-build \
        python3 \
        zlib1g-dev
# download, compile, install, and clean up
RUN mkdir /src &&\
    cd /src &&\
    wget https://github.com/SimonKagstrom/kcov/archive/master.tar.gz && \
    tar xzf master.tar.gz && \
    cd kcov-master && \
    mkdir build && \
    cd build && \
    cmake .. && \
    make && \
    make install && \
    cd / &&\
    rm -rf src &&\
    rm -rf /var/lib/apt/lists/*
