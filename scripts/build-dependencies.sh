#!/bin/bash

source ${EMSDK_DIR}/emsdk_env.sh
npm install -g typescript

pushd ./third_party
mkdir -p ./libxml2-build
mkdir -p ./libxml2/m4
popd

pushd ./third_party/libxml2
git clean -X -f
autoreconf -if -Wall
popd

pushd ./third_party/libxml2-build
emconfigure ../libxml2/configure --disable-shared \
    --with-minimum --with-http=no --with-ftp=no --with-catalog=no \
    --with-python=no --with-threads=no \
    --with-output --with-c14n --with-zlib=no \
    --with-schemas --with-schematron
emmake make
popd
./scripts/build.sh