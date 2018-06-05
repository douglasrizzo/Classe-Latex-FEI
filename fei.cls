%%
%% This is file `fei.cls',
%% generated with the docstrip utility.
%%
%% The original source files were:
%%
%% fei.dtx  (with options: `class')
%% -----------------------------------------------------------------------------------------------------
%% fei --- Class for the creation of academic works under the typographic rules of FEI University Center
%% Author: Douglas De Rizzo Meneghetti
%% E-mail: douglasrizzo@fei.edu.br
%% 
%% Released under the LaTeX Project Public License v1.3c or later
%% See http://www.latex-project.org/lppl.txt
%% -----------------------------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{fei}[2018/03/02 4.1.1 Modelo da FEI]

\DeclareOption{xindy}{
 \PassOptionsToPackage{\CurrentOption}{imakeidx}
 \PassOptionsToPackage{\CurrentOption}{glossaries}
}

\newif\ifglossaries
\glossariesfalse
\DeclareOption{symbols}{
 \glossariestrue
 \PassOptionsToPackage{\CurrentOption}{glossaries}
}
\DeclareOption{acronym}{
 \glossariestrue
 \PassOptionsToPackage{\CurrentOption}{glossaries}
}
\newif\ifsublist
\sublistfalse
\DeclareOption{sublist}{\sublisttrue}

\newif\ifrascunho
\rascunhofalse
\DeclareOption{rascunho}{\rascunhotrue}

\newif\ifarial
\DeclareOption{arial}{\arialtrue}
\DeclareOption{times}{\arialfalse}

\newif\ifoneside
\DeclareOption{oneside}{\onesidetrue}
\DeclareOption{twoside}{\onesidefalse}

\DeclareOption{algo-as-figure}{\PassOptionsToPackage{figure}{algorithm2e}}%



\PassOptionsToClass{a4paper}{memoir}

\ExecuteOptions{oneside,times}

\ProcessOptions\relax % processa todas as opções

\ifoneside
 \LoadClass[oneside]{memoir}
\else
 \LoadClass{memoir}
\fi

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[english,brazil]{babel}
\RequirePackage{csquotes}

\renewcommand{\normalsize}{\fontsize{12pt}{14.4pt}\selectfont} % fonte do texto
\renewcommand{\footnotesize}{\fontsize{10pt}{12pt}\selectfont} % fonte das notas de rodapé

\setlrmarginsandblock{30mm}{20mm}{*}
\setulmarginsandblock{30mm}{20mm}{*}
\checkandfixthelayout

\linespread{1.25} % espaçamento entre linhas
\setlength{\parindent}{1.25cm} % recuo do paragrafo

\makepagestyle{title} % pagina de titulo
\makepagestyle{plain} % estilo padrão
\makeevenhead{plain}{\footnotesize\thepage}{}{}
\makeoddhead{plain}{}{}{\footnotesize\thepage}

\setlength{\headheight}{14.4pt} % remove warning do memoir

\RequirePackage[font={singlespacing},format=hang, justification=raggedright,labelsep=endash,singlelinecheck=false]{caption} % fontes das legendas

\selectlanguage{brazil} % idioma do documento

\widowpenalty=10000
\clubpenalty=10000

\RequirePackage{mathtools} % matematica
\RequirePackage{lmodern} % Latin Modern, fontes tipográficas mais recentes que as do Knuth (Computer Modern)
\RequirePackage{icomma} % vírgula como separador decimal

\ifarial
 \usepackage[scaled]{uarial}
 \renewcommand*\familydefault{\sfdefault} %% Only if the base font of the document is to be sans serif
\else
 \RequirePackage{times} % usar fonte times no texto todo
\fi

\RequirePackage{graphicx}      % figuras
\RequirePackage{morewrites}    % permite ao LaTeX escrever em mais de 16 arquivos auxiliares simultaneamente

\RequirePackage[plain,portuguese,algochapter,linesnumbered,inoutnumbered]{algorithm2e}
\SetKwInput{Entrada}{Entrada}
\SetKwInput{Saida}{Sa\'ida}
\SetKwInput{Dados}{Dados}
\SetKwInput{Resultado}{Resultado}
\SetKw{Ate}{at\'e}
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

\renewcommand{\@algocf@capt@plain}{above} % legenda acima
\SetAlgoCaptionSeparator{ --} % separador da legenda
\SetAlCapSty{} % estilo da primeira parte da legenda (remove negrito padrão)
\SetAlCapFnt{\normalsize} % fonte da primeira parte da legenda

\let\l@algocf\l@figure

\let\oldlistofalgorithms\listofalgorithms
\renewcommand{\listofalgorithms}{{%
   \setlength{\cftfigurenumwidth}{6.2em} % espaço onde a palavra "Algoritmo" é escrita
   \renewcommand{\cftfigurepresnum}{Algoritmo } % escrita que precede cada entrada na lista
   \renewcommand{\cftfigureaftersnum}{\hfill--\hfill} % traço na frente da escrita que precede as entradas na lista
   \part*{\listalgorithmcfname}\pagestyle{empty}\@starttoc{loa}\cleardoublepage % titulo com formato padrão de todas as listas
  }}

\RequirePackage{amsthm,thmtools}
\renewcommand{\listtheoremname}{Lista de Teoremas} % traduz nome da lista de teoremas

\declaretheoremstyle[
 spaceabove=6pt, spacebelow=6pt,
 headfont=\normalfont\bfseries,
 notefont=\normalfont\bfseries, notebraces={-- }{},
 bodyfont=\normalfont,
 postheadspace=1em
 % qed=\qedsymbol
]{feistyle}

\declaretheorem[style=feistyle,name=Axioma]{axioma}
\declaretheorem[style=feistyle,name=Teorema]{teorema}
\declaretheorem[style=feistyle,name=Lema]{lema}
\declaretheorem[style=feistyle,name=Hip\'otese]{hipotese}
\declaretheorem[style=feistyle,name=Proposi\c{c}\~ao]{proposicao}
\declaretheorem[style=feistyle,name=Conjectura]{conjectura}
\declaretheorem[style=feistyle,name=Paradoxo]{paradoxo}
\declaretheorem[style=feistyle,name=Corol\'ario]{corolario}
\declaretheorem[style=feistyle,name=Defini\c{c}\~ao]{definicao}
\declaretheorem[style=feistyle,name=Exemplo]{exemplo}
\declaretheorem[style=remark,name=Demonstra\c{c}\~ao,qed=\qedsymbol,numbered=no]{prova}

\usepackage{chngcntr}
\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{algocf}{chapter}
\counterwithout{equation}{chapter}

\renewcommand{\figurename}{\fontsize{10pt}{10pt}\selectfont Figura}
\renewcommand{\tablename}{\fontsize{10pt}{10pt}\selectfont Tabela}

\RequirePackage{enumitem}
\setlist[1]{align=left,leftmargin=2.25cm,labelsep=0.5em,label={\alph*)},ref=\theenumi}
\setlist[2]{align=left,labelwidth=*,labelsep=0.5em,label={--},ref=\theenumii}

\tightlists

\renewenvironment{itemize}{\begin{enumerate}}{\end{enumerate}}

\renewcommand{\floatpagefraction}{.8} % página terá apenas floats se o float ocupar pelo menos 80% da página

\renewcommand{\part}{%
 \@startsection{part}{-1}{0pt}{\baselineskip}{\baselineskip}{\cleardoublepage\fontsize{12pt}{14.4pt}\centering\bfseries\MakeUppercase}}

\renewcommand{\chapter}{\cleardoublepage\pagestyle{plain}%
 \@startsection{chapter}{0}{0pt}{\baselineskip}{\baselineskip}{\fontsize{12pt}{14.4pt}\bfseries\MakeUppercase}}

\renewcommand{\section}{%
 \@startsection{section}{1}{0pt}{\baselineskip}{\baselineskip}{\fontsize{12pt}{14.4pt}\MakeUppercase}}

\renewcommand{\subsection}{%
 \@startsection{subsection}{2}{0pt}{\baselineskip}{\baselineskip}{\fontsize{12pt}{14.4pt}\bfseries}}

\renewcommand{\subsubsection}{%
 \@startsection{subsubsection}{3}{0pt}{\baselineskip}{\baselineskip}{\fontsize{12pt}{14.4pt}\bfseries\itshape}}

\renewcommand{\paragraph}{%
 \@startsection{paragraph}{4}{0pt}{\baselineskip}{\baselineskip}{\fontsize{12pt}{14.4pt}\itshape}}

\setcounter{secnumdepth}{4} % numerar divisões até o quarto nível (paragraph)
\setcounter{tocdepth}{4} % incluir divisões no sumário até o quarto nível (paragraph)

\renewcommand{\cftchapterindent}{0pt}
\renewcommand{\cftsectionindent}{0pt}
\renewcommand{\cftsubsectionindent}{0pt}
\renewcommand{\cftsubsubsectionindent}{0pt}
\renewcommand{\cftparagraphindent}{0pt}

\renewcommand{\cftchapternumwidth}{4em}
\renewcommand{\cftsectionnumwidth}{4em}
\renewcommand{\cftsubsectionnumwidth}{4em}
\renewcommand{\cftsubsubsectionnumwidth}{4em}
\renewcommand{\cftparagraphnumwidth}{4em}

\renewcommand{\cftbeforechapterskip}{0pt} % remove recuo antes de entradas de capítulos no sumário

\renewcommand{\cftchapterfont}{\bfseries} % coloca o titulo de capítulos em negrito
\renewcommand{\cftsubsectionfont}{\bfseries} % coloca o titulo das secoes em negrito
\renewcommand{\cftsubsubsectionfont}{\bfseries\itshape} % coloca o titulo das secoes em negrito
\renewcommand{\cftparagraphfont}{\itshape} % coloca o titulo das secoes em negrito

\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}} % pontos no sumário para partes
\renewcommand{\cftchapterleader}{\cftdotfill{\cftdotsep}} % pontos no sumário para capítulos

\renewcommand{\cftchapterpagefont}{} % o número da página dos capítulos não é em negrito

\setlength{\cftfigurenumwidth}{7.2em} % espaço onde a palavra "Ilustração" é escrita
\setlength{\cfttablenumwidth}{5.7em} % espaço onde a palavra "Tabela" é escrita
\renewcommand{\cftfigurepresnum}{Ilustra\c{c}\~ao } % escrita que precede cada entrada na lista de ilustrações
\renewcommand{\cfttablepresnum}{Tabela } % escrita que precede cada entrada na lista de tabelas
\renewcommand{\cftfigureaftersnum}{\hfill--\hfill} % traço na frente da escrita que precede as entradas na lista de ilustrações
\renewcommand{\cfttableaftersnum}{\hfill--\hfill} % traço na frente da escrita que precede as entradas na lista de tabelas


\renewcommand{\tableofcontents}{\part*{\contentsname}\pagestyle{empty}\@starttoc{toc}\cleardoublepage}
\renewcommand{\listoftables}{\part*{\listtablename}\pagestyle{empty}\@starttoc{lot}\cleardoublepage}
\renewcommand{\listoffigures}{\part*{\listfigurename}\pagestyle{empty}\@starttoc{lof}\cleardoublepage}


\renewcommand{\listoftheorems}{\begingroup%
 \let\oldnumberline\numberline%
 \renewcommand{\numberline}{Teorema~\oldnumberline}%
 \part*{\listtheoremname}\thispagestyle{empty}\@starttoc{loe}\cleardoublepage\endgroup}

\def\and{\\} % modifica função do comando \and para ele ser usado na declaração de múltiplos autores

\renewcommand{\maketitle}{%
 \pagestyle{empty}%
 \begin{center}%
  \MakeUppercase{\@instituicao}\\[0.5em]%
  \uppercase\expandafter{\@author}%
  \vfill%
  \textbf{\MakeUppercase{\@title}}\ifthenelse{\isundefined{\@subtitulo}}{}{: \@subtitulo}%
  \vfill%
  \@cidade\\[0.5em]%
  \number\year%
 \end{center}%
 \cleardoublepage
}

\newenvironment{folhaderosto}{
 \setcounter{page}{1}
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
  \@cidade\\[0.5em]
  \number\year
 \end{center}%
 \clearpage
}

\RequirePackage{pdfpages}
\RequirePackage{ifthen}
\newcommand{\folhadeaprovacao}{
 \ifrascunho
  \thispagestyle{empty}\mbox{}\vfill\begin{center}\begin{Huge}Folha de aprova\c{c}\~{a}o\end{Huge}\vfill\end{center}\cleardoublepage
 \else
  \includepdf{ata.pdf}\cleardoublepage
 \fi
}

\newcommand{\fichacatalografica}{
 \if@twoside
 \else
  % se não for frente e verso, a ficha catalográfica não é contada no verso da folha de rosto
  \addtocounter{page}{-1}
 \fi
 \ifrascunho
  \thispagestyle{empty}\mbox{}\vfill\begin{center}\begin{Huge}Ficha catalogr\'{a}fica\end{Huge}\vfill\end{center}\cleardoublepage
 \else
  \includepdf{ficha.pdf}\cleardoublepage
 \fi
}

\newcommand{\subtitulo}[1]{\def\@subtitulo{#1}}

\newcommand{\smallcaption}[1]{\captionsetup{font=small}\caption*{#1}}

\def\@cidade{S\~ao Bernardo do Campo}
\newcommand{\cidade}[1]{\def\@cidade{#1}}

\def\@instituicao{Centro Universit\'ario FEI}
\newcommand{\instituicao}[1]{\def\@instituicao{#1}}

\newcommand{\advisor}[1]{\def\@advisor{#1}}

\def\@curso{Coisa Nenhuma}
\newcommand{\curso}[1]{\def\@curso{#1}}

\newcommand{\dedicatoria}[1]{
 \cleardoublepage
 \thispagestyle{empty}
 \vspace*{\fill}
 \begin{flushright}
  \begin{minipage}[t][0.5\textheight][c]{0.5\textwidth}
   #1
  \end{minipage}
 \end{flushright}
}

\newcommand{\epigrafe}[2]{
 \cleardoublepage
 \thispagestyle{empty}
 \vspace*{\fill}
 \begin{flushright}
  \begin{minipage}[t][0.5\textheight][c]{0.5\textwidth}
   ``{#1}''
   \begin{flushright}
    #2
   \end{flushright}
  \end{minipage}
 \end{flushright}
}

\newenvironment{resumo}{\part*{Resumo}\pagestyle{empty}}{\cleardoublepage\pagestyle{plain}\setlength{\parindent}{1.25cm}}

\renewenvironment{abstract}{\selectlanguage{english}\part*{Abstract}\pagestyle{empty}\setlength{\parindent}{1.25cm}}{\cleardoublepage\pagestyle{plain}\selectlanguage{brazil}}

\newenvironment{agradecimentos}{\part*{Agradecimentos}\pagestyle{empty}}{\cleardoublepage\pagestyle{plain}}

\RequirePackage{imakeidx}
\renewcommand{\indexname}{\'Indice}
\let\oldmakeindex\makeindex
\let\oldprintindex\printindex
\renewcommand{\makeindex}{\oldmakeindex[title=\noindent\hfill\'INDICE\hfill\mbox{}]}
\renewcommand{\printindex}{\addcontentsline{toc}{chapter}{\hspace{\cftchapternumwidth}\'INDICE}%
 \renewcommand{\chapter}{%
  \@startsection{chapter}{0}{0pt}{0pt}{1.5cm}{\clearpage\fontsize{12pt}{14.4pt}\bfseries\MakeUppercase}}%
 \oldprintindex}%

\RequirePackage[pdftex,pdfborder={0 0 0},colorlinks={false}]{hyperref}

\ifglossaries
 \ifsublist
  \RequirePackage[nomain,nonumberlist]{glossaries}
  % estilo usado como base
  \setglossarystyle{alttree}
  % Configuracao de identacao do nivel 0 (titulos)
  \glssetwidest[0]{}
  % Configuracao de identacao do nivel 1 (a lista de simbolos em si)
  \glssetwidest[1]{aaaaaaaaaaaa}

  % remove número de página das listas de símbolos e abreviaturas (executado na primeira página)
  \renewcommand*{\glossarypreamble}{\thispagestyle{empty}\pagestyle{empty}\vspace*{-2\baselineskip}}

 \else
  \RequirePackage[nomain,nonumberlist,nogroupskip]{glossaries}

  \newglossarystyle{mylong}{%
   \setglossarystyle{long}% base this style on the long style
   \renewenvironment{theglossary}{%
    \begin{longtable*}{lp{\glsdescwidth}}}%
     {\end{longtable*}}%
  }%

  \setglossarystyle{mylong}
  \setlength\LTleft{0pt}
  \setlength\LTright{0pt}
  \setlength\glsdescwidth{\linewidth}

  % remove número de página das listas de símbolos e abreviaturas (executado na primeira página)
  \renewcommand*{\glossarypreamble}{\thispagestyle{empty}\pagestyle{empty}}
 \fi
 % traduz alguns comandos próprios do glossaries
 \addto\captionsbrazil{%
  \renewcommand*{\acronymname}{\noindent\hfill Lista de Abreviaturas \hfill \mbox{}}%
  \renewcommand*{\glssymbolsgroupname}{\noindent\hfill Lista de S\'imbolos \hfill \mbox{}}}

 % redefine comandos do glossaries
 % remove número de página das listas de símbolos e abreviaturas (executado nas demais páginas)
 \renewcommand*{\glsclearpage}{\pagestyle{empty}}
 % remove número de página das listas de símbolos e abreviaturas (executado na última página)
 \renewcommand*{\glossarypostamble}{\pagestyle{empty}\cleardoublepage}
\fi

\addto\captionsbrazil{%
 \renewcommand*{\listfigurename}{Lista de Ilustra\c{c}\~oes}%
 \renewcommand*{\contentsname}{Sum\'ario}}%

\newcommand{\palavraschave}[1]{\mbox{}\\\noindent Palavras-chave: #1}% o resumo pede palavras chave no final
\newcommand{\keywords}[1]{\mbox{}\\\noindent Keywords: #1}% mesma coisa, mas pro abstract

\renewcommand{\appendix}{%
 \renewcommand{\chaptername}{\appendixname}%
 \setcounter{chapter}{0}% zera o contador do capítulo
 \renewcommand{\thechapter}{\Alph{chapter}}% deixa o contador do capítulo em alfabético
 \renewcommand{\chapter}[1]{% redefine o comando do capítulo
  \stepcounter{chapter}% soma 1 ao contador do capítulo
  \cleardoublepage\phantomsection\thispagestyle{empty}\mbox{}\vfill\begin{center}\MakeUppercase{\textbf{AP\^ENDICE \thechapter\ --} ##1}\end{center}\vfill% adiciona uma folha com a letra e título do apêndice
  \addcontentsline{toc}{chapter}{\hspace{\cftchapternumwidth}AP\^ENDICE \Alph{chapter} -- ##1}%
  \newpage%
 }%
}%

\newcommand{\anexos}{%
 \renewcommand{\chaptername}{Anexo}%
 \setcounter{chapter}{0}%
 \renewcommand{\thechapter}{\Alph{chapter}}%
 \renewcommand{\chapter}[1]{%
  \stepcounter{chapter}%
  \cleardoublepage\phantomsection\thispagestyle{empty}\mbox{}\vfill\begin{center}\MakeUppercase{\textbf{ANEXO \thechapter\ --} ##1}\end{center}\vfill%
  \phantomsection%
  \addcontentsline{toc}{chapter}{\hspace{\cftchapternumwidth}ANEXO \Alph{chapter} -- ##1}%
  \newpage%
 }%
}%

\RequirePackage[backend=biber,
                safeinputenc=true,
                uniquelist=false,
                isbn=false,
                doi=false,
                style=abnt]{biblatex}
\setlength{\bibitemsep}{1.0\baselineskip}

\DefineBibliographyStrings{brazil}{%
 bibliography = {REFER\^ENCIAS}
}

\newcommand{\citeonline}[1]{\textcite{#1}}


\defbibheading{bibliography}[\bibname]{%
 \clearpage\phantomsection\addcontentsline{toc}{chapter}{\bfseries\hspace{\cftchapternumwidth}REFER\^ENCIAS}% adiciona o titulo ao sumario
 \part*{REFER\^ENCIAS}
 \urlstyle{same}% URLs nas referências devem ter a mesma fonte do texto
}

\newcommand*{\citefloat}[1]{\citeauthor*{#1}, \citeyear*{#1}}

\renewenvironment{quote}
{\begin{SingleSpace}\list{}{%
   \fontsize{10pt}{1em}%
   \leftmargin=4cm}%
  \item\relax\ignorespaces}
  {\endlist\end{SingleSpace}}

\renewenvironment{quotation}
{\begin{SingleSpace}\list{}{%
   \fontsize{10pt}{1em}%
   \leftmargin=2cm \rightmargin=2cm%
   \listparindent .5cm \itemindent}%
  \item\relax}
  {\endlist\end{SingleSpace}}
%% 
%% Copyright (C) 2017 by Douglas De Rizzo Meneghetti <douglasrizzo@fei.edu.br>
%% 
%% This work may be distributed and/or modified under the
%% conditions of the LaTeX Project Public License (LPPL), either
%% version 1.3c of this license or (at your option) any later
%% version.  The latest version of this license is in the file:
%% 
%% http://www.latex-project.org/lppl.txt
%% 
%% This work is "maintained" (as per LPPL maintenance status) by
%% Douglas De Rizzo Meneghetti.
%% 
%% This work consists of the file  fei.dtx,
%% and the derived files           fei.pdf and
%% fei.cls.
%% 
%%
%% End of file `fei.cls'.
