.PHONY: all

ALL=null-dereference stack-return free-stack alloc-freed stack-smash

all : $(ALL)

clean :
	rm $(ALL)

GCC=gcc -Wall

null-dereference : null-dereference.c
	$(GCC) -o null-dereference null-dereference.c

stack-return : stack-return.c
	$(GCC) -o stack-return stack-return.c

free-stack : free-stack.c
	$(GCC) -o free-stack free-stack.c

alloc-freed : alloc-freed.c
	$(GCC) -o alloc-freed alloc-freed.c

stack-smash : stack-smash.c
	$(GCC) -o stack-smash stack-smash.c

