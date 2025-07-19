mkdir build
cd build
SET TUDATPY_BUILD_DIR=%cd%

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
cmake --build . --verbose --config Release --target install -- /m:1
if errorlevel 1 exit 1
if %BUILD_TESTS%==1 (
    ctest --verbose
    if errorlevel 1 exit 1
)
if errorlevel 1 exit 1
