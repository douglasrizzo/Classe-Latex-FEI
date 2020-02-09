# Testes

O diretório `pieces` contém pedaços de arquivos `.tex`, os quais são unidos, formando diversos tipos diferentes de documentos, para realizar testes da classe da FEI com documentos com diferentes configurações.

Os pedaços são concatenados no `Makefile`, no target `tests`, usando o programa `awk`. Os documentos criados testam funcionalidades como:

* criar um documento somente com os itens obrigatórios;
* com todos os itens;
* somente frente;
* frente e verso;
* padrão `pdfa`;
* sublista de símbolos.

Os testes possuem os objetivos de verificar se um documento pode ser compilado sem possuir todas as partes, flexibilizando o uso da classe.

## line spacing

Esse diretório contém um documento do Word com espaçamento entre linhas de 1,5 e um documento no LaTeX com o mesmo conteúdo textual. Esse material pode ser utilizado para comparação das diferentes opções de espaçamento que o LaTeX provê com a do Word, uma vez que o julgamento sobre este espaçamento é feito pela biblioteca visualmente...