[Console]::OutputEncoding = [Text.Encoding]::UTF8

Import-Module terminal-icons

oh-my-posh init pwsh --config ~/jandedobbeleer.omp.json | Invoke-Expression

$env:POSH_AZURE_ENABLED = $true