% {{{ tlc-article
%
% Class:
%   tlc-article
%
% Purpose:
%   This LaTeX class provides an article implementation that standardizes
%   a document layout intended for formal documents.
%
% Note:
%   I use 'set foldmethod=market' in my vimrrc to enable folding when viewing or
%   editing this file.
%
% -------------------------------------------------------------------------- }}}
% {{{ Base tlc-article definitions.

\NeedsTeXFormat{LaTeX2e}%
\ProvidesClass{tlc-article}[2021/05/12 v1.1.19 Traap LaTeX Class Article]%

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}%
\ProcessOptions%

\LoadClass{article}%

\makeatletter%

% -------------------------------------------------------------------------- }}}
% {{{ Page layout

\RequirePackage[a4paper,top=1.0in,bottom=1.0in,left=1.0in,right=1.0in]{geometry}%
\RequirePackage{multicol}%

% -------------------------------------------------------------------------- }}}
% {{{ Required parts to use glossaries must come first.

\RequirePackage{lmodern}%
\RequirePackage[T1]{fontenc}%
\RequirePackage{textcomp}%
\RequirePackage[utf8]{inputenc}%
\RequirePackage[colorlinks]{hyperref}%
\RequirePackage{bookmark}%

% -------------------------------------------------------------------------- }}}
% {{{ Define glossaries.

\RequirePackage[acronym,      % create 'acronym' glossary type,
                nopostdot,    %
                nonumberlist, %
                style=altlist,% use altlist style
                toc,          % add the glossary to the table of contents.
               ]{glossaries}%

% -------------------------------------------------------------------------- }}}
% {{{ Color, Graphics and links.

\RequirePackage{graphicx}%
\RequirePackage[table]{xcolor}%
\definecolor{darkblue}{rgb}{0,0,0.5}%

% -------------------------------------------------------------------------- }}}
% {{{ Listings and verbatim

\RequirePackage{listings}%
\RequirePackage{spverbatim}%

% -------------------------------------------------------------------------- }}}
% {{{ Arrays, list and tables

\RequirePackage{array}%
\RequirePackage{csvsimple}%
\RequirePackage{enumitem}%
\RequirePackage{longtable}%
\RequirePackage{makecell}%
\RequirePackage{tabularx}%
\setlength{\parindent}{0pt}%

% -------------------------------------------------------------------------- }}}
% {{{ pdf

\RequirePackage{pdflscape}%
\RequirePackage{pdfpages}%

% -------------------------------------------------------------------------- }}}
% {{{ Miscellaneous

\RequirePackage[toc,page]{appendix}%
\RequirePackage{todonotes}%
\RequirePackage{ifthen}%

% -------------------------------------------------------------------------- }}}
% {{{ Table of Contents
%
% We want our table of contents to use dots as a leader.

\RequirePackage{tocloft}%
\renewcommand\cftsecleader{\cftdotfill{\cftdotsep}}%

% -------------------------------------------------------------------------- }}}
% {{{ Header and Footers

% Create a beautiful document header and document footer using the packages
% listed below.

\RequirePackage{fancyhdr}%  Page layout in \LaTeX
\RequirePackage{titling}%   Control over \maketitle & \thanks
\RequirePackage{lastpage}%  Page n of m
\pagestyle{fancy}%          fancy page style

% -------------------------------------------------------------------------- }}}
% {{{ Control header, footer, and table of contents.
%
% Keep We want our header and footer to remain consistent with a table of
% contents that span multiple pages.

\AtBeginDocument{%
  \addtocontents{toc}{\protect\thispagestyle{fancy}}%
}%

% -------------------------------------------------------------------------- }}}
% {{{ Colors: Custom

\definecolor{backcolour}{rgb}{0.95,0.95,0.92}%
\definecolor{codegray}{rgb}{0.5,0.5,0.5}%
\definecolor{codegreen}{rgb}{0,0.6,0}%
\definecolor{codepurple}{rgb}{0.58,0,0.82}%
\definecolor{darkblue}{rgb}{0,0,0.5}%

% -------------------------------------------------------------------------- }}}
% {{{ Colors: Code listings

\lstdefinestyle{tlcStyle}{%
  backgroundcolor=\color{backcolour},%
  commentstyle=\color{codegreen},%
  keywordstyle=\color{magenta},%
  numberstyle=\tiny\color{codegray},%
  stringstyle=\color{codepurple},%
  basicstyle=\footnotesize,%
  breakatwhitespace=false,%
  breaklines=true,%
  captionpos=b,%
  keepspaces=true,%
  numbers=left,%
  numbersep=4pt,%
  showspaces=false,%
  showstringspaces=false,%
  showtabs=false,%
  tabsize=2%
}%
\lstset{style=tlcStyle}%

% -------------------------------------------------------------------------- }}}
% {{{ Colors: Hyper link

\hypersetup{%
  bookmarksopen   = true,%
  citebordercolor = white!100,%
  citecolor       = darkblue,%
  filebordercolor = white!100,%
  filecolor       = darkblue ,%
  linkbordercolor = white!100,%
  linkcolor       = darkblue,%
  linktoc         = all,%
  menubordercolor = white!100,%
  pdfauthor       = {},%
  pdfborder       = {0 0 0 [0 0]},%
  pdfkeywords     = {},%
  pdfstartview    = FitH,%
  pdfsubject      = {},%
  pdftitle        = {},%
  runbordercolor  = white!100,%
  urlbordercolor  = white!100,%
  urlcolor        = darkblue%
}%

% -------------------------------------------------------------------------- }}}
% {{{ Define the optional input files.

\def\tlc@location{data}%
\def\tlc@logoFile{\tlc@location/logo.png}%
\def\tlc@versionFile{\tlc@location/version.csv}%
\def\tlc@additionalLayout{\tlc@location/additional-layout.tex}%
\def\tlc@headerFooter{\tlc@location/header-footer.tex}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: L, C, R

% New column types: L, C, and R are Left, Center, and Right, respectively are
% designed to use with longtable.  Data is wrapped within a table cell.   The
% parameter defines the column width.  As an example, L{2cm} yields a Left
% aligned, ragged right, wrapped text within a 2cm wide cell.
%
% Argument:
%   1 - text to left, center, or right align.

\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash}p{#1}}%
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash}p{#1}}%
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash}p{#1}}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: ER
%
% This command is generally applied to the end of a table row.

\newcommand{\ER}{\\ \hline}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: inputIfExists
%
% Macro to include a file if it exists.
%
% Argument:
%   1 = the file path to input

\newcommand{\inputIfExists}[1]{\IfFileExists{#1}{\input{#1}}{}}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: tlcBeginLandscape
%
% tlcBeginLandscape and tlcEndLandscape are two new commands used to simplify
% setting page orientation to landscape and consistently setting margins.

\newcommand{\tlcBeginLandscape}{%
  \begin{landscape}%
  \newgeometry{top=1in, bottom=1in,left=1in,right=1in}%
}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: tlcDarkblue
%
% This function is used to simplify making textcolor darkblue.
%
% Argument:
%   1 - the text to enclose in dark blue.

\newcommand{\tlcDarkblue}[1]{\textcolor{darkblue}{#1}}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: tlcDebug
%
% We define tlcDebug to aid our users when they are debugging their document.
% tlcDebug should be placed at the end of your document to allow LaTeX to
% fully expand all macros and definitions.

\newcommand{\tlcDebug}{%
  \clearpage%
  \section{tlc-article Debug}%
  \subsection{tlc-article default files}%
  \begin{description}[align=right,leftmargin=*,labelindent=5cm]%
    \item[tlc@location:]\tlc@location%
    \item[tlc@additionalLayout:]\tlc@additionalLayout%
    \item[tlc@headerFooter:]\tlc@headerFooter%
    \item[tlc@versionFile:]\tlc@versionFile%
    \item[tlc@logoFile:]\tlc@logoFile%
    \item[tlc@versionFile:]\tlc@versionFile%
  \end{description}%
  %
  \subsection{tlc-article file hooks}%
  \begin{description}[align=right,leftmargin=*,labelindent=5cm]%
    \item [tlc@additionalLayout:]\tlcIsDefined{\tlc@additionalLayout}%
    \item [tlc@headerFooter:]\tlcIsDefined{\tlc@headerFooter}%
    \item [tlc@logoFile:]\tlcIsDefined{\tlc@logoFile}%
    \item [tlc@versionFile:]\tlcIsDefined{\tlc@versionFile}%
  \end{description}%
  %
  \subsection{tlc-article header and footer hooks}%
  \begin{description}[align=right,leftmargin=*,labelindent=5cm]%
    \item[tlc@version:] \tlc@version%
    \item[tlc@date:] \tlc@date%
    \item[tlc@status:] \tlc@status%
    \item[tlc@institution:] \tlc@institution%
    \item[tlc@permission:] \tlc@permission%
  \end{description}%
}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: tlcEndLandscape

\newcommand{\tlcEndLandscape}{%
  \restoregeometry%
  \end{landscape}%
}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: tlcGetEnvironmentVariable
%
% A command to extract environment variables
%
% Arguments:
%   1 - the LaTeX variable to set.
%   2 - the environment variable to extract.
%
% Use:
%   \tlcGetEnvironmentVariable{\someLaTeXVariable}{someEnviornmentVariable}
%   \tlcGetEnvironmentVariable{\workingDir}{WORKINGDIR}

\RequirePackage{catchfile}%

\newcommand{\tlcGetEnvironmentVariable}[2][]{%
  \CatchFileEdef{\temp}{"|kpsewhich --var-value #2"}{\endlinechar=-1}%
  \if\relax\detokenize{#1}\relax\temp\else\let#1\temp\fi}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: tlcIsDefined
%
% Writes DEFINED or NOTDEFINED to your document.
%
% Argument:
%   1 - Check for the existence of the file name provided.

\newcommand{\tlcIsDefined}[1]%
{\IfFileExists{#1}%
  {\textcolor{green}{DEFINED}}%
  {\textcolor{red}{NOT DEFINED}}%
}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: tlcVersionPart

% Extract document status, document date and document version from
% tlc@versionFile.

% Argument:
%   1 - the column name to extract from the data file.

\newcommand{\tlcVersionPart}[1]{%
    \tlc@versionFile}{%
      1=\version,%
      2=\date,%
      3=\status,%
      4=\institution,%
      5=\permission%
  }{#1}%
}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: tlcVspace

% Default vertical space

\newcommand{\tlcVspace}{\vspace{3mm}}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: tlcTitlePageAndTableOfContents
%
% Each document uses the same author name, title page and table of contents.
%
%
% Arguments:
%   1 - the title
%   2 - the author
%   3 - the abstract

\newcommand{\tlcTitlePageAndTableOfContents}[3]{%
  \title{#1}%
  \author{#2}%
  \maketitle%
  \ifthenelse{\equal{#3}{}}% Check for Empty string.
             {}% Do nothing.  Parameter is empty.
             {\begin{abstract}#3\end{abstract}}%
  \tableofcontents%
  \thispagestyle{fancy}%
  \clearpage%
}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: useLogoFile
%
% Typeset the logo in the left side of the document header.  Otherwise no
% operation because tlc@logoFile does not exist.

\newcommand{\useLogoFile}{%
  \tlc@versionFile}{%
  \IfFileExists{\tlc@logoFile}{%
    \lhead{\includegraphics[width=3cm,height=1cm]{\tlc@logoFile}}%
  }{}%
}%


% -------------------------------------------------------------------------- }}}
% {{{ Command: useRuler
%
% Add a ruler to the header and footer.
%
% Steps:
%   1. Add a ruler to the header.
%   2. Eliminate head height too small warning, which occurs because we are using
%      multiple lines in our header.
%   3. Apply page n o N to right side footer.
%   4. Add a ruler to the footer.

\newcommand{\useRuler}{%
  \renewcommand{\headrulewidth}{0.1pt}%
  \setlength\headheight{34.0pt}%
  \rfoot{\tiny%
    {Page \thepage~of~\pageref{LastPage}}%
  }%
  \renewcommand{\footrulewidth}{0.1pt}%
}%

% -------------------------------------------------------------------------- }}}
% {{{ Command: useVersionFile
%
% Typeset version information in the right side of the document header.


\newcommand{\useVersionFile}{%
  \IfFileExists{\tlc@versionFile}{%
    %
    % document status, document date and document version.
    %
    \rhead{\tiny \tlc@status \\ \tlc@date \\ \tlc@version}%
    %
    % document owner.  This maybe a person or company name.
    %
    \lfoot{\tiny \tlc@institution}%
    %
    % document license. This maybe a license or word like confidential.
    %
    \cfoot{\tiny \tlc@permission}%
  }{%
    % Else: no operation because tlc@versionFile does not exist.
  }%
}%

% -------------------------------------------------------------------------- }}}
% {{{ Hook: tlc@additionalLayout

% We want to allow the calling document to setup additional layout.

\IfFileExists{\tlc@additionalLayout}%
  {\input{\tlc@additionalLayout}}%
  {}%

% -------------------------------------------------------------------------- }}}
% {{{ Hook: tlc@versionFile

% Extract version parts when tlc@versionFile exists.

\IfFileExists{\tlc@versionFile}%
{%
  \def\tlc@version{\tlcVersionPart{\version}}%
  \def\tlc@date{\tlcVersionPart{\date}}%
  \def\tlc@status{\tlcVersionPart{\status}}%
  \def\tlc@institution{\tlcVersionPart{\institution}}%
  \def\tlc@permission{\tlcVersionPart{\permission}}%
}%
{% Else: no operation because tlc@versionFile does not exist.
  \def\tlc@version{\textcolor{red}{NOT USED}}%
  \def\tlc@date{\textcolor{red}{NOT USED}}%
  \def\tlc@status{\textcolor{red}{NOT USED}}%
  \def\tlc@institution{\textcolor{red}{NOT USED}}%
  \def\tlc@permission{\textcolor{red}{NOT USED}}%
}%

% -------------------------------------------------------------------------- }}}
% {{{ Hook: tlc@headerFooter
%
% Setup Header and Footer.
%
% We want to allow the calling document to override the headers and footers that
% we are defining.

\IfFileExists{\tlc@headerFooter}%
{ % use the customer header and footer defined by \tlc@headerfooter
 \input{\tlc@headerFooter}%
}%
{% Else : header and footer applied to all pages.
  \useLogoFile%              Typeset Logo in the left side of the header.
  \chead{\large{\thetitle}}% Typeset title in center of the header.
  \useVersionFile%           Typeset version info in right side of the header.
  \useRuler%                 Typeset header and footer with a ruler.
}%

% -------------------------------------------------------------------------- }}}
% {{{ The end

\makeatother%

\endinput%

% -------------------------------------------------------------------------- }}}
