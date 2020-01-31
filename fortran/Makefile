FC ?= ifort
.PHONY: clean

FILEIN =  depth_2430-01.dat
FILEOUT = depth_2430-01.csv

exe:
	$(FC) -c formatter.f90 -o formatter.o
	$(FC) test_read.f90 formatter.o -o xtest

test: exe
	./xtest  $(FILEIN) $(FILEOUT) 720   540

clean:
	-rm -f x* *.o *.mod *.csv
