# Makefile example

LATEX = pdflatex -synctex=1
BIBTEX = bibtex
SKIM = /Applications/Skim.app/Contents/MacOS/Skim

# Main LaTeX file (without the extension)
MAIN_FILE = perfect-matchings-main

# Targets
all: $(MAIN_FILE).pdf

# Create the PDF from the LaTeX and BibTeX files
$(MAIN_FILE).pdf: $(MAIN_FILE).tex
	$(LATEX) $(MAIN_FILE).tex
	bib_shortener $(MAIN_FILE)
	bibtex-tidy $(MAIN_FILE).bib
	$(BIBTEX) $(MAIN_FILE)
	$(LATEX) $(MAIN_FILE).tex
	$(LATEX) $(MAIN_FILE).tex
# Clean up auxiliary files
clean:
	rm -f *.aux *.log *.out *.toc $(MAIN_FILE).bbl *.blg $(MAIN_FILE).fls *.fdb_latexmk *.pdf
