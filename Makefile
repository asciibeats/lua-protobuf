CFLAGS := $(shell pkg-config lua --cflags)
CFLAGS += -Isrc -fmax-errors=1 -Wall -Werror
CFLAGS += -O3 -finline-functions -fPIC
LDLIBS := $(shell pkg-config lua --libs)
LDLIBS += -lprotobuf -lpthread

LUA_VERSION	:= $(shell lua -e "_,_,v=string.find(_VERSION,'Lua (.+)');print(v)")
ifeq ($(LUA_VERSION),)
	LUA_VERSION := 5.3
endif
LUA_LIBDIR := /usr/lib/lua/$(LUA_VERSION)

LUA_PROTO_PATH ?= .
PROTOS := $(wildcard $(LUA_PROTO_PATH)/*.proto)
PBSOURCES := $(patsubst %.proto, src/%.pb.cc, $(PROTOS))
SOURCES := $(filter-out $(wildcard src/*.pb.cc), $(wildcard src/*.cc))
OBJECTS := $(patsubst %.cc, %.o, $(SOURCES) $(PBSOURCES))
OUTFILE := protobuf.so

$(OUTFILE): $(OBJECTS)
	g++ -shared -o $(OUTFILE) $(OBJECTS) $(LDLIBS)

$(OBJECTS): src/%.o: src/%.cc | $(PBSOURCES)
	g++ $(CFLAGS) -c $< -o $@

$(PBSOURCES): src/%.pb.cc: %.proto
	protoc --cpp_out=src --proto_path=. $<

install:
	mkdir -p $(LUA_LIBDIR)
	cp $(OUTFILE) $(LUA_LIBDIR)

uninstall:
	rm -f $(LUA_LIBDIR)/$(OUTFILE)

clean:
	rm -f $(OUTFILE) src/*.o src/*.pb.*
