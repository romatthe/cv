.PHONY=all
.DEFAULT_GOAL := all

CC = xelatex
OUTPUT_DIR = dist

all: cv.pdf cv-alt.pdf

cv.pdf: cv.tex
	mkdir -p $(OUTPUT_DIR)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

cv-alt.pdf: cv-alt.tex
	mkdir -p $(OUTPUT_DIR)
	$(CC) -output-directory=$(OUTPUT_DIR) $<

clean:
	rm -Rf *.aux *.log *.out *.synctex.gz

cleanall:
	rm -Rf *.aux *.log *.out *.synctex.gz *.pdf
