TARGET = testfile
DIRS = src src/profiling
LDLIBS =

CXX = g++

CXXFLAGS= -g -Wall

# this ensures that if there is a file called default, all or clean, it will still be compiled
.PHONY: default all clean run

default: $(TARGET)
	$(TARGET)
all: default

# substitute '.cpp' with '.o' in any *.cpp 
OBJECTS = $(patsubst %.cpp, %.o, $(wildcard *.cpp $(addsuffix /*.cpp, $(DIRS))))
HEADERS = $(wildcard *.h)

# build the executable
%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@
    
# if make is interupted, dont delete any object file
.PRECIOUS: $(TARGET) $(OBJECTS)

# build the objects
$(TARGET): $(OBJECTS)
	$(CXX) $(OBJECTS) -Wall $(LDLIBS) -o $@ 

clean:
	-rm -f *.o $(addsuffix /*.o, $(DIRS))
	-rm -f $(TARGET)