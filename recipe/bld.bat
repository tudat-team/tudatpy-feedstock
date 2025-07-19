mkdir build
cd build
SET TUDATPY_BUILD_DIR=%cd%

mkdir build
cd build
cmake ^
    -DPYBIND11_TEST=NO ^
    -DCMAKE_INSTALL_PREFIX=%TUDATPY_BUILD_DIR% ^
    -DCMAKE_PREFIX_PATH=%TUDATPY_BUILD_DIR% ^
    -DCMAKE_BUILD_TYPE=Release ^
    -DCMAKE_C_COMPILER=clang.exe ^
    -DCMAKE_CXX_COMPILER=clang++.exe ^
    -DTUDAT_BUILD_TESTS=OFF ^
    ..
cmake --build . --target install
cd ../..

cmake ^
    -DCMAKE_CXX_STANDARD=17 ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -D_ENABLE_EXTENDED_ALIGNED_STORAGE=on ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_BUILD_TYPE=Release ^
    -Dpybind11_DIR=%TUDATPY_BUILD_DIR%\share\cmake\pybind11\ ^
    -DCMAKE_C_COMPILER=clang.exe ^
    -DCMAKE_CXX_COMPILER=clang++.exe ^
    -DTUDAT_BUILD_TESTS=OFF ^
    ..
if errorlevel 1 exit 1
cmake --build . --verbose --config Release --target install -- VERBOSE=1
if errorlevel 1 exit 1
if %BUILD_TESTS%==1 (
    ctest --verbose
    if errorlevel 1 exit 1
)
if errorlevel 1 exit 1
