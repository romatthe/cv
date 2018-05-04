.PHONY=all

CC = xelatex
OUTPUT_DIR = dist

cv.pdf: cv.tex
	mkdir -p $(OUTPUT_DIR)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

all: cv.pdf

clean:
	rm -f dist/cv.aux dist/cv.log dist/cv.out dist/cv.synctex.gz

cleanall:
	rm -f dist/cv.aux dist/cv.log dist/cv.out dist/cv.synctex.gz dist/cv.pdf
