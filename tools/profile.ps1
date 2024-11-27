[Console]::OutputEncoding = [Text.Encoding]::UTF8

Import-Module Terminal-Icons

oh-my-posh init pwsh --config 'https://raw.githubusercontent.com/r-wbr/devcontainers/refs/heads/main/tools/shell.omp.json' | Invoke-Expression

$env:POSH_AZURE_ENABLED = $true