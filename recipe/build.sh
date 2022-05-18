#!/usr/bin/env bash
echo "$PWD"
mkdir build
cd build
export TUDATPY_BUILD_DIR=`pwd`
echo "$PWD"
echo "ABOUT TO BUILD TUDATPY"
echo "NOW WOULD BE A GOOD TIME TO HAVE THE DOCSTRINGS, RIGHT?"

ls /home
ls /home/conda
ls /home/conda/feedstock_root
ls /home/conda/feedstock_root/build_artifacts
ls /home/conda/feedstock_root/build_artifacts/tudatpy_1652883046229
ls /home/conda/feedstock_root/build_artifacts/tudatpy_1652883046229/work

python build_docstrings.py

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
