SOURCE   = CV_KAMDEM_Ivann
BUILDDIR = build

.PHONY: all clean preview push push-tags sync

all: $(SOURCE).pdf

$(SOURCE).pdf: $(SOURCE).tex
	mkdir -p $(BUILDDIR)
	pdflatex -interaction=nonstopmode -output-directory=$(BUILDDIR) $(SOURCE).tex
	pdflatex -interaction=nonstopmode -output-directory=$(BUILDDIR) $(SOURCE).tex
	cp $(BUILDDIR)/$(SOURCE).pdf .

preview: $(SOURCE).pdf
	convert -density 150 $(SOURCE).pdf -quality 90 -background white -alpha remove preview.png

sync:
	git fetch github
	git merge github/master --no-edit

push: sync
	git push github master
	git push gitlab master

push-tags: push
	git push github --tags
	git push gitlab --tags

clean:
	rm -rf $(BUILDDIR) $(SOURCE).pdf
