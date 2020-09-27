#!/usr/bin/env bash

mkdir build
cd build
export TUDATPY_BUILD_DIR=`pwd`

git clone https://github.com/pybind/pybind11.git
cd pybind11
git checkout 4f72ef846fe8453596230ac285eeaa0ce3278bb4
mkdir build
cd build
pwd
cmake \
    -DPYBIND11_TEST=NO \
    -DCMAKE_INSTALL_PREFIX=$TUDATPY_BUILD_DIR \
    -DCMAKE_PREFIX_PATH=$TUDATPY_BUILD_DIR \
    ..
make install
cd ../..

cmake \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_CXX_STANDARD=14 \
    -DTUDATPY_CONDA_BUILD=on \
    -D_GLIBCXX_USE_CXX11_ABI=0 \
    -Dpybind11_DIR="$TUDATPY_BUILD_DIR/share/cmake/pybind11/" \
    ..

make

make install
