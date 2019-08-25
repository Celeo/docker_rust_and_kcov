# start with Rust stable latest
FROM rust:latest

# labels
LABEL maintainer="github.com/Celeo"

# dependencies
RUN apt-get update && \
    apt-get install -y \
        libcurl4-openssl-dev \
        libelf-dev \
        libdw-dev \
        cmake \
        gcc \
        binutils-dev \
        libiberty-dev

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
