#!/bin/bash
if [[ $# -eq 0 ]] ; then
    echo 'Coloque o nome do arquivo sem a extencao. Ex: sh compilador.sh fei-template'
    exit 0
fi

pdflatex $1
bibtex $1
makeindex $1
makeglossaries $1
pdflatex $1
pdflatex $1

FILENAMEBEFORE=$1.pdf
FILESIZEBEFORE=$(ls -lh "$FILENAMEBEFORE"| awk '/d|-/{printf("%s\n",$5)}')
echo
echo "Tamanho do arquivo $FILENAMEBEFORE = $FILESIZEBEFORE bytes."
echo
date
echo
caja "$FILENAMEBEFORE"
