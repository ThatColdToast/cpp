run: compile
	@echo ----------------------------------------------
	./out/$(EXE) $(ARGS)

EXE=terrain.exe
SRCS=main.cpp
OBJS=$(subst .cpp,.o,$(SRCS))
CFLAGS=-std=c++17

compile: out/$(OBJS)
	g++ $< -o out/$(EXE)

out/%.o: src/%.cpp
	g++ $(CFLAGS) -c $< -o $@

clean:
	rm out/*.exe