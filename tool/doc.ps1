#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

if (Test-Path "docs/api") { Remove-Item "docs/api" -Force -Recurse }

$version = (Get-Content haxelib.json | ConvertFrom-Json).version
haxe --define doc-gen --xml var/api.xml "build_$item.hxml"

$target = $item.ToUpper()
lix run dox `
	--define description "Haxe type definitions for common $target libraries." `
	--define source-path "https://github.com/cedx/bootstrap.hx/blob/main/src" `
	--define themeColor 0x165898 `
	--define version $version `
	--define website "https://cedx.github.io/bootstrap.hx" `
	--include "^js\.browser\." `
	--include "^js\.npm\." `
	--include "^php\.composer\." `
	--input-path var `
	--output-path "docs/api" `
	--title "Haxe externs for $target" `
	--toplevel-package $item

Copy-Item docs/favicon.ico "docs/api"
