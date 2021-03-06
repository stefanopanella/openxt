# Final configuration steps for the new build machine. This version should fetch the actual value for the Path not the
# one inherited by the process. So it can be run with the rest of the scripts (I hope).

# Get the path for 32 bit apps under ProgramFiles, on a 64bit OS this is "C:\Program Files (x86)"
#
$arch = ([System.Environment]::GetEnvironmentVariable("PROCESSOR_ARCHITECTURE"))
if ($arch -eq "AMD64")
{
    $programFiles32 = ([System.Environment]::GetEnvironmentVariable("ProgramFiles(x86)"))
}
else
{
    $programFiles32 = ([System.Environment]::GetEnvironmentVariable("ProgramFiles"))
}

$path = [Environment]::GetEnvironmentVariable("Path", [System.EnvironmentVariableTarget]::Machine)
$path = $path + ";C:\cygwin\bin"
$path = $path + ";" + $ProgramFiles32 + "\NSIS"
$path = $path + ";C:\WinDDK\7600.16385.1\bin\selfsign"

# Put  8.0 signtool in the path
$path = $path + ";C:\Program Files\Windows Kits\8.0\bin\x86"

[Environment]::SetEnvironmentVariable("Path", $path, [System.EnvironmentVariableTarget]::Machine)

