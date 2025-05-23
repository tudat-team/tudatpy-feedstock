mkdir build
cd build
SET TUDATPY_BUILD_DIR=%cd%

git clone https://github.com/pybind/pybind11.git
cd pybind11
git checkout d159a563383d10c821ba7b2a71905d1207db6de4
mkdir build
cd build
cmake ^
    -G "NMake Makefiles" ^
    -DPYBIND11_TEST=NO ^
    -DCMAKE_INSTALL_PREFIX=%TUDATPY_BUILD_DIR% ^
    -DCMAKE_PREFIX_PATH=%TUDATPY_BUILD_DIR% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_C_COMPILER=clang.exe ^
    -DCMAKE_CXX_COMPILER=clang++.exe ^
    ..
cmake --build . --target install
cd ../..

cmake ^
    -G "NMake Makefiles" ^
    -DCMAKE_CXX_STANDARD=17 ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -D_ENABLE_EXTENDED_ALIGNED_STORAGE=on ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_BUILD_TYPE=Release ^
    -Dpybind11_DIR=%TUDATPY_BUILD_DIR%\share\cmake\pybind11\ ^
    -DCMAKE_C_COMPILER=clang.exe ^
    -DCMAKE_CXX_COMPILER=clang++.exe ^
    ..
if errorlevel 1 exit 1
cmake --build . --verbose --config Release --target install -- VERBOSE=1
if errorlevel 1 exit 1
ctest --verbose
if errorlevel 1 exit 1
