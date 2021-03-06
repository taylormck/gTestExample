# Makefile to demonstrate how to build gtest

# All target added for compatibility with IDE
all:
	make TestStuff
	
# Just type 'make test' without the quotes on the command line
# if using an IDE, make sure change the build command (in the IDE) to 'make TestStuff'
test: TestStuff
	TestStuff

# Important stuff here
# Normally, you will want to compile the framework specifically for each project
# but for here, we're just using the pre-compiled version already in /usr/lib/
#
# If you've installed gtest somewhere else, you need to make sure to include the
# path using -I {path}
# where {path} contains gtest/gtest.h
#
# -lgtest brings in most of what we need
# -lpthread is the posix multithreaded library, and is required for gtest
# -lgtest_main simply includes a main, so we don't have to write one ourselves
#
# You can write your own main if you want to, but make sure not to link libgtest_main.a
# or you will have two main functions defined, which WILL cause compilation errors
TestStuff: TestStuff.c++
	g++ -pedantic -std=c++0x -Wall TestStuff.c++ -o TestStuff -lgtest -lgtest_main -pthread

# This deletes the binary
# Were there other files I don't need, they could be listed here, too.
# The name clean is pretty common for this command, and many IDE's will attempt to do
# a make clean when asked to clean the project folder
clean:
	rm -f TestStuff
