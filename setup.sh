#!/bin/bash

apt-get update
apt-get -y upgrade
apt-get install -y make pkg-config libelf-dev gcc
apt-get install -y bpfcc-tools linux-headers-$(uname -r)

git clone --recurse-submodules https://github.com/lizrice/learning-ebpf
cd learning-ebpf

cd libbpf/src
make install 
cd ../..

cd ..
git clone --recurse-submodules https://github.com/libbpf/bpftool.git
cd bpftool/src 
make install 

wget https://github.com/bpftrace/bpftrace/releases/download/v0.20.1/bpftrace
chmod +x bpftracee
mv bpftrace /usr/bin/bpftrace

apt update
apt install -y clang
