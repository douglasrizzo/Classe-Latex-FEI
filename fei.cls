%-------------------------------------------------------------
% Classe LaTeX da FEI para criação de trabalhos acadêmicos
% de acordo com o manual de 2007 da biblioteca
% Autores: Leonardo Anjoletto Ferreira
%          Douglas De Rizzo Meneghetti
%
% Rep. oficial: http://github.com/Tetamusha/Classe-Latex_FEI
%-------------------------------------------------------------
% Aqui comeca a classe
%-------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e} 
\ProvidesClass{fei}[2014/05/06 Modelo da FEI]
\LoadClass{report}

% passa a opção do xindy pros pacotes que podem utilizá-lo
\DeclareOption{xindy}{
  \PassOptionsToPackage{\CurrentOption}{imakeidx}
  \PassOptionsToPackage{\CurrentOption}{glossaries}
}

% opções rascunho e final controlam a exibição da folha
% de aprovação e ficha catalográfica
\DeclareOption{rascunho}
{
\newif\iflogvar
}

\DeclareOption{final}
{
\newif\iflogvar
\logvartrue
}

\ExecuteOptions{final} % final é padrão

\ProcessOptions\relax % processa todas as opções

% tamanho do papel (A4) e margens
\setlength{\paperheight}{297mm} 
\setlength{\paperwidth}{210mm}
\RequirePackage[top=3cm,bottom=2cm,left=3cm,right=2cm]{geometry}

% cabecalho e rodape
\RequirePackage{fancyhdr}
\fancyhf{}
\rhead{\thepage}
\renewcommand{\footrulewidth}{0pt}
\renewcommand{\headrulewidth}{0pt}
\setlength{\headheight}{14.4pt}

% carrega idiomas e caracteres de saída de 8 bits
\RequirePackage[english,brazil]{babel}
\RequirePackage[T1]{fontenc}

% espaçamento do texto
\RequirePackage{setspace}      % pacote para controlar o espacamento
\onehalfspace                  % espacamento de 1,5 (segundo manual)
\setlength{\parindent}{1.25cm} % recuo do paragrafo

\renewcommand{\normalsize}{\fontsize{12pt}{14.4pt}\selectfont} % fonte do texto
\renewcommand{\footnotesize}{\fontsize{10pt}{12pt}\selectfont} % fonte das notas de rodapé
\RequirePackage[font={small,singlespacing},justification=justified,labelsep=endash]{caption} % fontes das legendas

\pagenumbering{arabic} % estilo da numeração das páginas
\pagestyle{fancy} % estilo dos cabeçalhos/rodapés
\selectlanguage{brazil} % idioma do documento

% linhas orfas e viuvas (verificar o limite)
\widowpenalty=10000
\clubpenalty=10000

% outros pacotes
\RequirePackage{mathtools}     % matematica
\RequirePackage{lmodern}       % Latin Modern, fontes tipográficas mais recentes que as do Knuth (Computer Modern)
\RequirePackage{times}         % Times New Roman como fonte de tudo
\RequirePackage{graphicx}      % figuras
\RequirePackage{morewrites}    % permite ao LaTeX escrever em mais de 16 arquivos auxiliares simultaneamente

% pacote de algoritmos e tradução do scomandos
\RequirePackage[plain,portuguese,algochapter,linesnumbered,inoutnumbered]{algorithm2e}
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

%outras opções do pacote de algoritmos
\SetAlgoCaptionSeparator{--} % separador da legenda
\SetAlCapFnt{\normalfont} % fonte da legenda
\SetAlCapSkip{10pt} % espaçamento entre algoritmo e legenda
% teoremas
\RequirePackage{amsthm,thmtools}
\renewcommand{\listtheoremname}{Lista de Teoremas} % traduz nome da lista de teoremas

% declaração dos principais tipos de teoremas que o usuário pode querer vir a usar
\declaretheorem[style=definition,name=Axioma,qed=\qedsymbol]{axioma}
\declaretheorem[style=definition,name=Teorema,qed=\qedsymbol]{teorema}
\declaretheorem[style=definition,name=Lema,qed=\qedsymbol]{lema}
\declaretheorem[style=definition,name=Hip\'otese,qed=\qedsymbol]{hipotese}
\declaretheorem[style=definition,name=Proposi\c{c}\~ao,qed=\qedsymbol]{proposicao}
\declaretheorem[style=definition,name=Conjectura,qed=\qedsymbol]{conjectura}
\declaretheorem[style=definition,name=Paradoxo,qed=\qedsymbol]{paradoxo}
\declaretheorem[style=definition,name=Corol\'ario,qed=\qedsymbol]{corolario}
\declaretheorem[style=definition,name=Defini\c{c}\~ao,qed=\qedsymbol]{definicao}
\declaretheorem[style=definition,name=Exemplo,qed=\qedsymbol]{exemplo}
\declaretheorem[style=remark,name=Demonstra\c{c}\~ao,qed=\qedsymbol,numbered=no]{prova}

% contadores de floats serão contínuos
\usepackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{algocf}{chapter}
\counterwithout{equation}{chapter}

% configuracao da legenda da figura
\renewcommand{\figurename}{\fontsize{10pt}{10pt}\selectfont Figura}
\renewcommand{\tablename}{\fontsize{10pt}{10pt}\selectfont Tabela}
% listas
\renewenvironment{itemize}{\begin{enumerate}}{\end{enumerate}} % troca o itemize pelo enumerate (seguindo o manual da biblioteca)
\renewcommand{\theenumi}{\alph{enumi})}                        % deixa as listas com letras no lugar do numero
\renewcommand{\labelenumi}{\theenumi}                          % continuacao
 
\renewcommand{\theenumii}{--}                      % troca a numeracao no segundo nivel para letras
\renewcommand{\labelenumii}{\theenumii}            % continuacao

% divisoes do texto
\renewcommand{\part}{% não usado no texto, só para algumas páginas (resumo, abstract, agradecimentos...)
\@startsection{part}{-1}{0pt}{2\baselineskip}{2\baselineskip}{\clearpage\fontsize{12pt}{14.4pt}\centering\bf\MakeUppercase}}

\renewcommand{\chapter}{%
\@startsection{chapter}{0}{0pt}{12pt}{2\baselineskip}{\clearpage\thispagestyle{fancy}\fontsize{12pt}{14.4pt}\bf\MakeUppercase}}

\renewcommand{\section}{% 
\@startsection{section}{1}{0pt}{2\baselineskip}{2\baselineskip}{\fontsize{12pt}{14.4pt}\bf}}

\renewcommand{\subsection}{% 
\@startsection{subsection}{2}{0pt}{2\baselineskip}{2\baselineskip}{\fontsize{12pt}{14.4pt}}}

\renewcommand{\subsubsection}{% 
\@startsection{subsubsection}{3}{0pt}{2\baselineskip}{2\baselineskip}{\fontsize{12pt}{14.4pt}}}

\setcounter{secnumdepth}{3} % numerar divisões até o terceiro nível (subsubsection)
\setcounter{tocdepth}{3} % incluir divisões no sumário até o terceiro nível (subsubsection)

\RequirePackage{tocloft} % para poder fazer mais coisas no sumario e nas listas

%% configuracao do sumario e listas de tabelas e figuras
% títulos centralizados, negritos e maiúsculos
\renewcommand{\cfttoctitlefont}{\clearpage\thispagestyle{empty}\hfil\bf\MakeUppercase}
\renewcommand{\cftloftitlefont}{\clearpage\thispagestyle{empty}\hfill\bf\MakeUppercase}
\renewcommand{\cftlottitlefont}{\clearpage\thispagestyle{empty}\hfill\bf\MakeUppercase}
\renewcommand{\cftafterloftitle}{\hfill}
\renewcommand{\cftafterlottitle}{\hfill}

% sumário não possui recuo
\renewcommand{\cftchapindent}{0pt}
\renewcommand{\cftsecindent}{0pt}
\renewcommand{\cftsubsecindent}{0pt}
\renewcommand{\cftsubsubsecindent}{0pt}

\renewcommand{\cftchapfont}{\bfseries} % coloca o titulo do capítulo em negrito
\renewcommand{\cftchappagefont}{} % o número da página do capítulo não é em negrito
\renewcommand{\cftsecfont}{\bfseries} % coloca o titulo da secao emm negrito
\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}} % pontos no sumário para partes
\renewcommand{\cftchapleader}{\cftdotfill{\cftdotsep}} % pontos no sumário para capítulos

% redefinindo listas de algoritmos e teoremas para formatar seus títulos
\renewcommand{\listofalgorithms}{\part*{\listalgorithmcfname}\thispagestyle{empty}\@starttoc{loa}}
\renewcommand{\listoftheorems}{\part*{\listtheoremname}\thispagestyle{empty}\@starttoc{loe}}

\def\and{\\} % modifica função do comando \and para ele ser usado na declaração de múltiplos autores

% novas paginas
% capa
\renewcommand{\maketitle}{
\clearpage
\thispagestyle{empty}
\begin{center}
\textbf{
\MakeUppercase{\@instituicao}\\[\baselineskip]
\uppercase\expandafter{\@author}
\vfill
\MakeUppercase{\@title}\ifthenelse{\isundefined{\@subtitulo}}{}{: \@subtitulo}}
\vfill
\@cidade\\
\number\year
\end{center}
}

% folha de rosto
\newenvironment{folhaderosto}{
\clearpage
\thispagestyle{empty}
\begin{center}
\uppercase\expandafter{\@author}\\
\vspace*{0.45\textheight}
\textbf{\MakeUppercase{\@title}}\ifthenelse{\isundefined{\@subtitulo}}{}{: \@subtitulo}
\vfill
\begin{flushright}
\begin{minipage}{0.55\textwidth}}{\end{minipage}{}
\end{flushright}
\vfill
\@cidade\\
\number\year
\end{center}}

% folha de aprovação: procura o arquivo *ata.pdf* e inclui no texto
% se a classe recebeu a opção rascunho, deixa um texto no lugar falando que pagina é essa
\RequirePackage{pdfpages}
\RequirePackage{ifthen}
\newcommand{\folhadeaprovacao}{
\iflogvar
  \includepdf{ata.pdf}
\else
  \clearpage\thispagestyle{empty}\mbox{}\vfill\begin{center}\begin{Huge}Folha de aprova\c{c}\~{a}o\end{Huge}\vfill\end{center}
\fi
}

% ficha catalográfica: funciona da mesma forma da folha de aprovação, só que procura o arquivo *ficha.pdf*
\newcommand{\fichacatalografica}{
    \addtocounter{page}{-1}
	\iflogvar
		\includepdf{ficha.pdf}
	\else
		\clearpage\thispagestyle{empty}\mbox{}\vfill\begin{center}\begin{Huge}Ficha catalogr\'{a}fica\end{Huge}\vfill\end{center}
	\fi
}

% subtítulo
\newcommand{\subtitulo}[1]{\def\@subtitulo{#1}}

% cidade (padrão São Bernardo do Campo)
\def\@cidade{S\~ao Bernardo do Campo}
\newcommand{\cidade}[1]{\def\@cidade{#1}}

% instituicao (padrão Centro Universitário da FEI)
\def\@instituicao{Centro Universit\'ario da FEI}
\newcommand{\instituicao}[1]{\def\@instituicao{#1}}

% dedicatória
\newcommand{\dedicatoria}[1]{
\clearpage
\thispagestyle{empty}
\begin{flushleft}
\vspace*{0.5\paperheight\relax}
\hspace*{0.5\paperwidth\relax}
\begin{minipage}[l]{0.35 \textwidth}
#1
\end{minipage}
\end{flushleft}
}

% epígrafe
\newcommand{\epigrafe}[2]{
\clearpage
\thispagestyle{empty}
\begin{flushleft}
\vspace*{0.5\paperheight\relax}
\hspace*{0.4\paperwidth\relax}
\begin{minipage}[l]{0.5\textwidth}
\textit{``{#1}''
\\
#2}
\end{minipage}
\end{flushleft}
}

% resumo
\newenvironment{resumo}{\part*{Resumo}\thispagestyle{empty}\begin{singlespace}\noindent\normalsize}{\end{singlespace}}

% abstract
\renewenvironment{abstract}{\selectlanguage{english}\part*{Abstract}\thispagestyle{empty}\begin{singlespace}\noindent\normalsize}{\end{singlespace}\selectlanguage{brazil}}

% agradecimentos
\newenvironment{agradecimentos}{\part*{Agradecimentos}\thispagestyle{empty}}{}

% índice
\RequirePackage{imakeidx}
\renewcommand{\indexname}{\'Indice}
\let\oldmakeindex\makeindex
\let\oldprintindex\printindex
\renewcommand{\makeindex}{\oldmakeindex[title=\hfill \'INDICE \hfill \mbox{}]}
\renewcommand{\printindex}{\addcontentsline{toc}{chapter}{\'INDICE}%
\renewcommand{\chapter}{%
\@startsection{chapter}{0}{0pt}{12pt}{2\baselineskip}{\clearpage\fontsize{12pt}{14.4pt}\bf\MakeUppercase}}%
\oldprintindex}%

% pacote para gerar listas (símbolos, abreviaturas, etc)
\RequirePackage[nogroupskip,nomain,acronym,nonumberlist]{glossaries}
\renewcommand*{\acronymname}{\hfill Lista de Abreviaturas \hfill \mbox{}}
\newglossary{simbolos}{sym}{sbl}{\hfill Lista de S\'imbolos \hfill \mbox{}}

\newcommand{\palavraschave}[1]{\mbox{}\\\noindent Palavras-chave: #1}% o resumo pede palavras chave no final
\newcommand{\keywords}[1]{\mbox{}\\\noindent Keywords: #1}% mesma coisa, mas pro abstract

% apendice novo
\renewcommand{\appendix}{%
\renewcommand{\chaptername}{\appendixname}%
\setcounter{chapter}{0}% zera o contador do capítulo
\renewcommand{\thechapter}{\Alph{chapter}}% deixa o contador do capítulo em alfabético
\renewcommand{\chapter}[1]{% redefine o comando do capítulo
\stepcounter{chapter}% soma 1 ao contador do capítulo
\clearpage\thispagestyle{empty}\mbox{}\vfill\begin{center}\MakeUppercase{AP\^ENDICE \thechapter\ -- ##1}\end{center}\vfill% adiciona uma folha com a letra e título do apêndice
\addcontentsline{toc}{chapter}{AP\^ENDICE \Alph{chapter} -- ##1}%
\newpage%
}%
}%

% anexo (funciona da mesma forma do apendice, soh alterando os nomes)
\newcommand{\anexos}{%
\renewcommand{\chaptername}{Anexo}%
\setcounter{chapter}{0}%
\renewcommand{\thechapter}{\Alph{chapter}}%
\renewcommand{\chapter}[1]{%
\stepcounter{chapter}%
\clearpage\thispagestyle{empty}\mbox{}\vfill\begin{center}\MakeUppercase{ANEXO \thechapter\ -- ##1}\end{center}\vfill%
\addcontentsline{toc}{chapter}{ANEXO \Alph{chapter} -- ##1}%
\newpage%
}%
}%

% hyperlinks entre partes do documento
% deve ser o último a ser carregado, exceto pelo abntex2cite, simplesmente porque deu erro quando tentei
\RequirePackage[pdftex,pdfborder={0 0 0},colorlinks={false}]{hyperref}

% referências e citações
\RequirePackage[alf,abnt-emphasize=bf]{abntex2cite} %abnTeX alfabético com títulos das publicações em negrito nas referências (como no modelo antigo da ABNT)

% modifica ambiente quote para citações de um parágrafo com mais de 3 linhas
\renewenvironment{quote}
               {\begin{singlespace}\list{}{%
               \fontsize{10pt}{1em}%
               \leftmargin=2cm \rightmargin=2cm}%
               \item\relax\ignorespaces}
               {\endlist\end{singlespace}}

% quotation é igual a quote, porém para citações com mais de um parágrafo.
\renewenvironment{quotation}
               {\begin{singlespace}\list{}{%
               \fontsize{10pt}{1em}%
               \leftmargin=2cm \rightmargin=2cm%
               \listparindent .5cm \itemindent}%
                \item\relax}
               {\endlist\end{singlespace}}

\let\oldbibliography\bibliography
\renewcommand{\bibliography}[1]{%
\renewcommand{\bibname}{\hfill Refer\^encias \hfill\mbox{}}% muda o nome do titulo (modelo da biblioteca)
\clearpage
\addcontentsline{toc}{chapter}{REFER\^ENCIAS}% adiciona o titulo ao sumario
\begin{singlespace}
\oldbibliography{#1}% adiciona realmente a bibliografia
\end{singlespace}
}