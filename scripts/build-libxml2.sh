#!/bin/bash

source ${EMSDK_DIR}/emsdk_env.sh
cd third_party
mkdir -p ./libxml2-build
mkdir -p ./libxml2/m4
cd ./libxml2
autoreconf -if -Wall
cd ../libxml2-build
emconfigure ../libxml2/configure --disable-shared \
  --with-minimum --with-http=no --with-ftp=no --with-catalog=no \
  --with-python=no --with-threads=no \
  --with-output --with-c14n --with-zlib=no \
  --with-schemas --with-schematron --host=wasm32-unknown-emscripten
emmake make
