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
\ProvidesClass{fei}[2022/12/23 4.10.4 Modelo da FEI]

\RequirePackage{kvoptions}
\DeclareStringOption[times]{font}

\DeclareOption{draft}{
  \PassOptionsToClass{\CurrentOption}{memoir}
}
\DeclareOption{final}{
  \PassOptionsToClass{\CurrentOption}{memoir}
}

\newif\ifglossaries
\glossariesfalse
\DeclareOption{symbols}{
  \glossariestrue
  \PassOptionsToPackage{\CurrentOption}{glossaries-extra}
}
\DeclareOption{acronym}{
  \glossariestrue
  \PassOptionsToPackage{\CurrentOption}{glossaries-extra}
}
\DeclareOption{record}{
  \glossariestrue
  \PassOptionsToPackage{\CurrentOption}{glossaries-extra}
}
\DeclareOption{abbr-shortcuts}{
  \glossariestrue
  \PassOptionsToPackage{shortcuts=abbr}{glossaries-extra}
}
\newif\ifsublist
\sublistfalse
\DeclareOption{sublist}{\sublisttrue}
\newif\ifdeposito
\depositofalse
\DeclareOption{deposito}{\depositotrue}

\newif\ifnumeric
\numericfalse
\DeclareOption{numeric}{\numerictrue}

\newif\ifoneside
\DeclareOption{oneside}{\onesidetrue}
\DeclareOption{twoside}{\onesidefalse}

\DeclareOption{backrefs}{%
  \PassOptionsToPackage{backref}{biblatex}%
}

\DeclareOption{algo-as-figure}{\PassOptionsToPackage{figure}{algorithm2e}}%

\newif\ifpdfa
\pdfatrue
\DeclareOption{nopdfa}{\pdfafalse}



\PassOptionsToClass{a4paper,12pt}{memoir}

\ExecuteOptions{oneside}

\ProcessOptions\relax
\ProcessKeyvalOptions*

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\@namedef{fei@font@times}{%
  \RequirePackage{newtxtext}%
}
\@namedef{fei@font@arial}{%
  \RequirePackage[scaled]{uarial}%
  \renewcommand*\familydefault{\sfdefault}%
}

\@namedef{fei@font@arimo}{%
  \RequirePackage[sfdefault]{arimo}
}

\newcommand*{\fei@evaluate}[1]{%
  % Check, if option value in \<prefix>@<option> exists
  \@ifundefined{fei@#1}{%
    % Should not happen
    \PackageError{fei}{Evaluating unknown option `#1'}\@ehc
  }{%
    % Check, if there is an implementation for the value of the option
    % in macro \<prefix>@<option>@<value>
    \@ifundefined{fei@#1@\csname fei@#1\endcsname}{%
      \PackageError{fei}{%
        Unknown option setting: #1=%
        \csname fei@#1\endcsname
      }\@ehc
    }{%
      % Call the implementation for the value
      \csname fei@#1@%
      \csname fei@#1\endcsname
      \endcsname
      \relax
    }%
  }%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\fei@evaluate{font}

\ifoneside
  \LoadClass[oneside]{memoir}
\else
  \LoadClass{memoir}
\fi

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage{microtype}
\RequirePackage[english,brazil]{babel}
\RequirePackage{csquotes}
\RequirePackage{indentfirst}

\renewcommand{\normalsize}{\fontsize{12pt}{14.4pt}\selectfont} % fonte do texto
\renewcommand{\footnotesize}{\fontsize{10pt}{12pt}\selectfont} % fonte das notas de rodapé

\setlrmarginsandblock{30mm}{20mm}{*}
\setulmarginsandblock{30mm}{20mm}{*}
\checkandfixthelayout

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%





\linespread{1.5}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\setlength{\parindent}{1.25cm} % recuo do paragrafo

\makepagestyle{title} % pagina de titulo
\makepagestyle{plain} % estilo padrão
\makeevenhead{plain}{\footnotesize\thepage}{}{}
\makeoddhead{plain}{}{}{\footnotesize\thepage}

\setlength{\headheight}{14.4pt} % remove warning do memoir

\captiondelim{ -- }
\captionstyle{\raggedright}
\hangcaption

\selectlanguage{brazil} % idioma do documento

\widowpenalty=10000
\clubpenalty=10000

\RequirePackage{mathtools} % matematica
\RequirePackage{lmodern} % Latin Modern, fontes tipográficas mais recentes que as do Knuth (Computer Modern)
\RequirePackage{icomma} % vírgula como separador decimal

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

\counterwithout{figure}{chapter}
\counterwithout{table}{chapter}
\counterwithout{algocf}{chapter}
\counterwithout{equation}{chapter}

\renewcommand{\figurename}{\fontsize{10pt}{10pt}\selectfont Figura}
\renewcommand{\tablename}{\fontsize{10pt}{10pt}\selectfont Tabela}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\desenhoname}{Desenho}
\newfloat[chapter]{desenho}{lof}{\desenhoname}
\newlistentry{desenho}{lof}{0}
\counterwithout{desenho}{chapter}
\renewcommand{\cftdesenhoname}{\desenhoname\space}
\renewcommand*{\cftdesenhoaftersnum}{\hfill--\hfill}
\setfloatlocations{desenho}{hbtp} % configurando posicionamento padrão

\newcommand{\esquemaname}{Esquema}
\newfloat[chapter]{esquema}{lof}{\esquemaname}
\newlistentry{esquema}{lof}{0}
\counterwithout{esquema}{chapter}
\renewcommand{\cftesquemaname}{\esquemaname\space}
\renewcommand*{\cftesquemaaftersnum}{\hfill--\hfill}
\setfloatlocations{esquema}{hbtp} % configurando posicionamento padrão

\newcommand{\fotografianame}{Fotografia}
\newfloat[chapter]{fotografia}{lof}{\fotografianame}
\newlistentry{fotografia}{lof}{0}
\counterwithout{fotografia}{chapter}
\renewcommand{\cftfotografianame}{\fotografianame\space}
\renewcommand*{\cftfotografiaaftersnum}{\hfill--\hfill}
\setfloatlocations{fotografia}{hbtp} % configurando posicionamento padrão

\newcommand{\graficoname}{Gráfico}
\newfloat[chapter]{grafico}{lof}{\graficoname}
\newlistentry{grafico}{lof}{0}
\counterwithout{grafico}{chapter}
\renewcommand{\cftgraficoname}{\graficoname\space}
\renewcommand*{\cftgraficoaftersnum}{\hfill--\hfill}
\setfloatlocations{grafico}{hbtp} % configurando posicionamento padrão

\newcommand{\mapaname}{Mapa}
\newfloat[chapter]{mapa}{lof}{\mapaname}
\newlistentry{mapa}{lof}{0}
\counterwithout{mapa}{chapter}
\renewcommand{\cftmapaname}{\mapaname\space}
\renewcommand*{\cftmapaaftersnum}{\hfill--\hfill}
\setfloatlocations{mapa}{hbtp} % configurando posicionamento padrão

\newcommand{\diagramaname}{Diagrama}
\newfloat[chapter]{diagrama}{lof}{\diagramaname}
\newlistentry{diagrama}{lof}{0}
\counterwithout{diagrama}{chapter}
\renewcommand{\cftdiagramaname}{\diagramaname\space}
\renewcommand*{\cftdiagramaaftersnum}{\hfill--\hfill}
\setfloatlocations{diagrama}{hbtp} % configurando posicionamento padrão

\newcommand{\fluxogramaname}{Fluxograma}
\newfloat[chapter]{fluxograma}{lof}{\fluxogramaname}
\newlistentry{fluxograma}{lof}{0}
\counterwithout{fluxograma}{chapter}
\renewcommand{\cftfluxogramaname}{\fluxogramaname\space}
\renewcommand*{\cftfluxogramaaftersnum}{\hfill--\hfill}
\setfloatlocations{fluxograma}{hbtp} % configurando posicionamento padrão

\newcommand{\organogramaname}{Organograma}
\newfloat[chapter]{organograma}{lof}{\organogramaname}
\newlistentry{organograma}{lof}{0}
\counterwithout{organograma}{chapter}
\renewcommand{\cftorganogramaname}{\organogramaname\space}
\renewcommand*{\cftorganogramaaftersnum}{\hfill--\hfill}
\setfloatlocations{organograma}{hbtp} % configurando posicionamento padrão

\newcommand{\plantaname}{Planta}
\newfloat[chapter]{planta}{lof}{\plantaname}
\newlistentry{planta}{lof}{0}
\counterwithout{planta}{chapter}
\renewcommand{\cftplantaname}{\plantaname\space}
\renewcommand*{\cftplantaaftersnum}{\hfill--\hfill}
\setfloatlocations{planta}{hbtp} % configurando posicionamento padrão

\newcommand{\quadroname}{Quadro}
\newfloat[chapter]{quadro}{lof}{\quadroname}
\newlistentry{quadro}{lof}{0}
\counterwithout{quadro}{chapter}
\renewcommand{\cftquadroname}{\quadroname\space}
\renewcommand*{\cftquadroaftersnum}{\hfill--\hfill}
\setfloatlocations{quadro}{hbtp} % configurando posicionamento padrão

\newcommand{\retratoname}{Retrato}
\newfloat[chapter]{retrato}{lof}{\retratoname}
\newlistentry{retrato}{lof}{0}
\counterwithout{retrato}{chapter}
\renewcommand{\cftretratoname}{\retratoname\space}
\renewcommand*{\cftretratoaftersnum}{\hfill--\hfill}
\setfloatlocations{retrato}{hbtp} % configurando posicionamento padrão
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{enumitem}
\setlist[1]{align=left,leftmargin=2.25cm,labelsep=0.5em,label={\alph*)},ref=\theenumi}
\setlist[2]{align=left,labelwidth=*,labelsep=0.5em,label={--},ref=\theenumii}

\tightlists

\renewenvironment{itemize}{\begin{enumerate}}{\end{enumerate}}

\renewcommand{\floatpagefraction}{.8} % página terá apenas floats se o float ocupar pelo menos 80% da página

\renewcommand{\part}{%
  \@startsection{part}{-1}{0pt}{\baselineskip}{\baselineskip}{\cleardoublepage\fontsize{12pt}{14.4pt}\centering\bfseries\MakeUppercase}}

\makechapterstyle{feichapter}{
  \renewcommand*{\afterchapternum}{\quad}
  \renewcommand*{\afterchaptertitle}{\par\nobreak\vskip \afterchapskip}
  \renewcommand*{\chapnamefont}{\chapnumfont}
  \renewcommand*{\chapnumfont}{\normalfont\bfseries}
  \renewcommand*{\chapterheadstart}{\pagestyle{plain}}
  \renewcommand*{\chapternamenum}{}
  \renewcommand*{\chaptitlefont}{\chapnumfont}
  \renewcommand*{\printchaptername}{}
  \renewcommand*{\printchapternonum}{}
  \renewcommand*{\printchapternum}{\chapnumfont \thechapter\space}
  \renewcommand{\printchaptertitle}[1]{\chaptitlefont\MakeUppercase{##1}}
  \setlength{\afterchapskip}{\baselineskip}
  \setlength{\beforechapskip}{0pt}
  \setlength{\midchapskip}{0pt}
}

\chapterstyle{feichapter}

\makechapterstyle{feiappendix}{%
  % en-dash após número
  \renewcommand*{\afterchapternum}{ -- }
  % centraliza texto verticalmente e limpa o resto da página, apenas depois de ter inserido a entrada no TOC
  % https://tex.stackexchange.com/a/321565
  \renewcommand*{\mempostaddchaptertotochook}{\null\vfill\clearpage}
  % "Apêndice  [número]" em negrito
  \renewcommand*{\chapnamefont}{\normalfont\bfseries}
  \renewcommand*{\chapnumfont}{\chapnamefont}
  % inicia a página vazia e adiciona espaço vertical para centralizar o texto
  \renewcommand*{\chapterheadstart}{\thispagestyle{empty}\null\vfill}
  % Fonte normal, texto centralizado horizontalmente
  \renewcommand*{\chaptitlefont}{\normalfont\centering}
  % a palavra "Apêndice" na página de título, em maísculas
  \renewcommand*{\printchaptername}{\chapnamefont\MakeUppercase{\@chapapp}}
  % O título em si, que o usuário digita
  \renewcommand{\printchaptertitle}[1]{\chaptitlefont\MakeUppercase{##1}}
  % some com tudo isso, já que o espaçamento é feito com centering e vfill
  \setlength{\afterchapskip}{0pt}
  \setlength{\beforechapskip}{0pt}
  \setlength{\midchapskip}{0pt}
}

\appto\appendix{%
  % use o estilo criado acima para a página de abertura de um apêndice
  \chapterstyle{feiappendix}%
  % não numera nada abaixo de chapter nos apêndices
  \setsecnumdepth{chapter}%
  % hack do egreg para mudar o que é escrito antes do título do apêndice no sumário
  % https://tex.stackexchange.com/a/34285/30998
  \addtocontents{toc}{\protect\reformchapapp}%
}

\newcommand{\reformchapapp}{%
  % não adiciona nada abaixo de chapter no sumário, depois que começam os apêndices
  \setcounter{tocdepth}{0}%
  % esse é o comando que insere o número do capítulo no sumário, antes do nome do apêndice
  % eu coloco um espaço em branco e escrevo APÊNDICE [NÚMERO] -- "
  % [NÚMERO] é formatado em alfabético automaticamente pelo memoir, na definição deles de \appendix
  \renewcommand{\chapternumberline}[1]{\hspace{\cftchapternumwidth}\MakeUppercase{\appendixname}\ ##1 -- }%
}

\newcommand{\anexos}{%
  \chapterstyle{feiappendix}
  \renewcommand{\cftchaptername}{Anexo\space}
  \renewcommand{\chaptername}{Anexo}%
  \addtocontents{toc}{\protect\setcounter{tocdepth}{0}}
  \setcounter{chapter}{0}
  \renewcommand{\thechapter}{\Alph{chapter}}%
  \renewcommand{\chapter}[1]{%
    \stepcounter{chapter}%
    \cleardoublepage\phantomsection\thispagestyle{empty}\mbox{}\vfill\begin{center}\MakeUppercase{\textbf{ANEXO \thechapter\ --} ##1}\end{center}\vfill%
    \phantomsection%
    \addcontentsline{toc}{chapter}{\hspace{\cftchapternumwidth}ANEXO \Alph{chapter} -- ##1}%
    \newpage%
  }%
}%

\setsecheadstyle{\normalfont\MakeUppercase}
\setsubsecheadstyle{\normalfont\bfseries}
\setsubsubsecheadstyle{\normalfont\bfseries\itshape}
\setparaheadstyle{\normalfont\itshape}

\setaftersecskip{\baselineskip}
\setaftersubsecskip{\baselineskip}
\setaftersubsubsecskip{\baselineskip}
\setafterparaskip{\baselineskip}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setcounter{secnumdepth}{4} % numerar divisões até o quarto nível (paragraph)
\setcounter{tocdepth}{4} % incluir divisões no sumário até o quarto nível (paragraph)

\renewcommand{\cftchapterindent}{0pt}
\renewcommand{\cftsectionindent}{0pt}
\renewcommand{\cftsubsectionindent}{0pt}
\renewcommand{\cftsubsubsectionindent}{0pt}
\renewcommand{\cftparagraphindent}{0pt}

\newlength{\tocnumwidth}
\setlength{\tocnumwidth}{4em}
\renewcommand{\cftchapternumwidth}{\tocnumwidth}
\renewcommand{\cftsectionnumwidth}{\tocnumwidth}
\renewcommand{\cftsubsectionnumwidth}{\tocnumwidth}
\renewcommand{\cftsubsubsectionnumwidth}{\tocnumwidth}
\renewcommand{\cftparagraphnumwidth}{\tocnumwidth}

\renewcommand{\cftbeforechapterskip}{0pt} % remove recuo antes de entradas de capítulos no sumário

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


\settocpreprocessor{chapter}{%
  \let\tempf@rtoc\f@rtoc%
  \def\f@rtoc{%
    \texorpdfstring{\MakeTextUppercase{\tempf@rtoc}}{\tempf@rtoc}}%
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\renewcommand{\cftchapterfont}{\bfseries} % titulo de capítulos em negrito
\renewcommand{\cftsectionfont}{\uppercase} % título das seções em maiúsculo
\renewcommand{\cftsubsectionfont}{\bfseries} % titulo das subseções em negrito
\renewcommand{\cftsubsubsectionfont}{\bfseries\itshape} % titulo das subsubseções em negrito e itálico
\renewcommand{\cftparagraphfont}{\itshape} % titulo das subsubsubseções em itálico

\renewcommand{\cftpartleader}{\cftdotfill{\cftdotsep}} % pontos no sumário para partes
\renewcommand{\cftchapterleader}{\cftdotfill{\cftdotsep}} % pontos no sumário para capítulos

\renewcommand{\cftchapterpagefont}{} % o número da página dos capítulos não é em negrito

\setlength{\cftfigurenumwidth}{5.7em}% espaço onde a palavra "Figura" é escrita
\setlength{\cfttablenumwidth}{5.7em} % espaço onde a palavra "Tabela" é escrita
\renewcommand{\cftfigurepresnum}{Figura\space} % escrita que precede cada "figure" na lista de ilustrações
\renewcommand{\cfttablepresnum}{Tabela\space} % escrita que precede cada entrada na lista de tabelas

\renewcommand{\cftfigureaftersnum}{\hfill--\hfill} % traço na frente da escrita que precede as entradas na lista de ilustrações
\renewcommand{\cfttableaftersnum}{\hfill--\hfill} % traço na frente da escrita que precede as entradas na lista de tabelas


\renewcommand{\tableofcontents}{\part*{\contentsname}\pagestyle{empty}\@starttoc{toc}\cleardoublepage}
\renewcommand{\listoftables}{\part*{\listtablename}\pagestyle{empty}\@starttoc{lot}\cleardoublepage}
\renewcommand{\listoffigures}{\part*{\listfigurename}\pagestyle{empty}\@starttoc{lof}\cleardoublepage}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


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
      \begin{minipage}{\textwidth - 8cm}
        \normalsize
        \begin{SingleSpace}
          }{\end{SingleSpace}\end{minipage}{}
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
  \ifdeposito
    \includepdf{ata.pdf}\cleardoublepage
  \else
    \thispagestyle{empty}\mbox{}\vfill\begin{center}\begin{Huge}Folha de aprova\c{c}\~{a}o\end{Huge}\vfill\end{center}\cleardoublepage
  \fi
}

\newcommand{\fichacatalografica}{
  \if@twoside
  \else
    % se não for frente e verso, a ficha catalográfica não é contada no verso da folha de rosto
    \addtocounter{page}{-1}
  \fi
  \ifdeposito
    \includepdf{ficha.pdf}\cleardoublepage
  \else
    \thispagestyle{empty}\mbox{}\vfill\begin{center}\begin{Huge}Ficha catalogr\'{a}fica\end{Huge}\vfill\end{center}\cleardoublepage
  \fi
}

\newcommand{\subtitulo}[1]{\def\@subtitulo{#1}}

\newcommand{\smallcaption}[1]{{\par\small%
      \begin{flushleft}#1\end{flushleft}}}

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

\newenvironment{epigrafe}{\cleardoublepage\thispagestyle{empty}\vspace*{\fill}}{}

\newcommand{\epig}[2]{
  \vspace{2\baselineskip}
  \begin{flushright}
    \begin{minipage}[t]{0.5\textwidth}
      ``{#1}''
      \begin{flushright}
        #2
      \end{flushright}
    \end{minipage}
  \end{flushright}
}
\newenvironment{resumo}{\part*{Resumo}\pagestyle{empty}}{\cleardoublepage\setlength{\parindent}{1.25cm}}

\renewenvironment{abstract}{\selectlanguage{english}\part*{Abstract}\pagestyle{empty}\setlength{\parindent}{1.25cm}}{\cleardoublepage\selectlanguage{brazil}}

\newenvironment{agradecimentos}{\part*{Agradecimentos}\pagestyle{empty}}{\cleardoublepage}

\RequirePackage[xindy]{imakeidx}
\indexsetup{level=\part*}
\addto\captionsbrazil{%
  \renewcommand{\indexname}{\'Indice}%
}

\let\oldprintindex\printindex
\renewcommand{\printindex}{\clearpage\phantomsection\addcontentsline{toc}{chapter}{\hspace{\cftchapternumwidth}\'INDICE}%
  \renewcommand{\chapter}{%
    \@startsection{chapter}{0}{0pt}{0pt}{1.5cm}{\clearpage\fontsize{12pt}{14.4pt}\bfseries\MakeUppercase}}%
  \oldprintindex%
}%

\ifpdfa
  \RequirePackage[a-1b]{pdfx}
\else
  \RequirePackage{hyperref}
\fi

\hypersetup{%
  pdftex,%
  pdfborder={0 0 0},%
  colorlinks={false},%
  % cria "bookmarks" no PDF até o 4° nível,
  % independente do valor de tocdepth, que eu mudo em alguns lugares
  bookmarksdepth=4%
}

\ifglossaries
  \ifsublist
    \RequirePackage[xindy,nomain,nonumberlist,section=part]{glossaries-extra}
    % estilo usado como base
    \setglossarystyle{alttree}
    % Configuracao de identacao do nivel 0 (titulos)
    \glssetwidest[0]{}
    % Configuracao de identacao do nivel 1 (a lista de simbolos em si)
    \glssetwidest[1]{aaaaaaaaaaaa}

    % remove número de página das listas de símbolos e abreviaturas (executado na primeira página)
    \renewcommand*{\glossarypreamble}{\thispagestyle{empty}\pagestyle{empty}\vspace*{-2\baselineskip}}

  \else
    \RequirePackage[xindy,nomain,nonumberlist,section=part,nogroupskip]{glossaries-extra}

    \newglossarystyle{mylong}{%
      \setglossarystyle{long}% base this style on the long style
      % \renewenvironment{theglossary}{%
      %   \begin{longtable*}{lp{\glsdescwidth}}}%
      %     {\end{longtable*}}%
    }%

    \setglossarystyle{long}
    \setlength\LTleft{0pt}
    \setlength\LTright{0pt}
    \setlength\glsdescwidth{\linewidth}

    % remove número de página das listas de símbolos e abreviaturas (executado na primeira página)
    \renewcommand*{\glossarypreamble}{\thispagestyle{empty}\pagestyle{empty}}
  \fi
  % traduz alguns comandos próprios do glossaries
  \addto\captionsbrazil{%
    \renewcommand*{\acronymname}{Lista de Abreviaturas}%
    \renewcommand*{\glssymbolsgroupname}{Lista de S\'imbolos}%
  }

  % redefine comandos do glossaries
  % remove número de página das listas de símbolos e abreviaturas (executado nas demais páginas)
  \renewcommand*{\glsclearpage}{\pagestyle{empty}}
  % remove número de página das listas de símbolos e abreviaturas (executado na última página)
  \renewcommand*{\glossarypostamble}{\pagestyle{empty}\cleardoublepage}
  % estilo das abreviaturas que permite imprimir a tradução de uma abreviatura em idioma estrangeiro
  \setabbreviationstyle[acronym]{long-short-user}
  % listas de simbolos e abreviaturas nao aparecem no sumario
  \glstocfalse

  % \glscurrentfieldvalue only works with glossaries v4.23 (and above)
  \renewcommand{\glsxtrpostdescacronym}{%
    \ifglshasfield{\glsxtruserfield}{\glscurrententrylabel}%
    { (\glscurrentfieldvalue)}%
    {}%
  }
\fi

\addto\captionsbrazil{%
  \renewcommand*{\listfigurename}{Lista de Ilustra\c{c}\~oes}%
  \renewcommand*{\contentsname}{Sum\'ario}}%

\newcommand{\palavraschave}[1]{\mbox{}\\\noindent Palavras-chave: #1}% o resumo pede palavras chave no final
\newcommand{\keywords}[1]{\mbox{}\\\noindent Keywords: #1}% mesma coisa, mas pro abstract


\ifnumeric
  \RequirePackage[backend=biber,
    safeinputenc=true,
    uniquelist=false,
    doi=true,
    repeatfields=true,
    style=abnt-numeric]{biblatex}
\else
  \RequirePackage[backend=biber,
    safeinputenc=true,
    uniquelist=false,
    doi=true,
    repeatfields=true,
    style=abnt]{biblatex}
\fi

\setlength{\bibitemsep}{1.0\baselineskip}

\DefineBibliographyStrings{brazil}{%
  bibliography = {REFER\^ENCIAS}
}


\DeclareFieldFormat{url}{\bibstring{urlfrom}\addcolon\addspace\url{#1}} %

\let\oldprintbibliography\printbibliography

\renewcommand{\printbibliography}{%
  \linespread{1}
  \oldprintbibliography
  \linespread{1.5}
}

\newcommand{\citeonline}[1]{\textcite{#1}}


\defbibheading{bibliography}[\bibname]{%
  \clearpage\phantomsection\addcontentsline{toc}{chapter}{\bfseries\hspace{\cftchapternumwidth}REFER\^ENCIAS}% adiciona o titulo ao sumario
  \part*{REFER\^ENCIAS}
  \urlstyle{same}% URLs nas referências devem ter a mesma fonte do texto
}

\newcommand*{\citefloat}[1]{\textcite*{#1}}

\renewenvironment{quote}
{\begin{flushright}
    \begin{minipage}{\textwidth - 4cm}
      \fontsize{10pt}{1em}
      \begin{SingleSpace}
        }{\end{SingleSpace}\end{minipage}{}
  \end{flushright}}

\renewenvironment{quotation}
{\begin{center}
    \begin{minipage}{\textwidth - 4cm}
      \fontsize{10pt}{1em}
      \begin{SingleSpace}\setlength{\parindent}{1cm}
        }{\end{SingleSpace}\end{minipage}{}
  \end{center}}
%% 
%% Copyright (C) 2022 by Douglas De Rizzo Meneghetti <douglasrizzo@fei.edu.br>
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
%% End of file `fei.cls'.
