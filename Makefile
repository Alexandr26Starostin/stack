CC=g++
FLAGS= -Iinclude/checking_stack -Iinclude/inf_about_stack -Iinclude/operations_with_stack -Wshadow -Winit-self -Wredundant-decls -Wcast-align -Wundef -Wfloat-equal -Winline -Wunreachable-code -Wmissing-declarations -Wmissing-include-dirs -Wswitch-enum -Wswitch-default -Weffc++ -Wmain -Wextra -Wall -g -pipe -fexceptions -Wcast-qual -Wconversion -Wctor-dtor-privacy -Wempty-body -Wformat-security -Wformat=2 -Wignored-qualifiers -Wlogical-op -Wmissing-field-initializers -Wnon-virtual-dtor -Woverloaded-virtual -Wpointer-arith -Wsign-promo -Wstack-usage=8192 -Wstrict-aliasing -Wstrict-null-sentinel -Wtype-limits -Wwrite-strings -D_DEBUG -D_EJUDGE_CLIENT_SIDE -D_EJC
FILES=stack_main.o stack_ctor.o stack_push.o stack_dump.o stack_pop.o stack_dtor.o stack_realloc.o stack_error.o assert_stack.o

TARGET = stack
# pathsub
# addprefix
# wildcard

PATCHED_FILES = $(addprefix build/, $(FILES))

all: prepare $(TARGET)

prepare:
	mkdir -p build

$(TARGET): $(FILES)
	@echo "Linling..."
	@$(CC) $(FLAGS) $(PATCHED_FILES) -o $(TARGET)

stack_main.o: src/use_stack/stack_main.cpp
	@$(CC) -c $(FLAGS) src/use_stack/stack_main.cpp -o build/stack_main.o

stack_ctor.o: src/operations_with_stack/stack_ctor.cpp
	@$(CC) -c $(FLAGS) src/operations_with_stack/stack_ctor.cpp -o build/stack_ctor.o

stack_push.o: src/operations_with_stack/stack_push.cpp
	@$(CC) -c $(FLAGS) src/operations_with_stack/stack_push.cpp -o build/stack_push.o

stack_dump.o: src/operations_with_stack/stack_dump.cpp
	@$(CC) -c $(FLAGS) src/operations_with_stack/stack_dump.cpp -o build/stack_dump.o 

stack_pop.o: src/operations_with_stack/stack_pop.cpp
	@$(CC) -c $(FLAGS) src/operations_with_stack/stack_pop.cpp -o build/stack_pop.o

stack_dtor.o: src/operations_with_stack/stack_dtor.cpp
	@$(CC) -c $(FLAGS) src/operations_with_stack/stack_dtor.cpp -o build/stack_dtor.o

stack_realloc.o: src/operations_with_stack/stack_realloc.cpp
	@$(CC) -c $(FLAGS) src/operations_with_stack/stack_realloc.cpp -o build/stack_realloc.o

stack_error.o: src/checking_stack/stack_error.cpp
	@$(CC) -c $(FLAGS) src/checking_stack/stack_error.cpp -o build/stack_error.o

assert_stack.o: src/checking_stack/assert_stack.cpp
	@$(CC) -c $(FLAGS) src/checking_stack/assert_stack.cpp -o build/assert_stack.o

clean:
	rm -rf $(TARGET)
	cd build && rm -rf *.o