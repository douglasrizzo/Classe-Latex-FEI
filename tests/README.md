# Testes

Os testes da classe são feitos usando partes de arquivos `.tex`, presentes no diretório `pieces` e criando documentos inteiros, os quais são posteriormente compilados utilizando a classe da FEI. Os testes possuem os objetivos de:

* verificar se um documento pode ser compilado sem possuir todas as partes, flexibilizando o uso da classe, além;
* verificar todas as opções existentes da classe, como sublist, pdfa, deposito etc.

A criação de novos documentos para teste pode ser feita no `Makefile`, *target* `tests`, seguindo o padrão dos documentos já existentes. Novas partes de documentos podem ser criadas no diretório `pieces` e utilizadas nos testes.

## line spacing

Esse diretório contém um documento do Word com espaçamento entre linhas de 1,5 e um documento no LaTeX com o mesmo conteúdo textual. Esse material pode ser utilizado para comparação das diferentes opções de espaçamento que o LaTeX provê com a do Word, uma vez que o julgamento sobre este espaçamento é feito pela biblioteca visualmente...