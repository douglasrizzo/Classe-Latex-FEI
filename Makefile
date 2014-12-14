NAME  = fei
SHELL = bash
PWD   = $(shell pwd)
TEMP := $(shell mktemp -d)
TDIR  = $(TEMP)/$(NAME)
VERS  = $(shell ltxfileinfo -v $(NAME).cls)
LOCAL = $(shell kpsewhich --var-value TEXMFLOCAL)
UTREE = $(shell kpsewhich --var-value TEXMFHOME)
all:	$(NAME).pdf clean
	test -e README.txt && mv README.txt README || exit 0
$(NAME).pdf: $(NAME).dtx
	-pdflatex -shell-escape -recorder -interaction=nonstopmode $(NAME).dtx
	bibtex $(NAME).aux
	makeindex $(NAME).idx
	makeglossaries $(NAME)
	-pdflatex -shell-escape -recorder -interaction=nonstopmode $(NAME).dtx
	-pdflatex -shell-escape -recorder -interaction=nonstopmode $(NAME).dtx
clean:
	rm -f $(NAME).{acn,acr,alg,aux,bbl,blg,fls,glg,glo,gls,glsdefs,hd,idx,ilg,ind,ins,ist,log,toc,loa,loe,lof,lot,mw,out,sbl,sym,xdy}
distclean: clean
	rm -f $(NAME).{pdf,cls} README README.txt
inst: all
	mkdir -p $(UTREE)/{tex,source,doc}/latex/$(NAME)
	cp $(NAME).dtx $(UTREE)/source/latex/$(NAME)
	cp $(NAME).cls $(UTREE)/tex/latex/$(NAME)
	cp $(NAME).pdf $(UTREE)/doc/latex/$(NAME)
install: all
	sudo mkdir -p $(LOCAL)/{tex,source,doc}/latex/$(NAME)
	sudo cp $(NAME).dtx $(LOCAL)/source/latex/$(NAME)
	sudo cp $(NAME).cls $(LOCAL)/tex/latex/$(NAME)
	sudo cp $(NAME).pdf $(LOCAL)/doc/latex/$(NAME)
zip: all
	mkdir $(TDIR)
	cp $(NAME).{pdf,cls,dtx} README $(TDIR)
	cd $(TEMP); zip -Drq $(PWD)/$(NAME)-$(VERS).zip $(NAME)
