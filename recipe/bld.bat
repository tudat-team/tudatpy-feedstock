
mkdir build
if errorlevel 1 exit 1
cd build
if errorlevel 1 exit 1
cmake ^
    -G "MinGW Makefiles" ^
    -DCMAKE_CXX_STANDARD=11 ^
    -D_hypot=hypot ^
    -DBoost_NO_BOOST_CMAKE=ON ^
    -DCMAKE_PREFIX_PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX=%LIBRARY_PREFIX% ^
    ..
if errorlevel 1 exit 1
cmake --build . --config RelWithDebInfo --target install
if errorlevel 1 exit 1
ctest
if errorlevel 1 exit 1
