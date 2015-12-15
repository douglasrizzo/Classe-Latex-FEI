[![Build Status](https://travis-ci.org/douglasrizzo/Classe-Latex-FEI.svg?branch=master)](https://travis-ci.org/douglasrizzo/Classe-Latex-FEI)

#Classe Latex da FEI
Este repositório contém a classe LaTeX do Centro Universitário da FEI para formatação de trabalhos acadêmicos (monografia, dissertação ou tese), baseada no guia formatação de 2015 da biblioteca. A classe possibilita a criação de um trabalho acadêmico completo, com inserção de elementos pré-textuais (capa, folha de rosto, ficha catalográfica, epígrafe, dedicatória, sumário e listas de figuras, tabelas, algoritmos, siglas e símbolos), passando pelo corpo do texto e elementos pós-textuais (índice remissivo, referências bibliográficas, apêndices e anexos).

No manual, os usuários encontrarão informações detalhadas sobre a utilização da classe, seus comandos e algumas boas práticas para que o trabalho fique no formato desejado pela biblioteca.

## Instalação
A partir de setembro de 2015, a classe foi disponibilizada no [CTAN][fei-ctan], sob o acrônimo `fei`. Usuários que possuem as versões mais recentes do [TeX Live][texlive] e do [MikTeX][miktex] podem baixar a classe usando os gerenciadores de pacotes das respectivas distribuições.

A versão mais recente da classe pode sempre ser encontrada no [GitHub][latex-fei].

## Utilização
Em seu formato mais simples, a classe pode ser usada adicionando a linha

    \documentclass{fei}

no início do documento `.tex`. O [manual][manual] da classe detalha todas as funcionalidades da classe. Dois [modelos][template] [básicos][template-sublist] prontos para compilação e alteração são disponibilizados no repositório.

##Licença
Released under the LaTeX Project Public License v1.3c or later
See http://www.latex-project.org/lppl.txt

##Controle de versão
Para saber as mudanças entre essa versão e as anteriores, [clique aqui](https://github.com/douglasrizzo/Classe-Latex-FEI/commits/master).

[fei-ctan]: http://ctan.org/pkg/fei
[texlive]: https://www.tug.org/texlive/
[miktex]: http://miktex.org/
[latex-fei]: https://github.com/douglasrizzo/Classe-Latex-FEI
[manual]: http://mirrors.ctan.org/macros/latex/contrib/fei/fei.pdf
[template]: https://raw.githubusercontent.com/douglasrizzo/Classe-Latex-FEI/master/fei-template.tex
[template-sublist]: https://raw.githubusercontent.com/douglasrizzo/Classe-Latex-FEI/master/fei-template-sublist.tex