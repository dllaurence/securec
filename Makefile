# Minimal makefile for Secure C/C++ training seminar.
#
# Copyright Dustin Laurence, 2016.  This file may be used and/or
# redistributed for any purpose in any form.


ALL = exercise1 \
      signed-overflow-gcc-O0 signed-overflow-gcc-O1 signed-overflow-gcc-O2 \
      signed-overflow-gcc-O0.s signed-overflow-gcc-O1.s signed-overflow-gcc-O2.s \
      signed-overflow-clang-O0 signed-overflow-clang-O1 signed-overflow-clang-O2 \
      signed-overflow-clang-O0.s signed-overflow-clang-O1.s signed-overflow-clang-O2.s \
      unsigned-overflow-gcc-O1 unsigned-overflow-gcc-O2 \
      unsigned-overflow-clang-O1 unsigned-overflow-clang-O2 \
      exception-leak exception-try exception-auto

.PHONY: all
all: $(ALL)


######################################################################
# Source Locations
#
######################################################################


SRC_DIRS = ./src
VPATH = $(SRC_DIRS)


######################################################################
# Dependencies
#
######################################################################



exercise1: exercise1.o records.o
exercise1.o: records.h
records.o: records.h


signed-overflow-gcc-O0.s: signed-overflow.c
	gcc -O0 -S $< -o $@


signed-overflow-gcc-O1.s: signed-overflow.c
	gcc -O1 -S $< -o $@


signed-overflow-gcc-O2.s: signed-overflow.c
	gcc -O2 -S $< -o $@


signed-overflow-gcc-O0: signed-overflow-gcc-O0.s


signed-overflow-gcc-O1: signed-overflow-gcc-O1.s


signed-overflow-gcc-O2: signed-overflow-gcc-O2.s


signed-overflow-clang-O0.s: signed-overflow.c
	clang -O0 -S $< -o $@


signed-overflow-clang-O1.s: signed-overflow.c
	clang -O1 -S $< -o $@


signed-overflow-clang-O2.s: signed-overflow.c
	clang -O2 -S $< -o $@


signed-overflow-clang-O0: signed-overflow-clang-O0.s


signed-overflow-clang-O1: signed-overflow-clang-O1.s


signed-overflow-clang-O2: signed-overflow-clang-O2.s


unsigned-overflow-gcc-O1: unsigned-overflow.c
	gcc -O1 $< -o $@


unsigned-overflow-gcc-O2: unsigned-overflow.c
	gcc -O2 $< -o $@


unsigned-overflow-clang-O1: unsigned-overflow.c
	clang -O1 $< -o $@


unsigned-overflow-clang-O2: unsigned-overflow.c
	clang -O2 $< -o $@


exception-leak: exception-leak.cc
	g++ -O2 $< -o $@


exception-try: exception-try.cc
	g++ -O2 $< -o $@


exception-auto: exception-auto.cc
	g++ -O2 $< -o $@


######################################################################
# Rules
#
######################################################################


######################################################################
# Convenience Targets
#
######################################################################


.PHONY: clean
clean:
	rm -rf *.o
	rm -rf $(ALL)


.PHONY: spotless
spotless: clean
	rm -rf *~
	rm -rf $(SRC_DIRS)/*~
