
\LoadClass{book}

myclass:language#K
myclass:margins#K
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

\NewTh{cmd}#[star]{environment}{ref}{label}{color}{style}

env{definition}{arg}{arg}
env{definition-proof}{opt}{arg}
env{theorem}{arg}{arg}
env{theorem-proof}{opt}{arg}