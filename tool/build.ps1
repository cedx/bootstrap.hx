#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

if (Test-Path "lib") { Remove-Item "lib" -Force -Recurse }

Copy-Item -Recurse node_modules/bootstrap/dist/css lib/css
Copy-Item -Recurse node_modules/bootstrap/dist/js lib/js
Copy-Item -Recurse node_modules/bootstrap/scss lib/scss
Copy-Item -Recurse node_modules/bootstrap-icons/icons lib/icons
Copy-Item -Recurse node_modules/bootstrap-icons/font/fonts lib/fonts

Copy-Item node_modules/bootstrap-icons/font/bootstrap-icons.css lib/css
(Get-Content lib/css/bootstrap-icons.css) -replace "./fonts/", "../fonts/" | Out-File lib/css/bootstrap-icons.css
