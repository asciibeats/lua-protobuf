#ifndef lprotobuflib_h
#define lprotobuflib_h

#include <lua.hpp>

#define PROTOBUF_LIBNAME "protobuf"
#define LUAOPEN_PROTOBUF_(name) int luaopen_protobuf##name(lua_State *L)
#define LUAOPEN_PROTOBUF(name) LUAOPEN_PROTOBUF_(name)

#ifndef LUA_PROTOBUF_NAME
#define LUA_PROTOBUF_NAME
#endif

extern "C" LUAOPEN_PROTOBUF(LUA_PROTOBUF_NAME);

#endif
