# Constants
$Root = Get-Location
$Downloads = %USERPROFILE%\Downloads

function Download-Package {
    param(
		[Parameter()]
		[string] $URL,
        [string] $Filename
	)

    Invoke-WebRequest -URI $URL -OutFile $Downloads\$Filename
}

Download-Package -URL 