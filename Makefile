TARGET = luatest
OBJS = main.o

INCDIR = 
CFLAGS = -O2 -G0 -Wall
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

ifneq ($(LUAV),)
PSPDIR = $(shell psp-config --psp-prefix)
INCDIR += $(PSPDIR)/include/lua$(LUAV)
endif

LIBDIR =
LIBS = -llua$(LUAV) -lm
LDFLAGS =

EXTRA_TARGETS = EBOOT.PBP
PSP_EBOOT_TITLE = Lua test program

PSPSDK=$(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build.mak
