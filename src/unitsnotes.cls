\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unitsnotes}[2026/06/01 Latex class for UniTs notes]

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
\DeclareStringOption{coursetype}
\DeclareStringOption{department}
\DeclareStringOption{teachers}
\DeclareStringOption{teaching}
\DeclareStringOption{year}

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
    \EndBabelCommands
    
    \StartBabelCommands*{english}{captions}
        \SetString{\bAA}{Academic Year}
        \SetString{\bBachelorIn}{Bachelor in}
        \SetString{\bLastEdit}{Last edit}
        \SetString{\bMasterIn}{Master's Degree in}
        \SetString{\bNotes}{Notes}
        \SetString{\bNotesOf}{Notes of}
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

    \renewcommand{\headrulewidth}{0.4pt}%

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
            \ \\[10pt]%
            \textbf{\Large \ }%
        \else%
            \ifstrequal{\unitsnotes@coursetype}{master}{\bMasterIn}{\bBachelorIn}\\[10pt]%
            \textbf{\Large \unitsnotes@course}%
        \fi%
        \\[100pt]%
        %
        % Teaching
        %
        \ifx\unitsnotes@teaching\@empty%
            {\Large \ }\\[15pt]%
            \textbf{\huge \bNotes }\\[40pt]%
            \ %
        \else%
            {\Large \bNotesOf}\\[15pt]%
            \textbf{\huge \MakeUppercase{\unitsnotes@teaching}}\\[40pt]%
            \unitsnotes@teachers%
        \fi%
        \\[120pt]%
        %
        % Authors
        %
        \ifx\unitsnotes@authors\@empty%
            \ %
        \else%
            \unitsnotes@authors%
        \fi%
        \\[100pt]%
        %
        % Dates
        %
        \ifx\unitsnotes@year\@empty%
            \ %
        \else%
            \bAA\ \unitsnotes@year%
        \fi%
        \\[10pt]%
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
