
% unicamthesis.cls
\NeedsTeXFormat{LaTeX2e}[2015/01/01]
\ProvidesClass{unicamthesis}[2025/06/01 UNICAM Final PhD Thesis Style Class]

% Base class and page size similar to LIPIcs
\LoadClass[12pt, a4paper, twoside]{book}
\usepackage[top=2.5cm, bottom=2.5cm, left=3.5cm, right=2.5cm]{geometry}

% Essential packages
\usepackage{graphicx, xcolor, amsmath, amssymb, fancyhdr, titlesec, titling}
\usepackage{tocloft, float, algorithm, algorithmicx, caption, listings, hyperref}
\usepackage{etoolbox, lipsum, amsthm}
\usepackage{microtype} % Better typography

% Fonts - matching LIPIcs exactly
% Use Latin Modern (lmodern) if available; otherwise fall back to Computer Modern.
% Always use T1 encoding for proper hyphenation and glyph coverage.
\usepackage[T1]{fontenc}
\usepackage{textcomp}
\IfFileExists{lmodern.sty}{%
  \RequirePackage{lmodern}%
}{%
  % Falls back to Computer Modern if lmodern is not available
}

% Font sizes matching LIPIcs exactly
\renewcommand\normalsize{%
   \@setfontsize\normalsize\@xpt{13}%
   \abovedisplayskip 10\p@ \@plus2\p@ \@minus5\p@
   \abovedisplayshortskip \z@ \@plus3\p@
   \belowdisplayshortskip 6\p@ \@plus3\p@ \@minus3\p@
   \belowdisplayskip \abovedisplayskip
   \let\@listi\@listI}

\normalsize

\renewcommand\small{%
   \@setfontsize\small\@ixpt{11.5}%
   \abovedisplayskip 8.5\p@ \@plus3\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus2\p@
   \belowdisplayshortskip 4\p@ \@plus2\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 4\p@ \@plus2\p@ \@minus2\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\renewcommand\footnotesize{%
   \@setfontsize\footnotesize{8.5}{9.5}%
   \abovedisplayskip 6\p@ \@plus2\p@ \@minus4\p@
   \abovedisplayshortskip \z@ \@plus\p@
   \belowdisplayshortskip 3\p@ \@plus\p@ \@minus2\p@
   \def\@listi{\leftmargin\leftmargini
               \topsep 3\p@ \@plus\p@ \@minus\p@
               \parsep 2\p@ \@plus\p@ \@minus\p@
               \itemsep \parsep}%
   \belowdisplayskip \abovedisplayskip
}

\renewcommand\large{\@setfontsize\large{10.5}{13}}
\renewcommand\Large{\@setfontsize\Large{12}{14}}
\renewcommand\LARGE{\@setfontsize\LARGE{14}{17}}
\renewcommand\huge{\@setfontsize\huge{16}{19}}
\renewcommand\Huge{\@setfontsize\Huge{20}{24}}

% Better paragraph indentation and spacing
\setlength\parindent{1.5em}
\setlength{\skip\footins}{2\baselineskip \@plus 4\p@ \@minus 2\p@}

% Improved list spacing
\def\@listi{\leftmargin\leftmargini
            \parsep\z@ \@plus\p@
            \topsep 8\p@ \@plus2\p@ \@minus4\p@
            \itemsep \parsep}

\let\@listI\@listi
\@listi

\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    4\p@ \@plus2\p@ \@minus\p@
              \parsep\z@ \@plus\p@
              \itemsep   \parsep}

\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    2\p@ \@plus\p@\@minus\p@
              \parsep    \z@
              \partopsep \p@ \@plus\z@ \@minus\p@
              \itemsep   \z@ \@plus\p@}

% Custom Environments - improved theorem styling
% Theorem head font inspired by LIPIcs
\thm@headfont{%
  \textcolor{black}{$\blacktriangleright$}\nobreakspace\sffamily\bfseries}

\def\th@remark{%
  \thm@headfont{%
    \textcolor{black}{$\blacktriangleright$}\nobreakspace\sffamily}%
  \normalfont % body font
  \thm@preskip\topsep \divide\thm@preskip\tw@
  \thm@postskip\thm@preskip
}

\theoremstyle{plain}
\newtheorem{theorem}{Theorem}[chapter]
\newtheorem{lemma}[theorem]{Lemma}
\newtheorem{corollary}[theorem]{Corollary}
\newtheorem{proposition}[theorem]{Proposition}
\newtheorem{definition}[theorem]{Definition}
\newtheorem{conjecture}[theorem]{Conjecture}
\newtheorem{observation}[theorem]{Observation}

\theoremstyle{definition}
\newtheorem{example}[theorem]{Example}

\theoremstyle{remark}
\newtheorem{note}[theorem]{Note}
\newtheorem*{note*}{Note}
\newtheorem{remark}[theorem]{Remark}
\newtheorem*{remark*}{Remark}

% Improved proof environment
\renewcommand\qedsymbol{\textcolor{black}{\ensuremath{\blacktriangleleft}}}

\renewenvironment{proof}[1][\proofname]{\par
  \pushQED{\qed}%
  \normalfont \topsep6\p@\@plus6\p@\relax
  \trivlist
  \item[\hskip\labelsep
        \color{black}\sffamily\bfseries
    #1\@addpunct{.}]\ignorespaces
}{%
  \popQED\endtrivlist
}

% Logos
\newcommand{\universitylogo}{logos/unicamlogo.jpg}
\newcommand{\youruniversity}{logos/youruniv.png}

% Title Page Variables
\newcommand{\universityname}{UNIVERSIT\`A DEGLI STUDI DI CAMERINO}
\newcommand{\schoolname}{SCHOOL OF ADVANCED STUDIES}
\newcommand{\doctoralcourse}{DOCTOR OF PHILOSOPHY IN }
\newcommand{\curriculum}{CURRICULUM }
\newcommand{\cycle}{CYCLE }

% Title Page
\renewcommand{\maketitle}{%
  \begin{titlepage}
    \begin{center}
      \begin{minipage}{0.45\textwidth}
        \raggedright
        \includegraphics[width=0.9\linewidth]{\universitylogo}
      \end{minipage}
      \hfill
      \begin{minipage}{0.45\textwidth}
        \raggedleft
        \includegraphics[width=0.9\linewidth]{\youruniversity}
      \end{minipage}
    \end{center}
    \vspace{2em}
    \begin{center}
      {\Large\textbf{\universityname}}\\[0.5em]
      {\large \schoolname}\\[3em]

      {\normalsize \doctoralcourse: }\\[0.5em]
	  {\Large \textbf{\@cournamec}} \\[2em]
      {\normalsize \curriculum: }\\[0.5em]
	  {\Large \textbf{\@curriculum}} \\[2em]
      {\normalsize \cycle \textbf{~\@cycle}}\\[3em]

      {\LARGE\bfseries \@title}\\[6em]

      \begin{minipage}{0.45\textwidth}
        \raggedright
        {\normalsize PhD Candidate:}\\
        \@author
      \end{minipage}
      \hfill
      \begin{minipage}{0.45\textwidth}
        \raggedleft
        {\normalsize Supervisor:}\\
        \@supervisor\\[1.5em]
        {\normalsize Co-supervisor:}\\
        \@cosupervisor
      \end{minipage}\\[4em]

      {\normalsize Coordinator of the PhD Programme:}\\
      \@coordinator\\[2em]
      \textit{Date of award:} \\ \@dateaward
    \end{center}
  \end{titlepage}
}
% Colophon Command
\newcommand{\printcolophon}[1][]{
  \thispagestyle{empty}
  \hphantom{.}
  \vfill

  \section*{Imprint}
  Copyright \textcopyright{} \the\year{} by \theauthor{}.\\
  All rights reserved. Printed in Italy.\\
  Published by the University of Camerino, Camerino, Italy.

  \section*{Colophon}
  \ifx&#1&%
    The doctoral research was funded under the framework of the Italian National Recovery and Resilience Plan (PNRR),
    Mission 4 “Education and Research” – Component 2 “From Research to Business” – Investment 3.3:
    Introduction of innovative doctorates that meet the innovation needs of enterprises – funded by the European Union – NextGenerationEU.
  \else
    #1
  \fi
}

% Custom fields
\newcommand{\@cournamec}{}
\newcommand{\coursename}[1]{\renewcommand{\@cournamec}{#1}}

\newcommand{\@curriculum}{}
\newcommand{\curriculumname}[1]{\renewcommand{\@curriculum}{#1}}

\newcommand{\@cycle}{}
\newcommand{\cyclenumber}[1]{\renewcommand{\@cycle}{#1}}

\newcommand{\@supervisor}{}
\newcommand{\supervisorname}[1]{\renewcommand{\@supervisor}{#1}}

\newcommand{\@cosupervisor}{}
\newcommand{\cosupervisorname}[1]{\renewcommand{\@cosupervisor}{#1}}

\newcommand{\@coordinator}{}
\newcommand{\coordinatorname}[1]{\renewcommand{\@coordinator}{#1}}

\newcommand{\@dateaward}{}
\newcommand{\dateofaward}[1]{\renewcommand{\@dateaward}{#1}}

% Declaration - improved formatting
\newenvironment{declaration}{
  \cleardoublepage\thispagestyle{empty}
  \vskip0.7\bigskipamount
  \noindent
  \rlap{\color{black}\vrule\@width\textwidth\@height1\p@}%
  \hspace*{7mm}\fboxsep1.5mm\colorbox[rgb]{1,1,1}{\raisebox{-0.4ex}{%
    \large\selectfont\sffamily\bfseries DECLARATION}}%
  \vskip3\p@
  \fontsize{11}{13.5}\selectfont
  \noindent\ignorespaces
}{
  \vspace{2em}
  \begin{flushright}
    \sffamily\bfseries\@author \\
    \@dateaward
  \end{flushright}
  \vfill
  \footnotesize
  \noindent * This dissertation is presented in partial fulfillment of the requirements for \\
  \textbf{Ph.D. degree} in the School of Advanced Studies of University of Camerino.
}

% Abstract - improved formatting
\newenvironment{abstract}{
  \cleardoublepage\thispagestyle{plain}
  \vskip0.7\bigskipamount
  \noindent
  \rlap{\color{black}\vrule\@width\textwidth\@height1\p@}%
  \hspace*{7mm}\fboxsep1.5mm\colorbox[rgb]{1,1,1}{\raisebox{-0.4ex}{%
    \large\selectfont\sffamily\bfseries Abstract}}%
  \vskip3\p@
  \fontsize{11}{13.5}\selectfont
  \noindent\ignorespaces
  \addcontentsline{toc}{chapter}{Abstract}
}{
  \vspace{2em}
}

% TOC, LOF, LOT
\renewcommand{\cfttoctitlefont}{\normalfont\Large\bfseries}
\renewcommand{\cftlottitlefont}{\normalfont\Large\bfseries}
\renewcommand{\cftloftitlefont}{\normalfont\Large\bfseries}
\renewcommand{\cftchapfont}{\sffamily\bfseries}

% Part styling
\titleformat{\part}[display]
  {\normalfont\centering\sffamily\bfseries\Huge}
  {\partname~\thepart}
  {0.5em}
  {}

% Chapter styling - inspired by LIPIcs
\titleformat{\chapter}[display]
  {\normalfont\sffamily\huge\bfseries\raggedright}
  {\chaptername~\thechapter}
  {1em}
  {}

% Section styling - inspired by LIPIcs
\renewcommand\section{\@startsection {section}{1}{\z@}%
                                   {-3.5ex \@plus -1ex \@minus -.2ex}%
                                   {2.3ex \@plus.2ex}%
                                   {\sffamily\Large\bfseries\raggedright}}

\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\sffamily\large\bfseries\raggedright}}

\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
                                     {-3.25ex\@plus -1ex \@minus -.2ex}%
                                     {1.5ex \@plus .2ex}%
                                     {\sffamily\normalsize\bfseries\raggedright}}

\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
                                    {-3.25ex \@plus-1ex \@minus-.2ex}%
                                    {1.5ex \@plus .2ex}%
                                    {\sffamily\normalsize\bfseries\raggedright}}

\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\z@}%
                                       {3.25ex \@plus1ex \@minus .2ex}%
                                       {-1em}%
                                      {\sffamily\normalsize\bfseries}}

% Better list formatting
\setlength\leftmargini  \parindent
\setlength\leftmarginii {1.2em}
\setlength\leftmarginiii{1.2em}
\setlength\leftmarginiv {1.2em}
\setlength\leftmarginv  {1.2em}
\setlength\leftmarginvi {1.2em}

% Improved enumerate labels
\renewcommand\labelenumi{%
  \textcolor{black}{\sffamily\bfseries\upshape\mathversion{bold}\theenumi.}}

\renewcommand\labelenumii{%
  \textcolor{black}{\sffamily\bfseries\upshape\mathversion{bold}\theenumii.}}

\renewcommand\labelenumiii{%
  \textcolor{black}{\sffamily\bfseries\upshape\mathversion{bold}\theenumiii.}}

\renewcommand\labelenumiv{%
  \textcolor{black}{\sffamily\bfseries\upshape\mathversion{bold}\theenumiv.}}

% Improved itemize labels
\renewcommand\labelitemi{%
  \textcolor{black}{\ifnum\@listdepth=\@ne
                                  \rule{0.67em}{0.33em}%
                                \else
                                  \rule{0.45em}{0.225em}%
                                \fi}}

\renewcommand\labelitemii{%
  \textcolor{black}{\rule{0.45em}{0.225em}}}

\renewcommand\labelitemiii{%
  \textcolor{black}{\sffamily\bfseries\textasteriskcentered}}

\renewcommand\labelitemiv{%
  \textcolor{black}{\sffamily\bfseries\textperiodcentered}}

% Improved description environment
\renewenvironment{description}
               {\list{}{\advance\partopsep\topsep\topsep\z@\@plus\p@
                        \labelwidth\z@ \itemindent-\leftmargin
                        \let\makelabel\descriptionlabel}}
               {\ifnum\@listdepth=\@ne\global\@nobotseplisttrue\fi\endlist}

\renewcommand*\descriptionlabel[1]{%
  \hspace\labelsep\textcolor{black}{\sffamily\bfseries\mathversion{bold}#1}}

\pagestyle{plain}

% Acknowledgements - improved formatting
\newenvironment{acknowledgements}{
  \cleardoublepage\thispagestyle{plain}
  \vskip0.7\bigskipamount
  \noindent
  \rlap{\color{black}\vrule\@width\textwidth\@height1\p@}%
  \hspace*{7mm}\fboxsep1.5mm\colorbox[rgb]{1,1,1}{\raisebox{-0.4ex}{%
    \large\selectfont\sffamily\bfseries Acknowledgements}}%
  \vskip3\p@
  \fontsize{11}{13.5}\selectfont
  \noindent\ignorespaces
  \addcontentsline{toc}{chapter}{Acknowledgements}
}{
  \vspace{2em}
}
