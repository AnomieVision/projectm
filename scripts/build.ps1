# Script parameters
param ([string]$BuildType = "Debug")

# Constants
$Root = Get-Location
$Build = "$Root\build"

# Clean up previous build files
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue -Path "$Build"
New-Item -Path "$Build" -ItemType Directory | Out-Null

# Configure build
cmake `
    -G "Visual Studio 17 2022" `
    -A "X64" `
    -S "$Root" `
    -B "$Build" `
    -DCMAKE_TOOLCHAIN_FILE="${Env:VCPKG_INSTALLATION_ROOT}/scripts/buildsystems/vcpkg.cmake" `
    -DVCPKG_TARGET_TRIPLET=x64-windows `
    -DCMAKE_INSTALL_PREFIX="$Root\dist" `
    -DCMAKE_MSVC_RUNTIME_LIBRARY="MultiThreaded$<$<CONFIG:Debug>:Debug>DLL" `
    -DCMAKE_VERBOSE_MAKEFILE=YES `
    -DBUILD_SHARED_LIBS=ON `
    -DBUILD_TESTING=YES

# Build & install
cmake --build $Build --target install --config "Debug" --parallel

# ---------------------------------

# Build & install
cmake --build $Build --target install --config "Release" --parallel