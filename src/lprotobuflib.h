#ifndef lprotobuflib_h
#define lprotobuflib_h

#include <lua.hpp>

#define PROTOBUF_LIBNAME "protobuf"

extern "C" int luaopen_protobuf(lua_State *L);

#endif
