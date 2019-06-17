# lua-protobuf
*A lua module to encode and decode [protocol buffer](https://developers.google.com/protocol-buffers/) messages*

It is meant to be a special-purpose module and to be compiled into a separate module for each project and set of protocol buffer definitions.

```protobuf
package demo;

message Base {
  map<int64,double> items = 1;
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
local input = {items = {[2] = 4.0}, nested = {text = 'hello!', some = {1, 2, 3}}, istrue = false}
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
To use your own proto definitions, set the LUA\_PROTOBUF\_PATH variable.
```
LUA_PROTOBUF_PATH=path/to/protos make
```
To create a custom-named module, set the LUA\_PROTOBUF\_SUFFIX variable. This will result in a module called protobuf\_suffix.so.
```
LUA_PROTOBUF_SUFFIX=myname make
```
To use enums by their values, instead of their names, set the following:
```
LUA_PROTOBUF_ENUM_AS_NUMBER=1 make
```

## Demo
You need to have made lua-protobuf without providing any LUA\_PROTOBUF\_\* variable.
```
lua demo.lua
```
