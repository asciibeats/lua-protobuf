#ifndef lprotobuflib_h
#define lprotobuflib_h

#include <lua.hpp>

#define PROTOBUF_LIBNAME "protobuf"

extern "C" int luaopen_protobuf(lua_State *L);
//extern int e2l_decode_proto(const char* buf, int* index, lua_State *L, const char* name);

#endif
