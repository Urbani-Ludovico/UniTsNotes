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

\DeclareStringOption[a4paper]{papersize}
\DeclareStringOption[oneside]{side}

\ProcessKeyvalOptions*


% ========================================
% Class extension
% ========================================

\PassOptionsToClass{\unitsnotes@side}{book}

\LoadClass{book}


% ========================================
% Page layout
% ========================================

\RequirePackage[
    \unitsnotes@papersize,
    top = 1in,
    right = 0.8in,
    bottom = 1in,
    left = 0.8in
]{geometry}

\setlength{\parindent}{0pt}


% ========================================
% File encode
% ========================================

\RequirePackage[utf8]{inputenc}
\RequirePackage[T1]{fontenc}
\RequirePackage[italian]{babel}