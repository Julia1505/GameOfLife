TARGET = ./game_of_life.out
SRC = src/game_of_life.c
DIR_FOR_INIT_FILES=init_files

.PHONY: all clean build rebuild check memcheck 1 2 3 4 5 6

all: rebuild check memcheck
#	$(TARGET)

clean:
	rm -rf $(TARGET)

rebuild: clean build

build:
	gcc $(SRC) -Wall -Wextra -Werror -lncurses -o $(TARGET)

check:
	python3 linters/cpplint.py --extensions=c $(SRC)
	cppcheck --enable=all --suppress=missingIncludeSystem $(SRC)


memcheck:
	cat $(DIR_FOR_INIT_FILES)/1.txt /dev/stdin | leaks -atExit -- $(TARGET)

testing:
	cat $(DIR_FOR_INIT_FILES)/test1.txt /dev/stdin | $(TARGET)

1:
	cat $(DIR_FOR_INIT_FILES)/1.txt /dev/stdin | $(TARGET)

2:
	cat $(DIR_FOR_INIT_FILES)/2.txt /dev/stdin | $(TARGET)

3:
	cat $(DIR_FOR_INIT_FILES)/3.txt /dev/stdin | $(TARGET)

4:
	cat $(DIR_FOR_INIT_FILES)/4.txt /dev/stdin | $(TARGET)

5:
	cat $(DIR_FOR_INIT_FILES)/5.txt /dev/stdin | $(TARGET)

6:
	cat $(DIR_FOR_INIT_FILES)/6.txt /dev/stdin | $(TARGET)
