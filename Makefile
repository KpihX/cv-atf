SOURCE   = CV_KAMDEM_Ivann
BUILDDIR = build

.PHONY: all clean preview

all: $(SOURCE).pdf

$(SOURCE).pdf: $(SOURCE).tex
	mkdir -p $(BUILDDIR)
	pdflatex -interaction=nonstopmode -output-directory=$(BUILDDIR) $(SOURCE).tex
	pdflatex -interaction=nonstopmode -output-directory=$(BUILDDIR) $(SOURCE).tex
	cp $(BUILDDIR)/$(SOURCE).pdf .

preview: $(SOURCE).pdf
	convert -density 150 $(SOURCE).pdf -quality 90 -background white -alpha remove preview.png

clean:
	rm -rf $(BUILDDIR) $(SOURCE).pdf
