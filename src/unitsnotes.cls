\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unitsnotes}[2026/06/01 Latex class for UniTs notes]

\LoadClass[
	oneside
]{book}


% ========================================
% Page layout
% ========================================

\RequirePackage[
    a4paper,
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