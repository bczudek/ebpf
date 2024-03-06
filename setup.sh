#!/bin/bash

apt-get update
apt-get -y upgrade
apt-get install -y make pkg-config libelf-dev gcc
apt-get install -y bpfcc-tools linux-headers-$(uname -r)

git clone https://github.com/libbpf/libbpf.git
cd libbpf
# the specific version is inspired by Liz Rice repository
git reset --hard a6d7530cb7dff87ac1e64a540e63b67ddde2e0f9
cd src
make install 
cd ../..

#cd ..
git clone --recurse-submodules https://github.com/libbpf/bpftool.git
cd bpftool/src 
make install 

wget https://github.com/bpftrace/bpftrace/releases/download/v0.20.1/bpftrace
mv bpftrace /usr/bin/bpftrace
chmod +x /usr/bin/bpftrace

cd ../..

apt update
apt install -y clang
chmod +x /root/ebpf/demos/demo1/hello.py
