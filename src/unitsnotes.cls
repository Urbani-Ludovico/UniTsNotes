\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unitsnotes}[2026/06/01 Latex class for UniTs notes]


% ========================================
% Constants
% ========================================

\RequirePackage{xcolor}

\definecolor{thc-black}{HTML}{222222}
\definecolor{thc-blue}{HTML}{0000DD}
\definecolor{thc-brown}{HTML}{804000}
\definecolor{thc-cyan}{HTML}{009999}
\definecolor{thc-gray}{HTML}{606060}
\definecolor{thc-green}{HTML}{00AA00}
\definecolor{thc-magenta}{HTML}{C000C0}
\definecolor{thc-orange}{HTML}{EE7000}
\definecolor{thc-red}{HTML}{DD0000}
\definecolor{thc-violet}{HTML}{800080}


% ========================================
% Options
% ========================================

\RequirePackage{kvoptions}

\SetupKeyvalOptions{
    family=unitsnotes,
    prefix=unitsnotes@
}

\DeclareStringOption[english]{language}
\DeclareStringOption[a4paper]{papersize}
\DeclareStringOption[twoside]{side}

\DeclareStringOption{authors}
\DeclareStringOption{course}
\DeclareStringOption{courseType}
\DeclareStringOption{department}
\DeclareStringOption{teachers}
\DeclareStringOption{teaching}
\DeclareStringOption{year}

\DeclareStringOption[thc-blue]{definitionColor}
\DeclareStringOption[thc-red]{theoremColor}

\ProcessKeyvalOptions*


% ========================================
% Class extension
% ========================================

\PassOptionsToClass{\unitsnotes@side}{book}

\LoadClass[10pt]{book}


% ========================================
% Page settings
% ========================================

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage{geometry}
\geometry{
    \unitsnotes@papersize,
    hmargin = 0.8in,
    top = 1in,
    bottom = 0.8in,
    bindingoffset = 0pt
}

\setlength{\parindent}{0pt}

\RequirePackage{fontspec}
\setmainfont{Latin Modern Roman}


% ========================================
% Babel
% ========================================

\RequirePackage[\unitsnotes@language]{babel}

\AddToHook{package/babel/after}{
    \StartBabelCommands*{italian}{captions}
        \SetString{\bAA}{Anno accademico}
        \SetString{\bLastEdit}{Aggiornato il}
        \SetString{\bBachelorIn}{Corso di Laurea in}
        \SetString{\bMasterIn}{Laurea Magistrale in}
        \SetString{\bNotes}{Appunti}
        \SetString{\bNotesOf}{Appunti di}

        \SetString{\bDefinition}{Definizione}
        \SetString{\bLemma}{Lemma}
        \SetString{\bProof}{Dimostrazione}
        \SetString{\bTheorem}{Teorema}
    \EndBabelCommands
    
    \StartBabelCommands*{english}{captions}
        \SetString{\bAA}{Academic Year}
        \SetString{\bBachelorIn}{Bachelor in}
        \SetString{\bLastEdit}{Last edit}
        \SetString{\bMasterIn}{Master's Degree in}
        \SetString{\bNotes}{Notes}
        \SetString{\bNotesOf}{Notes of}

        \SetString{\bDefinition}{Definition}
        \SetString{\bLemma}{Lemma}
        \SetString{\bProof}{Proof}
        \SetString{\bTheorem}{Theorem}
    \EndBabelCommands
}


% ========================================
% Other Packages
% ========================================

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{graphicx}
\RequirePackage{hyperref}


% ========================================
% Fancy style
% ========================================

\RequirePackage{fancyhdr}

\fancypagestyle{style}{%
    \fancyhf{}%

    % Even pages
    \fancyhead[LE]{\thepage}%
    \fancyhead[RE]{\nouppercase{\leftmark}}%

    % Odd pages
    \fancyhead[LO]{\nouppercase{\leftmark}}%
    \fancyhead[RO]{\thepage}%

    % Header
    \renewcommand{\headrulewidth}{0.4pt}%

    % Footer
    \fancyfoot{}%
    \renewcommand{\footrulewidth}{0pt}%
}

% Chapter page
\fancypagestyle{plain}{%
    \fancyhf{}%

    % Even pages
    \fancyhead[LE]{\thepage}%

    % Odd pages
    \fancyhead[RO]{\thepage}%

    \renewcommand{\headrulewidth}{0pt}%

    \fancyfoot{}%
    \renewcommand{\footrulewidth}{0pt}%
}

\raggedbottom


% ========================================
% Title pages
% ========================================

\RequirePackage{etoolbox}
\RequirePackage{ifthen}

\def\dep{./unitsnotes.statics/units.pdf}
\ifthenelse{\equal{\unitsnotes@department}{deams}}{\def\dep{./unitsnotes.statics/departments/deams.pdf}}{
    \ifthenelse{\equal{\unitsnotes@department}{df}}{\def\dep{./unitsnotes.statics/departments/df.pdf}}{
        \ifthenelse{\equal{\unitsnotes@department}{dia}}{\def\dep{./unitsnotes.statics/departments/dia.pdf}}{
            \ifthenelse{\equal{\unitsnotes@department}{mige}}{\def\dep{./unitsnotes.statics/departments/mige.pdf}}{}
        }
    }
}

\AtBeginDocument{%
    \frontmatter%
    \pagestyle{empty}%
    %
    % Title page
    %
    \begin{titlepage}%
        \centering\large%
        %
        % Logo
        %
        \includegraphics[height=1in,width=\textwidth,keepaspectratio]{\dep}\\[50pt]%
        %
        % Course
        %
        \ifx\unitsnotes@course\@empty%
        \else%
            \ifstrequal{\unitsnotes@courseType}{master}{\bMasterIn}{\bBachelorIn}\\[10pt]%
            \textbf{\Large \unitsnotes@course}%
        \fi%
        \vfill%
        %
        % Teaching
        %
        \ifx\unitsnotes@teaching\@empty%
            \textbf{\huge \bNotes }%
        \else%
            {\Large \bNotesOf}\\[15pt]%
            \textbf{\huge \MakeUppercase{\unitsnotes@teaching}}\\[40pt]%
            \unitsnotes@teachers%
        \fi%
        \vfill%
        %
        % Authors
        %
        \ifx\unitsnotes@authors\@empty%
        \else%
            \unitsnotes@authors%
        \fi%
        \vfill%
        %
        % Dates
        %
        \ifx\unitsnotes@year\@empty%
        \else%
            \bAA\ \unitsnotes@year\\[10pt]%
        \fi%
        \bLastEdit\ \today%
    \end{titlepage}%
    \cleardoublepage%
    %
    % Table of Content
    %
    \setcounter{page}{1}%
    \tableofcontents%
    \cleardoublepage%
    %
    % Content
    %
    \mainmatter%
    \pagestyle{style}%
}


% ========================================
% Theorem environments
% ========================================

\RequirePackage[many]{tcolorbox}
\tcbuselibrary{theorems, breakable}

\tcbset{
    style/.style={
        width=\textwidth,
        top=8pt,
        bottom=8pt,
        left=5pt,
        right=5pt,
        toptitle=2pt,
        bottomtitle=2pt,
        lefttitle=5pt,
        righttitle=5pt,
        colframe=blue!80!white,
        coltitle=white,
        fonttitle=\bfseries,
        colback=white,
        coltext=black,
        sharp corners,
        rounded corners=downhill,
        arc=5pt,
        boxrule=1pt,
        breakable,
        enhanced jigsaw,
        pad at break*=0mm,
        break at=0pt,
        before skip=20pt,
        after skip=20pt
    }
}

% environment, ref, label, color, style
\NewDocumentCommand{\NewTh}{s m m m m m}{%
    \IfBooleanTF{#1}{%
        % Starred version
        \newtcbtheorem[no counter]{#2}{#4}{%
            style,%
            colframe=#5,%
            #6%
        }{#3}%
    }{%
        % Normal version
        \newtcbtheorem[auto counter, number within=chapter]{#2}{#4}{%
            style,%
            colframe=#5,%
            #6%
        }{#3}%
    }%

    \expandafter\def\csname tcb@cnt@#2autorefname\endcsname{#4}

    \newtcbtheorem[no counter]{tbc-#2-proof}{\bProof}{%
        style,%
        colframe=white,%
        boxrule=0pt,%
        overlay={%
            \draw[#5, line width=1pt] ([xshift=0.5pt]frame.north west) -- ([xshift=0.5pt]frame.south west);%
            \node[anchor=east, yshift=5pt] at (frame.south east) {$\square$};%
        },%
        sharp corners,%
        coltitle=black,%
        colbacktitle=white,%
        #6%
    }{#4-proof}%

    \newenvironment{#2-proof}[2][proof]{\begin{tbc-#2-proof}{\autoref{#3:##2}}{##1}}{\end{tbc-#2-proof}}
}

\NewTh{definition}{def}{\bDefinition}{\unitsnotes@definitionColor}{}
\NewTh{theorem}{th}{\bTheorem}{\unitsnotes@theoremColor}{}