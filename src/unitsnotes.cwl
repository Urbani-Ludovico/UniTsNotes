
\LoadClass{book}
myclass:language#K
myclass:margins#K
myclass:papersize#K
myclass:side#K
myclass:authors#K
myclass:course#K
myclass:coursetype#K
myclass:department#K
myclass:teachers#K
myclass:teaching#K
myclass:year#K


% ========================================
% Packages
% ========================================

#include:amsmath
#include:amssymb
#include:hyperref
#include:graphicx


% ========================================
% Layout
% ========================================

#include:etoolbox
#include:ifthen


% ========================================
% Theorem environments
% ========================================

#include:tcolorbox

\NewTcb{cmd}#[arg1]{environment}{ref}{label}{style}

\begin{algorithm}#label#code\end{algorithm}
\begin{definition}#label#code\end{definition}
\begin{lemma}#label#code\end{lemma}
\begin{observation}#label#code\end{observation}
\begin{prof}#label#code\end{proof}
\begin{property}#label#code\end{property}
\begin{proposition}#label#code\end{proposition}
\begin{theorem}#label#code\end{theorem}