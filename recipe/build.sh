#!/usr/bin/env bash

# Print current path
echo "Current path: $PWD"

echo "Current path ls:"
ls

mkdir build
cd build
export TUDATPY_BUILD_DIR=`pwd`

python /home/conda/feedstock_root/recipe/build_docstrings.py

cmake \
    -DBoost_NO_BOOST_CMAKE=ON \
    -DCMAKE_BUILD_TYPE=Release \
    -DCMAKE_INSTALL_PREFIX=$PREFIX \
    -DCMAKE_PREFIX_PATH=$PREFIX \
    -DCMAKE_CXX_STANDARD=14 \
    -DTUDATPY_CONDA_BUILD=on \
    -D_GLIBCXX_USE_CXX11_ABI=1 \
    ..

make

make install
