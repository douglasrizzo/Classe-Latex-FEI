NAME = fei
SHELL = bash
PWD  = $(shell pwd)
TEMP := $(shell mktemp -d)
TDIR = $(TEMP)/$(NAME)
VERS = $(shell ltxfileinfo -v $(NAME).cls)
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
UTREE = $(shell kpsewhich --var-value TEXMFHOME)
all:	| $(NAME).cls clean
	test -e README.txt && mv README.txt README || exit 0
clean:
	git clean -Xdf
distclean: clean
	rm -f *.{pdf,cls} README README.txt
$(NAME).cls: $(NAME).dtx
	-pdflatex -recorder -interaction=nonstopmode $(NAME).dtx
	biber $(NAME).bcf
	texindy $(NAME).idx
	makeglossaries $(NAME)
	-pdflatex -recorder -interaction=nonstopmode $(NAME).dtx
	-pdflatex -recorder -interaction=nonstopmode $(NAME).dtx
	texindy $(NAME).idx
	-pdflatex -recorder -interaction=nonstopmode $(NAME).dtx
	-pdflatex -recorder -interaction=nonstopmode $(NAME).dtx
inst: all
	mkdir -p $(UTREE)/{tex,source,doc}/latex/$(NAME)
	cp $(NAME).dtx $(UTREE)/source/latex/$(NAME)
	cp $(NAME).cls $(UTREE)/tex/latex/$(NAME)
	cp $(NAME).cls $(UTREE)/doc/latex/$(NAME)
install: all
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	sudo cp $(NAME).dtx $(LOCAL)/source/latex/$(NAME)
	sudo cp $(NAME).cls $(LOCAL)/tex/latex/$(NAME)
	sudo cp $(NAME).cls $(LOCAL)/doc/latex/$(NAME)
zip: all
	mkdir $(TDIR)
	cp $(NAME).{pdf,dtx} fei-template*.tex referencias.bib README $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME)
templates: $(NAME).cls
	-pdflatex -recorder -interaction=nonstopmode fei-template.tex
	biber fei-template.bcf
	texindy fei-template.idx
	makeglossaries fei-template
	-pdflatex -recorder -interaction=nonstopmode fei-template.tex
	-pdflatex -recorder -interaction=nonstopmode fei-template.tex
	texindy fei-template.idx
	-pdflatex -recorder -interaction=nonstopmode fei-template.tex
	-pdflatex -recorder -interaction=nonstopmode fei-template.tex
	-pdflatex -recorder -interaction=nonstopmode fei-template-sublist.tex
	biber fei-template-sublist.bcf
	makeglossaries fei-template-sublist
	texindy fei-template.idx
	-pdflatex -recorder -interaction=nonstopmode fei-template-sublist.tex
	-pdflatex -recorder -interaction=nonstopmode fei-template-sublist.tex
	texindy fei-template.idx
	-pdflatex -recorder -interaction=nonstopmode fei-template-sublist.tex
	-pdflatex -recorder -interaction=nonstopmode fei-template-sublist.tex
format:
	mv fei.dtx tmp.cls
	latexindent -w tmp.cls
	mv tmp.cls fei.dtx
