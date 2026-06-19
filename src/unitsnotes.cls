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
\DeclareStringOption[oneside]{side}

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
% Page layout
% ========================================

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}

\RequirePackage{geometry}
\geometry{
    \unitsnotes@papersize,
    top = 1in,
    right = 0.8in,
    bottom = 1in,
    left = 0.8in
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
\RequirePackage{hyperref}

\RequirePackage{graphicx}
\graphicspath{ {./unitsnotes.statics/} }


% ========================================
% Layout
% ========================================

\RequirePackage{etoolbox}
\RequirePackage{ifthen}

\def\dep{units.pdf}
\ifthenelse{\equal{\unitsnotes@department}{deams}}{\def\dep{departments/deams.pdf}}{
    \ifthenelse{\equal{\unitsnotes@department}{df}}{\def\dep{departments/df.pdf}}{
        \ifthenelse{\equal{\unitsnotes@department}{dia}}{\def\dep{departments/dia.pdf}}{
            \ifthenelse{\equal{\unitsnotes@department}{mige}}{\def\dep{departments/mige.pdf}}{}
        }
    }
}

\AtBeginDocument{%
    %
    % First page
    %
    \thispagestyle{empty}%
    \newgeometry{
        top = 1.2in,
        bottom = 0.8in
    }%
    \begin{center}%
        \large%
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
        \\[80pt]%
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
            \unitsnotes@teachers
        \fi%
        \\[100pt]%
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
    \end{center}%
    %
    % Table of Content
    %
    \newpage%
    \restoregeometry%
    \tableofcontents%
}
