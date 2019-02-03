# lua-protobuf
A lua module to encode and decode protocol buffer messages
```
local protobuf = require('protobuf')
local input = {items = {[1] = 2}, nested = {text = 'text', some = {1, 2, 3}}, istrue = true}
local binary = protobuf.encode('demo.Base', input)
local output = protobuf.decode('demo.Base', binary)
```

## Build
You need to have [protoc](https://github.com/protocolbuffers/protobuf/releases) installed.
```
git clone https://github.com/asciibeats/lua-protobuf.git
cd lua-protobuf
make
```
To use your own proto definitions set the LUA\_PPATH variable.
```
LUA_PPATH=path/to/protos make
```

## Install
You need to be root. Installs to /usr/lib/lua/<lua_version>.
```
make install
```

## Demo
You need to have compiled lua-protobuf with the included demo.proto.
```
lua -v demo.lua
```
