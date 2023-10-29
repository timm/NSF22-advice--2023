% $Id: NSF.cls 3089 2012-10-23 21:38:10Z nkraft $

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NSF}
\LoadClass[10pt,letterpaper]{article}

 

%-- Packages

%---- fonts
\RequirePackage[sc]{mathpazo}          % Palatino for roman (\rm)
\RequirePackage[scaled=0.95]{helvet}   % Helvetica for sans serif (\sf)
\RequirePackage{courier}               % Courier for typewriter (\tt)
\normalfont
\RequirePackage[T1]{fontenc}
%\RequirePackage{textcomp}

% \usepackage{fontspec}
% \setmainfont{Times New Roman}
% \usepackage{newtxmath}

% \usepackage{amsmath}
% \usepackage{fontspec}
% \usepackage{unicode-math}
% %\setmathfont[]{Stix Two Math}
% %\setmathfont[range=\mathit/{latin,Latin,greek,Greek}]{xits-math}
% \setmainfont{Times New Roman}



%---- other
\RequirePackage{amsmath} % for \nobreakdash
\RequirePackage{booktabs}
\RequirePackage{cite}
\RequirePackage{comment}
\RequirePackage[usenames,dvipsnames]{xcolor}

%\usepackage[dvipsnames]{xcolor}

%\RequirePackage{fancyhdr}
\RequirePackage[bottom,hang]{footmisc}
\RequirePackage[pdftex]{geometry}
\RequirePackage[pdftex]{graphicx}
%\RequirePackage[pdftex]{hyperref}
\RequirePackage{hyphenat}
\RequirePackage{lipsum}
%\RequirePackage{pdfcomment}
\RequirePackage[caption=false]{subfig}
\RequirePackage{titlesec}
\usepackage{fancyhdr}
\RequirePackage{ulem}
\RequirePackage{url}
% \RequirePackage[table]{xcolor}


%-- Package Configuration

%---- font (palatino)
%\linespread{1.05}
\linespread{1.1}

%---- geometry
\geometry{letterpaper}
%\geometry{textwidth=6.5in}
%\geometry{textheight=9in}
\geometry{top=1in,left=1in,bottom=1in,right=1in}
%\geometry{headheight=14pt}

%\usepackage[margin=1truein]{geometry}
%\usepackage[margin=1in]{geometry}
\setlength\voffset{5pt}
\setlength\headsep{20pt}
%\setlength\footskip{33pt}

%---- fancyhdr
\pagestyle{plain}

\begin{comment}
\hypersetup{%
   hyperfootnotes=false,
   breaklinks=true,
   colorlinks=true,
   linkcolor=black,
   citecolor=black,
   urlcolor=black,
   pdfstartview={Fit},
   pdfpagelayout={SinglePage},
}
\end{comment}

%---- titlesec
\newcommand{\title@large}{\bfseries\sffamily\large}
\newcommand{\title@normalsize}{\bfseries\sffamily\normalsize}
\newcommand{\para@normalsize}{\itshape\bfseries\sffamily\normalsize}

\titleformat{\section}[hang]
   {\title@large}{\thesection}{1em}{}
\titleformat{\subsection}[hang]
   {\title@normalsize}{\thesubsection}{1em}{}
\titleformat{\subsubsection}[hang]
   {\title@normalsize}{\thesubsubsection}{1em}{}
\titleformat{\paragraph}[runin]
   {\para@normalsize}{\theparagraph}{1em}{}
\titlespacing*{\section}{0pt}{*0}{*0}
\titlespacing*{\subsection}{0pt}{*0}{*0}
\titlespacing*{\subsubsection}{0pt}{*0}{*0}
\titlespacing*{\paragraph}{0pt}{*0}{*2}

%---- ulem
\normalem

%\clubpenalty = 10000
%\widowpenalty = 10000

\AtBeginDocument{
   %\fontsize{11.25}{14.25}\selectfont
}


%-- Renew Commands

\renewcommand{\thepart}{Part~\Roman{part}}
\setcounter{part}{0}
\renewcommand{\part}{%
   \@ifstar
      \part@star%
      \part@nostar%
}
\newcommand{\part@nostar}[1]{%
   \refstepcounter{part}%
   \addcontentsline{toc}{part}{\thepart}%
   {\title@large \thepart\hspace*{1em}#1}%
}
\newcommand{\part@star}[1]{%
   \addcontentsline{toc}{part}{#1}%
}

%---- fancyhdr
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0pt}


%-- Document Properties

\setlength{\footnotemargin}{1em}
\setlength{\parindent}{0pt}
%\setlength{\parskip}{9pt}
\setlength{\parskip}{7.5pt}


%-- NSF Proposal

%---- title and author
\newcommand{\ProjectTitle}[1]{\gdef\NSF@title{#1}}
\newcommand{\ProjectAuthor}[1]{\gdef\NSF@author{#1}}

%---- bibliography
\renewcommand{\refname}{~}
\bibliographystyle{IEEEtranS}


%---- page numbering
\def\NSF@lhead{\slshape\sffamily\normalsize \NSF@author}
\def\NSF@rhead{\slshape\sffamily\normalsize Page~\thepage}
\def\NSF@nopagehead{\slshape\sffamily\normalsize Page~\thepage}
\def\NSF@cfoot{~}%\slshape\sffamily\normalsize \NSF@title}
\def\NSF@thesection{A}
\def\thelastpage{1}
\renewcommand{\thepage}{\NSF@thesection-\arabic{page}}

\newcommand{\NSF@section}[1]{%
   \clearpage
   \setcounter{page}{1}%
   \gdef\NSF@thesection{#1}
}

\newenvironment{nsfsummary}{%
   \NSF@section{A}%
   \gdef\thelastpage{\pageref{lastsummarypage}}
   \fancyhf{}
   \rhead{\NSF@rhead}
   \cfoot{~}%\NSF@cfoot}
   \lhead{\NSF@lhead}
   \vspace*{-7mm}
   %\centerline{\bfseries\sffamily\normalsize Project Summary}
   %\medskip
}{
   \label{lastsummarypage}
}
\newenvironment{nsfdescription}{%
   \NSF@section{C}%
   \gdef\thelastpage{\pageref{lastdescriptionpage}}
   \fancyhf{}
   \rhead{\NSF@rhead}
   \cfoot{~}%\NSF@cfoot}
   \lhead{\NSF@lhead}
}{
   \rhead{\NSF@rhead}
   \label{lastdescriptionpage}
}
\newenvironment{nsfreferences}{%
   \NSF@section{D}%
   \gdef\thelastpage{\pageref{lastrefpage}}
   \fancyhf{}
   \rhead{\NSF@rhead}
   \cfoot{~}%\NSF@cfoot}
   \lhead{\NSF@lhead}
   \refstepcounter{section}%
   \addcontentsline{toc}{section}{\refname}
}{
   \label{lastrefpage}
}
\newenvironment{nsfbiosketch}{%
   \NSF@section{E}%
}{}
\newenvironment{nsfbudget}[1]{%
  \newcommand{\institution}{#1}
   \NSF@section{F}%
   \gdef\thelastpage{\pageref{lastbudgetpage}}
   \fancyhf{}
   \rhead{\NSF@rhead}
   \cfoot{~}%\NSF@cfoot}
   \lhead{\NSF@lhead}
   \refstepcounter{section}%
   \addcontentsline{toc}{section}{Budget Justification}
   \section*{Budget Justification}
   \subsection*{\institution}
}{
   \label{lastbudgetpage}
}
\newenvironment{nsfcollab}{%
   \NSF@section{Collab}%
   \gdef\thelastpage{\pageref{lastcolabpage}}
   \fancyhf{}
   \rhead{\NSF@nopagehead}
   \cfoot{\NSF@cfoot}
   \lhead{\NSF@lhead}
   \refstepcounter{section}%
   \addcontentsline{toc}{section}{Data Management Plan}
   \section*{Collaboration Plan}
}{
   \label{lastcolabpage}
}
\newenvironment{nsfdata}{%
   \NSF@section{DMP}%
   \gdef\thelastpage{\pageref{lastdatapage}}
   \fancyhf{}
   \rhead{\NSF@nopagehead}
   \cfoot{~}%\NSF@cfoot}
   \lhead{\NSF@lhead}
   \refstepcounter{section}%
   \addcontentsline{toc}{section}{Data Management Plan}
   \section*{Data Management Plan}
}{
   \label{lastdatapage}
}
\newenvironment{nsfpersonnel}{%
   \NSF@section{Personnel}%
   \gdef\thelastpage{\pageref{lastpersonnelpage}}
   \fancyhf{}
   \rhead{\NSF@nopagehead}
   \cfoot{~}%\NSF@cfoot}
   \lhead{\NSF@lhead}
   \refstepcounter{section}%
   \addcontentsline{toc}{section}{Project Personnel and Partner Organizations}
   \section*{Project Personnel and Partner Organizations}
}{
   \label{lastpersonnelpage}
}

\newenvironment{nsfcommunity}{%
   \NSF@section{Community}%
   \gdef\thelastpage{\pageref{lastcommunitypage}}
   \fancyhf{}
   \rhead{\NSF@nopagehead}
   \cfoot{\NSF@cfoot}
   \lhead{\NSF@lhead}
   \refstepcounter{section}%
   \addcontentsline{toc}{section}{Community Outreach Documentation}
   \section*{Community Outreach Documentation}
}{
   \label{lastcommunitypage}
}

\newenvironment{nsfroles}{%
   \NSF@section{Roles}%
   \gdef\thelastpage{\pageref{lastrolespage}}
   \fancyhf{}
   \rhead{\NSF@nopagehead}
   \cfoot{~}%\NSF@cfoot}
   \lhead{\NSF@lhead}
   \refstepcounter{section}%
   \addcontentsline{toc}{section}{Project Roles}
   \section*{Project Roles}
}{
   \label{lastrolespage}
}


\newenvironment{nsffacilities}[1]{
	\newcommand{\institution}{#1}
	\NSF@section{FAC}
	\gdef\thelastpage{\pageref{lastfacilitiespage}}
	\fancyhf{}
    \rhead{~}
	\cfoot{~}%\NSF@cfoot}
	\lhead{~}
	\refstepcounter{section}
	\addcontentsline{toc}{section}{ Facilities}
	\section*{Facilities, Equipment, and Other Resources}
	\subsection*{\institution}
}{
	\label{lastfacilitiespage}
}

\newcommand{\ProjectSummary}[1]{%
   \begin{nsfsummary}
      \input{#1}
   \end{nsfsummary}
}
\newcommand{\ProjectDescription}[1]{%
   \begin{nsfdescription}
      \input{#1}
   \end{nsfdescription}
}
\newcommand{\ReferencesCited}[1]{%
   %\fontsize{10}{12}\selectfont
   \begin{nsfreferences}
      \bibliography{#1}
   \end{nsfreferences}
}
\newcommand{\ProjectPersonnel}[1]{%
   \begin{nsfpersonnel}
      \input{#1}
   \end{nsfpersonnel}
}
\newcommand{\CommunityOutreach}[1]{%
    \begin{nsfcommunity}
        \input{#1}
    \end{nsfcommunity}
}
\newcommand{\ProjectRoles}[1]{%
    \begin{nsfroles}
        \input{#1}
    \end{nsfroles}
}
\newcommand{\BudgetJustification}[2]{%
   \begin{nsfbudget}{#1}
      \input{#2}
   \end{nsfbudget}
}
\newcommand{\DataManagementPlan}[1]{%
   \begin{nsfdata}
      \input{#1}
   \end{nsfdata}
}

\newcommand{\Facilities}[2]{
	\begin{nsffacilities}{#1}
		\input{#2}
	\end{nsffacilities}
}


% list environments

\newlength{\oldparskip}
\setlength{\oldparskip}{\parskip}

\newenvironment{itemize*}{%
   \setlength{\parskip}{0pt}
   \begin{itemize}
      \setlength{\topsep}{0pt}
      \setlength{\partopsep}{0pt}
      \setlength{\itemsep}{1.5pt}
      \setlength{\parsep}{1.5pt}
      \setlength{\parskip}{0pt}
}{%
   \end{itemize}
   \setlength{\parskip}{\oldparskip}
   %\vspace*{-\parskip}
}

\newenvironment{enumerate*}{%
   \setlength{\parskip}{0pt}
   \begin{enumerate}
      \setlength{\topsep}{0pt}
      \setlength{\partopsep}{0pt}
      \setlength{\itemsep}{1.5pt}
      \setlength{\parsep}{1.5pt}
      \setlength{\parskip}{0pt}
}{%
   \end{enumerate}
   \setlength{\parskip}{\oldparskip}
}

\newenvironment{description*}{%
   \setlength{\parskip}{0pt}
   \begin{description}
      \setlength{\topsep}{0pt}
      \setlength{\partopsep}{0pt}
      \setlength{\itemsep}{1.5pt}
      \setlength{\parsep}{1.5pt}
      \setlength{\parskip}{0pt}
}{%
   \end{description}
   \setlength{\parskip}{\oldparskip}
}

\newbox\sf@box
\newenvironment{SubFloat}[2][]{%
   \def\sf@one{#1}%
   \def\sf@two{#2}%
   \setbox\sf@box\hbox
   \bgroup%
}{%
   \egroup
   \ifx\@empty\sf@two\@empty\relax
      \def\sf@two{\@empty}
   \fi
   \ifx\@empty\sf@one\@empty\relax
      \subfloat[\sf@two]{\box\sf@box}%
   \else
      \subfloat[\sf@one][\sf@two]{\box\sf@box}%
   \fi%
}

% vim:syntax=tex
