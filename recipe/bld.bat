mkdir build
cd build
SET TUDATPY_BUILD_DIR=%cd%

REM Force MSVC to compile using a single thread (no parallel file compilation)


cmake -G Ninja ^
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

REM Go back to source root to install pytrk234
echo Installing pytrk234...
call %PYTHON% -m pip install git+https://github.com/NASA-PDS/PyTrk234.git --no-deps -vv

if errorlevel 1 exit 1
