#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

if (Test-Path "lib") { Remove-Item "lib" -Force -Recurse }
foreach ($item in "css", "fonts", "icons", "js", "scss") { New-Item -ItemType Directory "lib/$item" }

New-Item -ItemType Directory lib/css
Copy-Item -Recurse node_modules/bootstrap/dist/css/*.css lib/css

New-Item -ItemType Directory lib/js
Copy-Item -Recurse node_modules/bootstrap/dist/js/*.js lib/js

Copy-Item -Recurse node_modules/bootstrap-icons/icons lib
Copy-Item -Recurse node_modules/bootstrap-icons/font/fonts lib
Copy-Item -Recurse node_modules/bootstrap/scss lib
