%
% iirthesis.cls
% modified version of jsbook for theses by Y. Maeda
%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{iirthesis}
	[2007/01/26 maeda]
\LoadClassWithOptions{jsbook}
\RequirePackage{graphicx}

% section $B$4$H$K2~%Z!<%8(B
\let\orgsection\section
\def\section{\clearpage\orgsection}
% $B?^I=HV9f$NI=5-(B
\renewcommand{\figurename}{Fig.~}
\renewcommand{\tablename}{Table~}
\renewcommand{\bibname}{}

% $BCJMn4V%9%Z!<%9(B
%\setlength{\parskip}{2truemm}

% $B%F%-%9%HNN0h$N@_Dj(B
\setlength{\oddsidemargin}{-0.9truein} 
\setlength{\evensidemargin}{-1.1truein} 
\addtolength{\oddsidemargin}{25truemm} 
\addtolength{\evensidemargin}{25truemm} 
\setlength{\textwidth}{\paperwidth} 
\addtolength{\textwidth}{-50truemm}% $B:8M>Gr!_(B2 $B$r0z$/(B 
\setlength{\footskip}{10truemm}

% $BO@J8%?%$%W(B
\def\thesistype#1{\gdef\@thesistype{#1}}
\def\@thesistype{\relax}

% $B1QJ8%?%$%H%k(B
\def\etitle#1{\gdef\@etitle{#1}}
\def\@etitle{\relax}

% $B1QJ8Cx<T(B
\def\eauthor#1{\gdef\@eauthor{#1}}
\def\@eauthor{\relax}

% $B1QJ8Cx<T(B
\def\miscinfo#1{\gdef\@miscinfo{#1}}
\def\@miscinfo{\relax}

% $B%?%$%H%k%Z!<%8$NDj5A(B
\if@titlepage
  \renewcommand{\maketitle}{%
    \begin{titlepage}%
	\begin{center}
    \setlength{\unitlength}{1truemm}
    \begin{picture}(0,0)
%    \begin{picture}(440,0)
	%\put(0,0){\framebox(430, 600){}}
	\put(-74,-207){\framebox(168, 242){}}
	\thicklines
	%\put(0,0){\framebox(440, 610){}}
	\put(-77,-210){\framebox(174, 248){}}
    \end{picture}
%	{\utokyo T} \\
	 {\includegraphics[width=0.12\columnwidth,clip]{ynu.eps}}\\
	\vskip 2em
	{\LARGE \@thesistype}
	\end{center}
      \let\footnotesize\small
      \let\footnoterule\relax
      \let\footnote\thanks
      \null\vfil
      \vskip 30\p@
      \begin{center}%
        {\LARGE \sffamily{\@title} \par}%
	\vskip 1em
        {\LARGE \textbf{\@etitle} \par}%
        \vskip 12em%
        {%\Large
          \lineskip .75em
          \begin{tabular}[t]{c}%
  	    \@miscinfo\\
	    \\
            {\LARGE {\@author}}\\[4pt]
	    {\Large {\@eauthor}}
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
    \global\let\@eauthor\@empty
    \global\let\@miscinfo\@empty
    \global\let\@date\@empty
    \global\let\@thesistype\@empty
    \global\let\@title\@empty
    \global\let\@etitle\@empty
    \global\let\thesistype\relax
    \global\let\title\relax
    \global\let\etitle\relax
    \global\let\author\relax
    \global\let\eauthor\relax
    \global\let\miscinfo\relax
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
    \global\let\@eauthor\@empty
    \global\let\@miscinfo\@empty
    \global\let\@date\@empty
    \global\let\@thesistype\@empty
    \global\let\@title\@empty
    \global\let\@etitle\@empty
    \global\let\thesistype\relax
    \global\let\title\relax
    \global\let\etitle\relax
    \global\let\author\relax
    \global\let\eauthor\relax
    \global\let\miscinfo\relax
    \global\let\date\relax
    \global\let\and\relax
  }
  \def\@maketitle{%
    \newpage\null
    \vskip 2em
    \begin{center}%
      \let\footnote\thanks
      {\LARGE \@title \par}%
      \vskip 1em
      {\LARGE \@etitle \par}%
      \vskip 1.5em
      {%\large
        \lineskip .5em
        \begin{tabular}[t]{c}%
          \@miscinfo \\
          {LARGE \@author} \\
          {\Large \@eauthor}
        \end{tabular}\par}%
      \vskip 1em
      %{\large \@date}%
    \end{center}%
    \par\vskip 1.5em}
\fi

% $B>OHb$G$O%Z!<%8HV9f$r=P$5$J$$(B
\renewcommand{\chapter}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \global\@topnum\z@
  \secdef\@chapter\@schapter
}

% thebibliography $B$r(B section $B07$$$K$9$k(B
\renewenvironment{thebibliography}[1]{%
  \global\let\@secapp\relax
  \orgsection*{\bibname\@mkboth{\bibname}{\bibname}}%
   \list{\@biblabel{\@arabic\c@enumiv}}%
%        {\settowidth\labelwidth{\@biblabel{#1}}%
        {\settowidth\labelwidth{}%
         \leftmargin\labelwidth
         \advance\leftmargin\labelsep
         \@openbib@code
         \usecounter{enumiv}%
         \let\p@enumiv\@empty
         \renewcommand\theenumiv{\@arabic\c@enumiv}}%
   \sloppy
   \clubpenalty4000
   \@clubpenalty\clubpenalty
   \widowpenalty4000%
   \sfcode`\.\@m}
  {\def\@noitemerr
    {\@latex@warning{Empty `thebibliography' environment}}%
   \endlist}

% abovecaptionskip $B$r$U$D$&$K(B
%\setlength\abovecaptionskip{10\p@}

% float $B4V$N4V3V$r9-$a$K(B
\setlength\floatsep    {24\p@ \@plus 4\p@ \@minus 4\p@}
% $BK\J8$H(B float $B$N4V3V$r9-$a$K(B
\setlength\textfloatsep{40\p@ \@plus 4\p@ \@minus 8\p@}
%\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}

% \caption $B$NJ8;z$r(B \normalsize $B$K(B
\long\def\@makecaption#1#2{{\normalsize
  \advance\leftskip0.07\columnwidth
  \advance\rightskip0.07\columnwidth
  \vskip\abovecaptionskip
  \sbox\@tempboxa{#1: #2}%
  \ifdim \wd\@tempboxa >\hsize
    #1: #2\par
  \else
    \global \@minipagefalse
    \hb@xt@\hsize{\hfil\box\@tempboxa\hfil}%
  \fi
  \vskip\belowcaptionskip}}

% Appendix $B$NJQ99(B
\renewcommand{\appendix}{\par
  \setcounter{chapter}{1}% \backmatter $BCf$KIUO?$rF~$l$k$?$a(B
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\@chappos{}%
  \gdef\thechapter{\@Alph\c@chapter}}

\RequirePackage[loose]{minitoc}
\renewcommand{\mtctitle}{} % minitoc $B$N%?%$%H%k$r$J$7$K$9$k(B
\setlength{\mtcindent}{6pt} % minitoc $B$N%$%s%G%s%H$r>.$5$a$K(B
\renewcommand{\mtcSfont}{\normalsize\rm} % minitoc $B$N(B section $BMQ%U%)%s%H(B
\renewcommand{\mtcSSfont}{\small\rm} % minitoc $B$N(B subsection $BMQ%U%)%s%H(B
\renewcommand{\appendixname}{$BIUO?(B} 
