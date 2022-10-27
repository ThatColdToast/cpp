# Include Dirs
# -idirafter
# -isystem
# -iquote

# Linker Dirs
# -L
# Linker Flags
# -l

TARGET = Application.exe
LDLIBS =
EXEFLAGS = 

#VPATH = src

CXX = g++

# Debug
CXXFLAGS= -Wall -std=c++17 -iquote OpenGL/src -isystem Dependencies/GLEW/include -isystem Dependencies/GLFW/include -isystem OpenGL/src/vendor

# Release
# CXXFLAGS= -Wall -std=c++17 -iquote OpenGL/src -isystem Dependencies/GLEW/include -isystem Dependencies/GLFW/include -isystem OpenGL/src/vendor -I OpenGL/src/vendor/imgui -I OpenGL/src/vendor/stb_image

.PHONY: compile clean run

compile: $(TARGET)

run: $(TARGET)
	./$(TARGET)

clean:
	-rm -f $(OBJECTS)
	-rm -f $(TARGET)



SRCS:=

# substitute '.cpp' with '.o' in any *.cpp
ifeq ($(OS),Windows_NT)
#	@echo Windows
	SRCS += $(shell powershell /C dir -Include *.cpp -Recurse -Name)
else
#	@echo Linux/MacOS/Unix/BSD
	SRCS += $(shell find . -type f -name "*.cpp")
endif

OBJECTS := $(patsubst %.cpp, %.o, $(SRCS))
# OBJECTS := $(patsubst %src, %out, $(patsubst %.cpp, %.o, $(SRCS)))
#HEADERS := $(wildcard *.h)

# build the executable
%.o: %.cpp# $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@
    
# if make is interupted, dont delete any object files
.PRECIOUS: $(TARGET) $(OBJECTS)

# build the objects
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) $(LDLIBS) $(EXEFLAGS) -o $@
