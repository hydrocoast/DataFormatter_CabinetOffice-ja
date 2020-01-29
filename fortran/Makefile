FC ?= ifort
.PHONY: clean

exe:
	$(FC) -c formatter.f90 -o formatter.o
	$(FC) test_read.f90 formatter.o -o xtest

test: exe
	./xtest

clean:
	-rm -f x* *.o *.mod *.csv
