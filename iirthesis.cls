%
% iirthesis.cls
% modified version of jsbook for theses by Y. Maeda
%
\NeedsTeXFormat{pLaTeX2e}
\ProvidesClass{iirthesis}
	[2007/01/26 maeda]
\LoadClassWithOptions{jsbook}
\RequirePackage{graphicx}

% section ごとに改ページ
\let\orgsection\section
\def\section{\clearpage\orgsection}
% 図表番号の表記
\renewcommand{\figurename}{Fig.~}
\renewcommand{\tablename}{Table~}
\renewcommand{\bibname}{}

% 段落間スペース
%\setlength{\parskip}{2truemm}

% テキスト領域の設定
\setlength{\oddsidemargin}{-0.9truein} 
\setlength{\evensidemargin}{-1.1truein} 
\addtolength{\oddsidemargin}{25truemm} 
\addtolength{\evensidemargin}{25truemm} 
\setlength{\textwidth}{\paperwidth} 
\addtolength{\textwidth}{-50truemm}% 左余白×2 を引く 
\setlength{\footskip}{10truemm}

% 論文タイプ
\def\thesistype#1{\gdef\@thesistype{#1}}
\def\@thesistype{\relax}

% 英文タイトル
\def\etitle#1{\gdef\@etitle{#1}}
\def\@etitle{\relax}

% 英文著者
\def\eauthor#1{\gdef\@eauthor{#1}}
\def\@eauthor{\relax}

% 英文著者
\def\miscinfo#1{\gdef\@miscinfo{#1}}
\def\@miscinfo{\relax}

% タイトルページの定義
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

% 章扉ではページ番号を出さない
\renewcommand{\chapter}{%
  \if@openright\cleardoublepage\else\clearpage\fi
  \thispagestyle{empty}
  \global\@topnum\z@
  \secdef\@chapter\@schapter
}

% thebibliography を section 扱いにする
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

% abovecaptionskip をふつうに
%\setlength\abovecaptionskip{10\p@}

% float 間の間隔を広めに
\setlength\floatsep    {24\p@ \@plus 4\p@ \@minus 4\p@}
% 本文と float の間隔を広めに
\setlength\textfloatsep{40\p@ \@plus 4\p@ \@minus 8\p@}
%\setlength\intextsep   {12\p@ \@plus 2\p@ \@minus 2\p@}

% \caption の文字を \normalsize に
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

% Appendix の変更
\renewcommand{\appendix}{\par
  \setcounter{chapter}{1}% \backmatter 中に付録を入れるため
  \setcounter{section}{0}%
  \gdef\@chapapp{\appendixname}%
  \gdef\@chappos{}%
  \gdef\thechapter{\@Alph\c@chapter}}

\RequirePackage[loose]{minitoc}
\renewcommand{\mtctitle}{} % minitoc のタイトルをなしにする
\setlength{\mtcindent}{6pt} % minitoc のインデントを小さめに
\renewcommand{\mtcSfont}{\normalsize\rm} % minitoc の section 用フォント
\renewcommand{\mtcSSfont}{\small\rm} % minitoc の subsection 用フォント
\renewcommand{\appendixname}{付録} 

