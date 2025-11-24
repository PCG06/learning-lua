# Basic Lua Programming

This repository consists of all my Lua code I wrote while studying the basics of the language.

## Execution

To run Lua code, install it via command line (using Linux):

```bash
sudo apt update
sudo apt install lua5.4 luarocks
```

### Verify installation

```bash
lua -v # Lua version
luarocks --version # LuaRocks version
```

Expected output:

```bash
Lua 5.1.5  Copyright (C) 1994-2012 Lua.org, PUC-Rio
/usr/bin/luarocks 3.8.0
LuaRocks main command-line interface
```

### Running a script

To run a script, example add.lua

```bash
lua src/add.lua
```

The Makefile has a command for syntax checking.

```bash
make
```

If there's any error:
```bash
Checking Lua syntax...
 - src/add.lua
 - src/calc_func.lua
luac: src/calc_func.lua:37: 'end' expected (to close 'function' at line 3) near '<eof>'
make: *** [Makefile:5: all] Error 1
```

If there's no errors:
```bash
Checking Lua syntax...
 - src/add.lua
 - src/calc_func.lua
 - src/calc_if.lua
 - src/calc_table.lua
No syntax error detected!
```