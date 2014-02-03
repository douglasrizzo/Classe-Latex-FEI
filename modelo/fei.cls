% Tirando os comandos e ambientes refeitos para que a classe siga o modelo da FEI, alguns comandos/ambientes foram criados para facilitar a criacao de algumas caracteristicas do padrao da FEI e outros comandos/ambientes foram refeitos para nao causar problemas na formatacao

% Novos comandos/ambientes:

% - *subtitulo* [comando]: guarda o subtítulo do trabalho, se houver. Este, então, aparece na capa e folha de rosto, separado do título por dois pontos, como pede a norma da ABNT.

% - *bibliografia* [comando]: arruma a bibliografia no modelo da FEI. Coloca a pagina de referencia no sumario, arruma o titulo e deixa centralizado e recebe como argumento o arquivo .bib, substituindo o \bibliography{}.

% - *figuras*,*tabelas*, *sumario* [comandos]: foram criados os comandos \figuras{}, \tabelas{} e \sumario{} para geras as listas de acordo com o modelo da FEI. A lista de algoritmos nao possui comando novo, eh utilizado o \listofalgorithms{} 

% - *folhaderosto* [ambiente]: so eh necessario colocar o texto que fica entre o titulo e o nome do autor. "Dissertacao de mestrado entregue..."

% - *folhadeaprovacao* [comando]: insere a ata da banca (no formato pdf) como pagina. Se 'ata.pdf' nao for encontrado, deixa um texto com avisando que eh a pagina da folha de aprovacao.

% - *fichacatalografica* [comando]: insere a pagina fornecida pela biblioteca e subtrai o contador de pagina (a ficha catalografica nao conta no numero de paginas). Se 'ficha.pdf' nao for encontrado, deixa um texto no lugar.

% - *dedicatoria* [comando]: cria a pagina com a dedicatoria do trabalho

% - *epigrafe* [comando]: cria a pagina com a epigrafe do trabalho, a partir do centro para a direita

% - *resumo* e *abstract* [ambientes]: recebem o texto de resumo e abstract e formatam no formato da FEI.

% - *agradecimentos* [ambiente]: pagina com o ambiente para os agradecimentos. 

% - *outralingua* [comando]: o formato da ABNT pede que palavras em outra lingua sejam em italico, mas como eles podem mudar (e a FEI nem sempre segue a ABNT) o comando \outralingua{} deixa a palavra em italico. Se durante o trabalho eles mudarem, eh so trocar o comando e recompilar.

% - *palavraschave* e *keyword* [comandos]: dentro do *resumo* e *abstract* devem ser colocadas as palavras chaves. Os comandos deixam nas linguas certas para que seja mais dificil de acontecer o erro na divisao de silabas.

% Comandos/ambientes refeitos:

% - Variaveis do pacote *algorithmic*: a maior parte dos comandos foram apenas traduzidos, porem ensure, loop e endloop foram usadas para facilitar a escrita para o aprendizado por reforco.

% - *itemize*: o modelo da FEI so aceita listas com letras. O comando *itemize* foi redirecionado para utilizar o *enumerate*.

% - *enumerate*: as variaveis *theenumi* e *theenumii* foram mudadas para serem letras no lugar de numeros

% - *maketitle*: alem dos valores de \author{} e \title{}, pode receber um parametro para utilizar como subtitulo

%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% Aqui comeca a classe %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{fei}[2010/06/30 Modelo da FEI] 
\LoadClass{report}

% tamanho do papel (A4) e margens
\setlength{\paperheight}{297mm} 
\setlength{\paperwidth}{210mm}
\RequirePackage[top=2cm,bottom=3cm,left=3cm,right=2cm]{geometry}

% cabecalho e rodape
\RequirePackage{fancyhdr}
\fancyhf{}
\rhead{\thepage}
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\headrulewidth}{0pt}
\setlength{\headheight}{14.4pt}

% i18n
\RequirePackage[english,brazil]{babel}
\RequirePackage[T1]{fontenc}

% algoritmos
\RequirePackage[boxed,portuguese]{algorithm2e}
\SetKwInput{Entrada}{Entrada}
\SetKwInput{Saida}{Sa\'ida}
\SetKwInput{Dados}{Dados}
\SetKwInput{Resultado}{Resultado}
\SetKw{Ate}{at\'e}
\SetKw{KwRetorna}{retorna}
\SetKw{Retorna}{retorna}
\SetKwBlock{Inicio}{in\'icio}{fim}
\SetKwIF{Se}{SenaoSe}{Senao}{se}{ent\~ao}{sen\~ao se}{sen\~ao}{fim se}
\SetKwSwitch{Selec}{Caso}{Outro}{selecione}{faça}{caso}{sen\~ao}{fim caso}{fim selec}
\SetKwFor{Para}{para}{fa\c{c}a}{fim para}
\SetKwFor{ParaPar}{para}{fa\c{c}a em paralelo}{fim para}
\SetKwFor{ParaCada}{para cada}{fa\c{c}a}{fim para cada}
\SetKwFor{ParaTodo}{para todo}{fa\c{c}a}{fim para todo}
\SetKwFor{Enqto}{enquanto}{fa\c{c}a}{fim enqto}
\SetKwRepeat{Repita}{repita}{at\'e}

% matematica
\RequirePackage{mathtools}

% outros pacotes
\usepackage{times}             % Times New Roman como fonte de tudo
\RequirePackage{graphicx}      % figuras
\RequirePackage{paralist}      % listas na mesma linha
\RequirePackage{multirow}      % uma coluna ocupando varias linhas
\RequirePackage[table]{xcolor} % cores na tabela
\RequirePackage[pdftex,pdfborder={0 0 0},colorlinks={false}]{hyperref} % links dentro do texto

% configuracao do texto
\RequirePackage{setspace}      % pacote para controlar o espacamento
\onehalfspace                  % espacamento de 1,5 (segundo manual)
\setlength{\parindent}{1.25cm} % recuo do paragrafo

\renewcommand{\normalsize}{\fontsize{12pt}{14.4pt}\selectfont} % fonte do texto 
\renewcommand{\footnotesize}{\fontsize{10pt}{12pt}\selectfont} % fonte das notas de rodape 

% linhas orfas e viuvas (verificar o limite)
\widowpenalty=10000
\clubpenalty=10000

% legendas
\RequirePackage[font={small,rm,singlespacing},justification=centering,labelsep=endash]{caption}

% configuracao da legenda da figura
\renewcommand{\figurename}{\fontsize{10pt}{10pt}\selectfont Figura}
\renewcommand{\tablename}{\fontsize{12pt}{14.4pt}\selectfont Tabela}
% listas
\renewenvironment{itemize}{\begin{enumerate}}{\end{enumerate}} % troca o itemize pelo enumerate (seguindo o manual da biblioteca)
\renewcommand{\theenumi}{\alph{enumi})}                        % deixa as listas com letras no lugar do numero
\renewcommand{\labelenumi}{\theenumi}                          % continuacao
 
\renewcommand{\theenumii}{\alph{enumii})}                      % troca a numeracao no segundo nivel para letras
\renewcommand{\labelenumii}{\theenumii}                        % continuacao

% divisoes do texto
\renewcommand{\part}{% não usado no texto, só para algumas páginas (resumo, abstract, agradecimentos...)
\@startsection{part}{-1}{0pt}{2\baselineskip}{2\baselineskip}{\fontsize{12pt}{14.4pt}\bf\MakeUppercase}}

\renewcommand{\chapter}{%
\@startsection{chapter}{0}{0pt}{12pt}{2\baselineskip}{\newpage\fontsize{12pt}{14.4pt}\bf\MakeUppercase}}

\renewcommand{\section}{% 
\@startsection{section}{1}{0pt}{2\baselineskip}{2\baselineskip}{\fontsize{12pt}{14.4pt}\bf}}

\renewcommand{\subsection}{% 
\@startsection{subsection}{2}{0pt}{2\baselineskip}{2\baselineskip}{\fontsize{12pt}{14.4pt}}}

\renewcommand{\subsubsection}{% 
\@startsection{subsubsection}{3}{0pt}{2\baselineskip}{2\baselineskip}{\fontsize{12pt}{14.4pt}}}

\setcounter{secnumdepth}{3} % numerar divisões até o terceiro nível (subsubsection)
\setcounter{tocdepth}{3} % incluir divisões no sumário até o terceiro nível (subsubsection)

% titulos de listas centralizadas
\RequirePackage{tocloft} % para poder fazer mais coisas no sumario e nas listas

\newcommand{\sumario}{\newpage\begin{center}\part*{Sum\'ario}\end{center}\@starttoc{toc}\thispagestyle{empty}\pagestyle{fancy}}
\newcommand{\figuras}{\newpage\begin{center}\part*{Lista de Figuras}\end{center}\@starttoc{lof}}
\newcommand{\tabelas}{\newpage\begin{center}\part*{Lista de Tabelas}\end{center}\@starttoc{lot}}
\renewcommand{\listoftables}{\begin{center}\listof{tables}{\listtablesname}\end{center}}
\renewcommand{\listofalgorithms}{\newpage\begin{center}\part*{\listalgorithmcfname}\end{center}\@starttoc{loa}}

% configuracao do sumario
\renewcommand{\cftsecfont}{\bfseries} % coloca o titulo da secao com negrito

% novas paginas
% capa
\renewcommand{\maketitle}{
\selectlanguage{brazil}
\newpage
\pagestyle{empty}
\begin{center}
\uppercase{centro universit\'ario da fei}\\
\MakeUppercase{\@author}
\vfill
\textbf{\MakeUppercase{\@title}\ifthenelse{\isundefined{\@subtitulo}}{}{: \@subtitulo}}
\vfill
S\~ao Bernardo do Campo\\
\number\year
\end{center}
}

% folha de rosto
\newenvironment{folhaderosto}{
\newpage
\pagenumbering{arabic}
\begin{center}
\MakeUppercase{\@author}\\
\vspace*{0.45\textheight}
\ifthenelse{\isundefined{\@subtitulo}}{\textbf{\@title}}{\textbf{\@title: \@subtitulo}}\\
\vfill
\begin{flushright}
\begin{minipage}{0.55\textwidth}}{\end{minipage}{}
\end{flushright}
\vfill
S\~ao Bernardo do Campo\\
\number\year
\end{center}}

% folha de aprovacao: procura o arquivo *ata.pdf* e inclui no texto, se nao encontrar, deixa um texto no lugar falando que pagina é essa
\RequirePackage{pdfpages}
\RequirePackage{ifthen}
\newcommand{\folhadeaprovacao}[1]{
    \ifthenelse{\equal{#1}{ata.pdf}}{\includepdf{#1}}{\newpage\mbox{}\vfill\begin{center}\begin{Huge}Folha de aprova\c{c}\~{a}o\end{Huge}\vfill\end{center}}
}

% ficha catalografica: funciona da mesma forma da folha de aprovacao, so que procura o arquivo *ficha.pdf*
\newcommand{\fichacatalografica}[1]{
    \addtocounter{page}{-1}
    \ifthenelse{\equal{#1}{ficha.pdf}}{\includepdf{#1}}{\newpage\mbox{}\vfill\begin{center}\begin{Huge}Ficha catalogr\'{a}fica\end{Huge}\vfill\end{center}}
}

% subtítulo
\newcommand{\subtitulo}[1]{\def\@subtitulo{#1}}

% dedicatoria
\newcommand{\dedicatoria}[1]{
\newpage
\begin{flushleft}
\vspace*{0.5\paperheight\relax}
\hspace*{0.5\paperwidth\relax}
\begin{minipage}[l]{0.35 \textwidth}
#1
\end{minipage}
\end{flushleft}
}

% epigrafe
\newcommand{\epigrafe}[2]{
\newpage
\begin{flushleft}
\vspace*{0.5\paperheight\relax}
\hspace*{0.4\paperwidth\relax}
\begin{minipage}[l]{0.5\textwidth}
\aspas{#1}
\\
#2
\end{minipage}
\end{flushleft}
}

% resumo
\newenvironment{resumo}{\newpage\begin{center}\part*{Resumo}\end{center}\begin{singlespace}\noindent\normalsize}{\end{singlespace}}

% abstract
\renewenvironment{abstract}{\selectlanguage{english}\newpage\begin{center}\part*{Abstract}\end{center}\begin{singlespace}\noindent\normalsize}{\end{singlespace}\selectlanguage{brazil}}

% agradecimentos
\newenvironment{agradecimentos}{\newpage\begin{center}\part*{Agradecimentos}\end{center}}{}

%índice
\RequirePackage[xindy]{imakeidx}
\renewcommand{\indexname}{\'Indice}

%lista de símbolos e de abreviaturas
\RequirePackage[nomain,xindy,acronym]{glossaries}
\renewcommand*{\acronymname}{\hfill Lista de Abreviaturas \hfill \mbox{}}

\newcommand{\aspas}[1]{``#1''}                                                % coloca as aspas no jeito do latex, uma coisa que eu sempre errei
\newcommand{\marca}{\cellcolor{darkgray}}                                     % deixa a celula da tabela em cinza (usado para fazer o cronograma)
\newcommand{\palavraschave}[1]{\mbox{}\\\noindent\textbf{Palavras-chave:} #1} % o resumo pede palavras chave no final
\newcommand{\keyword}[1]{\mbox{}\\\noindent\textbf{Keywords:} #1}             % mesma coisa, mas pro abstract

% apendice
\newcommand{\apendice}[1]{                                                           % caso exista apenas 1 apendice, nao eh necessario  enumerar cada um
\addcontentsline{toc}{chapter}{AP\^ENDICE - #1}                                      % adiciona o apendice no sumario
\mbox{}\vfill\begin{center}\part*{AP\^ENDICE - #1}\end{center}\vfill\mbox{}\newpage} % coloca o titulo do apendice segundo o manual

% mesma coisa para mais de um apendice
\newcounter{ap}             % contador para o numero de apendices 
\setcounter{ap}{1}          % inicia o contador em 1
\newcommand{\apendices}[1]{ % mesma coisa do anterior, soh que tem o "s" no final para diferenciar o nome do comando
\addcontentsline{toc}{chapter}{AP\^ENDICE \Alph{ap} - #1}%
\mbox{}\vfill\begin{center}\part*{AP\^ENDICE \Alph{ap} - #1}\addtocounter{ap}{1}\end{center}\vfill\mbox{}\newpage}

% anexo (funciona da mesma forma do apendice, soh alterando os nomes)
\newcommand{\anexo}[1]{%
\addcontentsline{toc}{chapter}{ANEXO - #1}%
\mbox{}\vfill\begin{center}\part*{ANEXO - #1}\end{center}\vfill\mbox{}\newpage}

\newcounter{an}
\setcounter{an}{1}
\newcommand{\anexos}[1]{%
\addcontentsline{toc}{chapter}{ANEXO \Alph{an} - #1}%
\mbox{}\vfill\begin{center}\part*{ANEXO \Alph{an} - #1}\addtocounter{an}{1}\end{center}\vfill\mbox{}\newpage}

% bibliografia

\newcommand{\bibliografia}[1]{%
\addcontentsline{toc}{chapter}{REFERÊNCIAS}                 % adiciona o titulo ao sumario
\renewcommand{\bibname}{\hfill Refer\^encias \hfill\mbox{}} % muda o nome do titulo (modelo da biblioteca)
\begin{singlespace}
\bibliography{#1}  % adiciona realmente a bibliografia
\end{singlespace}
}