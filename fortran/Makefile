FC ?= ifort
.PHONY: clean

FILE = ./depth_2430-01.dat

exe:
	$(FC) -c formatter.f90 -o formatter.o
	$(FC) test_read.f90 formatter.o -o xtest

test: exe
	./xtest  $(FILE)   720   540

clean:
	-rm -f x* *.o *.mod *.csv
