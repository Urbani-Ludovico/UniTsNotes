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

\DeclareStringOption{course}
\DeclareStringOption{coursetype}
\DeclareStringOption{teaching}

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
        \SetString{\bBachelorIn}{Corso di Laurea in}
        \SetString{\bMasterIn}{Laurea Magistrale in}
        \SetString{\bNotes}{Appunti}
        \SetString{\bNotesOf}{Appunti di}
    \EndBabelCommands
    
    \StartBabelCommands*{english}{captions}
        \SetString{\bBachelorIn}{Bachelor in}
        \SetString{\bMasterIn}{Master's Degree in}
        \SetString{\bNotes}{Notes}
        \SetString{\bNotesOf}{Notes of}
    \EndBabelCommands
}


% ========================================
% Layout
% ========================================

\RequirePackage{etoolbox}

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
        % Teaching
        %
        \ifx\unitsnotes@teaching\@empty%
            \ \\[10pt]%
            \textbf{\LARGE \bNotes }
        \else%
            \bNotesOf\\[10pt]%
            \textbf{\LARGE \MakeUppercase{\unitsnotes@teaching}}%
        \fi%
        \\[50pt]%
        %
        % Course
        %
        \ifx\unitsnotes@course\@empty%
            \ \\[10pt]%
            \textbf{\Large \ }
        \else%
            \ifstrequal{\unitsnotes@coursetype}{master}{\bMasterIn}{\bBachelorIn}\\[10pt]%
            \textbf{\Large \unitsnotes@course}%
        \fi%
    \end{center}%
    %
    % Table of Content
    %
    \newpage%
    \restoregeometry%
    \tableofcontents%
}

% ========================================
% Packages
% ========================================

\RequirePackage{amsmath}
\RequirePackage{amssymb}
\RequirePackage{hyperref}
\RequirePackage{graphicx}
