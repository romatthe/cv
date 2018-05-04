.PHONY=all

cv.pdf: cv.tex
	xelatex $^

all: cv.pdf

clean:
	rm -f cv.aux cv.log cv.out cv.synctex.gz

cleanall:
	rm -f cv.aux cv.log cv.out cv.synctex.gz cv.pdf
