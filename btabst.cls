% 
\ProvidesClass{btabst}[2010/03/19 maeda] 
\LoadClassWithOptions{jsarticle} 
%\LoadClass[a4paper]{jsarticle}
%
%ヘッダ関係の設定
\RequirePackage{fancyhdr,overcite}
\lhead{}
\chead{}
\rhead{}
\cfoot{}
\renewcommand{\headrulewidth}{0pt}

\renewcommand{\figurename}{Fig.~}
\renewcommand{\tablename}{Table~}

\setcounter{secnumdepth}{1}
\def\@seccntformat#1{\csname the#1\endcsname.\quad}

%% \renewcommand{\section}{\@startsection{section}{1}{\z@}%
%%     {\Cvs \@plus.5\Cdp \@minus.2\Cdp}% 前アキ
%%     {-1zw}% 後アキ
%%     {\normalfont\headfont\raggedright}}
  \renewcommand{\section}{%
    \@startsection{section}{1}{\z@}%
    {\Cvs \@plus.0\Cdp \@minus.2\Cdp}% 前アキ
    {.1\Cvs \@plus.1\Cdp}% 後アキ
    {\normalfont\headfont\raggedright}}

\if@titlepage
  \renewcommand{\maketitle}{%
    \begin{titlepage}%
      \let\footnotesize\small
      \let\footnoterule\relax
      \let\footnote\thanks
      \null\vfil
      \vskip 60\p@
      \begin{center}%
        {\Large \sffamily \@title \par}%
        \vskip 3em%
        {\normalsize
          \lineskip .75em
          \begin{tabular}[t]{c}%
            \@author
          \end{tabular}\par}%
        \vskip 1.5em
        %{\large \@date \par}%
      \end{center}\par
      \@thanks\vfil\null
    \end{titlepage}%
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
  }%
\else
  \renewcommand{\maketitle}{\par
    \begingroup
      \renewcommand\thefootnote{\@fnsymbol\c@footnote}%
      \def\@makefnmark{\rlap{\@textsuperscript{\normalfont\@thefnmark}}}%
      \long\def\@makefntext##1{\advance\leftskip 3zw
        \parindent 1zw\noindent
        \llap{\@textsuperscript{\normalfont\@thefnmark}\hskip0.3zw}##1}%
      \if@twocolumn
        \ifnum \col@number=\@ne
          \@maketitle
        \else
          \twocolumn[\@maketitle]%
        \fi
      \else
        \newpage
        \global\@topnum\z@  % Prevents figures from going at top of page.
        \@maketitle
      \fi
      \plainifnotempty
      \@thanks
    \endgroup
    \setcounter{footnote}{0}%
    \global\let\thanks\relax
    \global\let\maketitle\relax
    \global\let\@thanks\@empty
    \global\let\@author\@empty
    \global\let\@date\@empty
    \global\let\@title\@empty
    \global\let\title\relax
    \global\let\author\relax
    \global\let\date\relax
    \global\let\and\relax
  }
  \def\@maketitle{%
    \newpage\null
%    \vskip 0.5em
    \centering
%    \begin{center}%
%      \vskip -2em
      \let\footnote\thanks
      {\LARGE \sffamily \@title \par}%
      \vskip 1.5em
 %   \end{center}%
 %  \begin{center}%
      {\Large
        \lineskip .5em
        \begin{tabular}[t]{c}%
          \Large \@author
        \end{tabular}\par}%
      \vskip 1em
      %{\large \@date}%
%    \end{center}%
    }
\fi

% 余白設定
\setlength\columnsep{2.59zw}

\setlength{\oddsidemargin}{25truemm}
\addtolength{\oddsidemargin}{-1in}

\setlength{\fullwidth}{\paperwidth}
\addtolength{\fullwidth}{-40truemm}
\setlength{\textwidth}{\fullwidth}

\setlength{\headsep}{0truemm}
\setlength{\topmargin}{20truemm}
\addtolength{\topmargin}{-1in}
\addtolength{\topmargin}{-\headheight}
\addtolength{\topmargin}{-\headsep}

\setlength{\textheight}{\paperheight}
\addtolength{\textheight}{-40truemm}
\pagestyle{empty}

\setlength\topskip{0pt}


\renewcommand{\baselinestretch}{0.9}

\renewcommand\citeform[1]{(#1)} 
\renewcommand{\@biblabel}[1]{(#1)} 
