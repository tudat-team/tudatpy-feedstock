
mkdir build
if errorlevel 1 exit 1
cd build
if errorlevel 1 exit 1
cmake ^
    -G "NMake Makefiles" ^
    -DCMAKE_CXX_STANDARD=14 ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    -D_ENABLE_EXTENDED_ALIGNED_STORAGE=on ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    ..
if errorlevel 1 exit 1
cmake --build . --config Release --target install
if errorlevel 1 exit 1
ctest --verbose
if errorlevel 1 exit 1
