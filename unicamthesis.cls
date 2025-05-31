
% unicamthesis.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{unicamthesis}[2025/06/01 UNICAM Final PhD Thesis Style Class]

% Base class and page size similar to LIPIcs
\LoadClass[12pt, a4paper]{book}
\usepackage[top=3cm, bottom=3cm, left=3.5cm, right=3cm]{geometry}

% Essential packages
\usepackage{graphicx, xcolor, amsmath, amssymb, fancyhdr, titlesec, titling}
\usepackage{tocloft, float, algorithm, algorithmicx, caption, listings, hyperref}
\usepackage{etoolbox, lipsum, amsthm}

% Fonts
\usepackage{newtxtext,newtxmath}

% Custom Environments
\newtheorem{definition}{Definition}[chapter]
\newtheorem{example}{Example}[chapter]

% Logos
\newcommand{\universitylogo}{logos/unicam.png}
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
      {\large \schoolname}\\[2em]

      {\normalsize \doctoralcourse: }\\[0.5em]
	  {\Large \textbf{\@cournamec}} \\[1em]
      {\normalsize \curriculum: }\\[0.5em]
	  {\Large \textbf{\@curriculum}} \\[1em]
      {\normalsize \cycle \textbf{~\@cycle}}\\[2em]

      {\LARGE\bfseries \@title}\\[4em]

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

% Declaration
\newenvironment{declaration}{
  \cleardoublepage\thispagestyle{empty}
  \begin{center}
    \textbf{\LARGE DECLARATION}\\[2ex]
    \rule{\textwidth}{0.4pt}
  \end{center}
  \noindent
}{
  \vspace{2em}
  \begin{flushright}
    \textbf{\@author} \\
    \@dateaward
  \end{flushright}
  \vfill
  \footnotesize
  \noindent * This dissertation is presented in partial fulfillment of the requirements for \\
  \textbf{Ph.D. degree} in the School of Advanced Studies of University of Camerino.
}

% Abstract
\newenvironment{abstract}{
  \cleardoublepage\thispagestyle{plain}
  \section*{Abstract}
  \addcontentsline{toc}{chapter}{Abstract}
}{
  \vspace{2em}
}

% TOC, LOF, LOT
\renewcommand{\cfttoctitlefont}{\normalfont\Large\bfseries}
\renewcommand{\cftlottitlefont}{\normalfont\Large\bfseries}
\renewcommand{\cftloftitlefont}{\normalfont\Large\bfseries}
\renewcommand{\cftchapfont}{\bfseries}

% Part styling
\titleformat{\part}[display]
  {\normalfont\centering\bfseries\Huge\color{red}}
  {\partname~\thepart}
  {0.5em}
  {}

% Chapter styling
\titleformat{\chapter}[display]
  {\normalfont\huge\bfseries}
  {\thechapter}
  {1em}
  {}

\pagestyle{plain}
