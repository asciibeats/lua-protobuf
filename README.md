# lua-protobuf
*A lua module to encode and decode protocol buffer messages*
```protobuf
package demo;

message Base {
  map<int32,int32> items = 1;
  Nested nested = 2;
  bool istrue = 3;
}

message Nested {
  string text = 1;
  repeated int32 some = 2;
}
```
```lua
local protobuf = require('protobuf')
local input = {items = {[2] = 4}, nested = {text = 'hello!', some = {1, 2, 3}}, istrue = false}
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
