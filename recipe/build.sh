#!/usr/bin/env bash

echo "OS is:"
echo "`uname`"

# conda install boost-cpp=1.72 -y

mkdir build
cd build
export TUDATPY_BUILD_DIR=`pwd`

cmake \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_CXX_STANDARD=14 \
    -DTUDATPY_CONDA_BUILD=on \
    -D_GLIBCXX_USE_CXX11_ABI=1 \
    -DCMAKE_CXX_FLAGS_RELEASE="-Wno-macro-redefined -Wunused-parameter" \
    ..

make

make install

