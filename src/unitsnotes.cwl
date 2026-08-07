
\LoadClass{book}

myclass:language#K
myclass:papersize#K
myclass:side#K

myclass:authors#K
myclass:course#K
myclass:courseType#K
myclass:department#K
myclass:teachers#K
myclass:teaching#K
myclass:year#K

myclass:definitionColor#K
myclass:theoremColor#K


% ========================================
% Packages
% ========================================

#include:hyperref
#include:graphicx


% ========================================
% Title page
% ========================================

#include:etoolbox
#include:ifthen


% ========================================
% Math
% ========================================

#include:amsmath
#include:amssymb
#include:dsfont
#include:mathtools
#include:array

\argmax
\argmin


% ========================================
% Theorem environments
% ========================================

#include:footnote
#include:tcolorbox

\NewTh{cmd}#[star]{environment}{ref}{label}{color}{style}

env{definition}{opt}{arg}
env{definition-proof}{arg}
env{theorem}{opt}{arg}
env{theorem-proof}{arg}


% ========================================
% Algorithms
% ========================================

env{algorithm}{opt}{arg}{arg}