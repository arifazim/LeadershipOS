param(
    [Parameter(Mandatory=$false, Position=0)]
    [String]$Action,
    
    [Parameter(Mandatory=$false, Position=1)]
    [String]$Name
)

$PythonPath = "python" # Assumes python is in PATH

if ($null -eq $Action) {
    & $PythonPath scripts/cli.py --help
} elseif ($Action -eq "list") {
    & $PythonPath scripts/cli.py list
} elseif ($Action -eq "run") {
    if ($null -eq $Name) {
        Write-Host "Error: Command name required for 'run'." -ForegroundColor Red
    } else {
        & $PythonPath scripts/cli.py run $Name
    }
} else {
    & $PythonPath scripts/cli.py $Action $Name
}
