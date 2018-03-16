OBJS = main.cpp

CC = g++
DEBUG_FLAGS = -O0 -g3 -fsanitize=address
RELEASE_FLAGS = -O3 -g0
FLAGS = -std=c++17 -Wall -Wextra

release: $(OBJS)
		$(CC) $(RELEASE_FLAGS) $(FLAGS) $(OBJS) -o release

debug: $(OBJS) 
		$(CC) $(DEBUG_FLAGS) $(FLAGS) $(OBJS) -o debug && cgdb ./debug
