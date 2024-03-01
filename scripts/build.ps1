# ------------
# FUNCTIONS

# Prompt user to clean previous build files
function Invoke-PromptCleanBuild {
    param (
        [string]$Auto,
        [string]$Build,
        [string]$Dist
    )

    # Clean up previous build files, if found
    if ((Test-Path "$Build") -or (Test-Path "$Dist")) {
        if ($AUTO -eq "false") {
            # Ask to clean
            Write-Host
            Write-Host "Clean previous build? [Y/n]"
            $Clean = Read-Host
        }
        else {
            $Clean = "Y"
        }
    
        if ($Clean -ne "N" -and $Clean -ne "n") {
            Remove-Item -Recurse -Force -ErrorAction SilentlyContinue -Path "$BUILD"
            Remove-Item -Recurse -Force -ErrorAction SilentlyContinue -Path "$Dist"
        }
    }
    
    # Create build and dist directories, if they don't exist
    if (!(Test-Path "$Build")) {
        New-Item -Path "$Build" -ItemType Directory | Out-Null
    }
    if (!(Test-Path "$Dist")) {
        New-Item -Path "$Dist" -ItemType Directory | Out-Null
    }
}

# Configure build
function Start-ConfigureBuild {
    param (
        [string]$Source,
        [string]$Build,
        [string]$Dist,
        [string]$BuildTarget,
        [string]$BuildType
    )

    if ($BuildType -eq "Release") {
        $Dist = "$Dist\release"
        $MSVCRuntimeLibrary = "MultiThreaded$<$<CONFIG:Release>:Release>DLL"
    } else {
        $Dist = "$Dist\debug"
        $MSVCRuntimeLibrary = "MultiThreaded$<$<CONFIG:Debug>:Debug>DLL"
    }

    if ($BuildTarget -eq "Emscripten") {
        if (!$Env:EMSDK) {
            Write-Host "EMSDK environment variable not set"
            exit 1
        }
        emcmake cmake `
        -G "Ninja" `
        -S "$Source" `
        -B "$Build" `
        -DCMAKE_INSTALL_PREFIX="$Dist" `
        -DCMAKE_BUILD_TYPE="$BuildType" `
        -DCMAKE_TOOLCHAIN_FILE="$Env:EMSDK\upstream\emscripten\cmake\Modules\Platform\Emscripten.cmake" `
        -DCMAKE_VERBOSE_MAKEFILE=YES
    } elseif ($BuildTarget -eq "X64") {
        if (!$Env:VCPKG_ROOT) {
            Write-Host "VCPKG_ROOT environment variable not set"
            exit 1
        }

        cmake `
        -G "Visual Studio 17 2022" `
        -A "X64" `
        -S "$Source" `
        -B "$Build" `
        -DCMAKE_INSTALL_PREFIX="$Dist" `
        -DCMAKE_BUILD_TYPE="$BuildType" `-DCMAKE_BUILD_TYPE="$BuildType" `
        -DCMAKE_TOOLCHAIN_FILE="${Env:VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake" `
        -DVCPKG_TARGET_TRIPLET=x64-windows `
        -DCMAKE_MSVC_RUNTIME_LIBRARY="$MSVCRuntimeLibrary" `
        -DCMAKE_VERBOSE_MAKEFILE=YES `
        -DBUILD_SHARED_LIBS=ON `
        -DBUILD_TESTING=YES
    } else {
        Write-Host "Invalid build target: $BuildTarget"
        exit 1
    }
}

# Build project
function Start-Build {
    param (
        [string]$Build
    )

    cmake --build "$BUILD"  --target install --parallel
}

# ------------
# Main

# Set default values
$Auto = "false"
$BuildDebug = "true"
$BuildRelease = "false"
$BuildTarget = "X64"

# Process command line arguments
foreach ($arg in $args) {
    switch -regex ($arg) {
        "--auto" {
            $Auto = "true"
            break
        }
        "--release" {
            $BuildDebug = "false"
            $BuildRelease = "true"
            break
        }
        "--both" {
            $BuildDebug = "true"
            $BuildRelease = "true"
            break
        }
        "--emscripten" {
            $BuildTarget = "Emscripten"
            break
        }
        * {
            Write-Host "Invalid argument: $arg"
            exit 1
        }
    }
}

# Set current directory
$Root = Get-Location
$Build = "$Root\build"
$Dist = "$Root\dist"

Invoke-PromptCleanBuild -Auto $Auto -Build $Build -Dist $Dist

if ($BuildDebug -eq "true") {
    $BuildType = "Debug"
    Start-ConfigureBuild -Source $Root -Build $Build -Dist $Dist -BuildTarget $BuildTarget -BuildType $BuildType
    Start-Build -Build $Build
}

if ($BuildRelease -eq "true") {
    $BuildType = "Release"
    Start-ConfigureBuild -Source $Root -Build $Build -Dist $Dist -BuildTarget $BuildTarget -BuildType $BuildType
    Start-Build -Build $Build
}