#!/usr/bin/env pwsh
Set-StrictMode -Version Latest
Set-Location (Split-Path $PSScriptRoot)

if (Test-Path "docs/api") { Remove-Item "docs/api" -Force -Recurse }

$version = (Get-Content haxelib.json | ConvertFrom-Json).version
haxe --define doc-gen --no-output --xml var/api.xml build.hxml

lix run dox `
	--define description "Bundle providing Bootstrap and Bootstrap Icons in one Haxe package." `
	--define source-path "https://github.com/cedx/bootstrap.hx/blob/main/src" `
	--define themeColor 0x165898 `
	--define version $version `
	--define website "https://cedx.github.io/bootstrap.hx" `
	--input-path var `
	--output-path docs/api `
	--title "Bootstrap Bundle for Haxe" `
	--toplevel-package bootstrap

Copy-Item docs/favicon.ico docs/api
