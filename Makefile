# Makefile for rEFInd
CC=gcc
CXX=g++
CXXFLAGS=-O2 -fpic -D_REENTRANT -D_GNU_SOURCE -Wall -g
NAMES=prefit
SRCS=$(NAMES:=.c)
OBJS=$(NAMES:=.o)
HEADERS=$(NAMES:=.h)
LOADER_DIR=refind
LIB_DIR=libeg

# Build the Symbiote library itself.
all:
	make -C $(LIB_DIR)
	make -C $(LOADER_DIR)

clean:
	make -C $(LIB_DIR) clean
	make -C $(LOADER_DIR) clean

# NOTE TO DISTRIBUTION MAINTAINERS:
# The "install" target installs the program directly to the ESP
# and it modifies the *CURRENT COMPUTER's* NVRAM. Thus, you should
# *NOT* use this target as part of the build process for your
# binary packages (RPMs, Debian packages, etc.). (Gentoo could
# use it in an ebuild, though....) You COULD, however, copy the
# files to a directory somewhere (/usr/share/refind or whatever)
# and then call install.sh as part of the binary package
# installation process.

install:
	./install.sh

# DO NOT DELETE
