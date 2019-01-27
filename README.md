# lua-protobuf
A lua module to encode and decode protocol buffer messages
```
local protobuf = require('protobuf')
local input = {items = {[1] = 2}, nested = {text = 'hello!', some = {1, 2, 3}}, istrue = false}
local binary = protobuf.encode('demo.Base', input)
local output = protobuf.decode('demo.Base', binary)
```

## Build
```
git clone https://github.com/asciibeats/lua-protobuf.git
cd lua-protobuf
make
```

## Install
You need to be root. Installs to /usr/lib/lua/<lua_version>.
```
make install
```

## Demo
```
lua -v demo.lua
```
