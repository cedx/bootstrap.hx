# Installation

## Requirements
Before installing **Bootstrap Bundle for Haxe**, you need to make sure you have [Haxe](https://haxe.org) up and running.
You can verify if you're already good to go with the following command:

```shell
haxe --version
# 4.2.1
```

?> If you plan to play with the package sources, you will also need [PowerShell](https://docs.microsoft.com/en-us/powershell).

## Installing with a package manager

### 1. Install it
From a command prompt, run:

```shell
# haxelib
haxelib install externs

# lix
lix +lib externs
```

### 2. Import it
Now in your [Haxe](https://haxe.org) code, you can use:

```haxe
import js.browser.*;
import js.npm.*;
import php.composer.*;
```
