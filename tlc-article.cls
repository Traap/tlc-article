% ------------------------------------------------------------------------------
% Class: tlc-article
%
% Purpose: This LaTeX class provides an article implementation that standardizes
% a document layout intended for formal documents.
% ------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tlc-article}[2018/05/30 v1.0.10 Traap LaTeX Class Article]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass{article}

% ------------------------------------------------------------------------------
% Page layout
\RequirePackage{parskip}                   % Blank line after section break.
\RequirePackage[a4paper,top=1.0in,bottom=1.0in,left=1.0in,right=1.0in]{geometry}
\RequirePackage{multicol}
\setlength{\parskip}{0.5em}

% ------------------------------------------------------------------------------
% Fonts etc.
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}

% ------------------------------------------------------------------------------
% Color, Graphics and links.
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\definecolor{darkblue}{rgb}{0,0,0.5}

% ------------------------------------------------------------------------------
% Listings and verbatim
\RequirePackage{listings}
\RequirePackage{spverbatim}

% ------------------------------------------------------------------------------
% Arrays, list and tables
\RequirePackage{array}
\RequirePackage{csvsimple}
\RequirePackage{enumitem}
\RequirePackage{longtable}
\RequirePackage{makecell}
\RequirePackage{tabularx}
\setlength{\parindent}{0pt}

% ------------------------------------------------------------------------------
% pdf
\RequirePackage{pdflscape}
\RequirePackage{pdfpages}

% ------------------------------------------------------------------------------
% Misc
\RequirePackage[toc,page]{appendix}

% ------------------------------------------------------------------------------
% This function is used to simplify making textcolor darkblue.
\newcommand{\tlcDarkblue}[1]{\textcolor{darkblue}{#1}}

% ------------------------------------------------------------------------------
% Define the optional input files.
\def\tlc@location{data}
\def\tlc@logoFile{\tlc@location/logo.png}
\def\tlc@versionFile{\tlc@location/version.csv}
\def\tlc@additionalLayout{\tlc@location/additional-layout.tex}
\def\tlc@headerFooter{\tlc@location/header-footer.tex}

% New column types: L, C, and R are Left, Center, and Right, respectively are
% designed to use with longtable.  Data is wrapped within a table cell.   The
% parameter defines the column width.  As an example, L{2cm} yields a Left
% aligned, ragged right, wrapped text within a 2cm wide cell.
\newcolumntype{L}[1]{>{\raggedright\let\newline\\\arraybackslash}p{#1}}
\newcolumntype{C}[1]{>{\centering\let\newline\\\arraybackslash}p{#1}}
\newcolumntype{R}[1]{>{\raggedleft\let\newline\\\arraybackslash}p{#1}}

% ------------------------------------------------------------------------------
% We define colors that we would like to use throughout our documents.
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}
\definecolor{backcolour}{rgb}{0.95,0.95,0.92}

% ------------------------------------------------------------------------------
% tlcBeginLandscape and tlcEndLandscape are two new commands used to simplify
% setting page orientation to landscape and consistently setting margins.
\newcommand{\tlcBeginLandscape}{%
  \begin{landscape}%
  \newgeometry{top=1in, bottom=1in,left=1in,right=1in}%
}%
\newcommand{\tlcEndLandscape}{%
  \restoregeometry%
  \end{landscape}%
}

% ------------------------------------------------------------------------------
% We want our table of contents to use dots as a leader.
\RequirePackage{tocloft}
\renewcommand\cftsecleader{\cftdotfill{\cftdotsep}}

% ------------------------------------------------------------------------------
% We want to allow the calling document to setup additional layout.
\IfFileExists{\tlc@additionalLayout}
  {\input{\tlc@additionalLayout}}
  {}

% ------------------------------------------------------------------------------
% Create a beautiful document header and document footer using the packages 
% listed below.
\RequirePackage{fancyhdr}   % Page layout in \LaTeX
\RequirePackage{titling}    % Control over \maketitle & \thanks
\RequirePackage{lastpage}   % Page n of m
\pagestyle{fancy}           % fancy page style

% ------------------------------------------------------------------------------
% Extract document status, document date and document version from
% \tlc@versionFile.
% Argument:
%   1 - the column name to extract from the data file.
\newcommand{\tlcVersionPart}[1]{
  \csvreader[separator=pipe]
  {\tlc@versionFile}{
    1=\version,
    2=\date,
    3=\status,
    4=\institution,
    5=\permission
  }{#1}
}%

% ------------------------------------------------------------------------------
% Define extractions macros when \tlc@versionFile exists.
\IfFileExists{\tlc@versionFile}
{ 
  \def\tlc@version{\tlcVersionPart{\version}}
  \def\tlc@date{\tlcVersionPart{\date}}
  \def\tlc@status{\tlcVersionPart{\status}}
  \def\tlc@institution{\tlcVersionPart{\institution}}
  \def\tlc@permission{\tlcVersionPart{\permission}}
}
{% Else: no operation because tlc@versionFile does not exist. 
}

% ------------------------------------------------------------------------------
% We want to allow the calling document to override the headers and footers that
% we are defining.
\IfFileExists{\tlc@headerFooter}
{ % use the customer header and footer defined by \tlc@headerfooter
 \input{\tlc@headerFooter}
}  
{ % Else : header and footer applied to all pages.
  \IfFileExists{\tlc@logoFile}
  { % Typeset the logo in the left side of the document header. 
    \lhead{\includegraphics[width=3cm,height=1cm]{\tlc@logoFile}}
  }
  {% Else: no operation because tlc@logoFile does not exist.
  }
  % Typeset the title in the center of the document header.
  \chead{\large{\thetitle}}
  % Typeset version information in the right side of the document header. 
  \IfFileExists{\tlc@versionFile}
  { 
    % document status, document date and document version.
    \rhead{\tiny \tlc@status \\ \tlc@date \\ \tlc@version}
    % document owner.  This maybe a person or company name.
    \lfoot{\tiny \tlc@institution}
    % document license. This maybe a license or word like confidential.
    \cfoot{\tiny \tlc@permission}
  }
  {% Else: no operation because tlc@versionFile does not exist. 
  }
  \renewcommand{\headrulewidth}{0.1pt}
  % eliminate head height too small warning, which is occurring because
  % we are using multiple lines in our header.
  \setlength\headheight{34.0pt}
  % footer applied to all pages.
  \rfoot{\tiny{Page \thepage~of~\pageref{LastPage}}}
  \renewcommand{\footrulewidth}{0.1pt}
  % we want our header and footer to remain consistent with a table of
  % contents that span multiple pages.
  \AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{fancy}}}
}

% ------------------------------------------------------------------------------
% We define colors that are used throughout the document.
\RequirePackage[colorlinks]{hyperref}
\definecolor{darkblue}{rgb}{0,0,0.5}
\hypersetup{
  bookmarksopen   = true,
  citebordercolor = white!100,
  citecolor       = darkblue,
  filebordercolor = white!100,
  filecolor       = darkblue ,
  linkbordercolor = white!100,
  linkcolor       = darkblue,
  linktoc         = all,
  menubordercolor = white!100,
  pdfauthor       = {},
  pdfborder       = {0 0 0 [0 0]},
  pdfkeywords     = {},
  pdfstartview    = FitH,
  pdfsubject      = {},
  pdftitle        = {},
  runbordercolor  = white!100,
  urlbordercolor  = white!100,
  urlcolor        = darkblue
}

% ------------------------------------------------------------------------------
% We define colors that are used when includeing code files (software). 
\lstdefinestyle{tlcStyle}{
        backgroundcolor=\color{backcolour},
        commentstyle=\color{codegreen},
        keywordstyle=\color{magenta},
        numberstyle=\tiny\color{codegray},
        stringstyle=\color{codepurple},
        basicstyle=\footnotesize,
        breakatwhitespace=false,
        breaklines=true,
        captionpos=b,
        keepspaces=true,
        numbers=left,
        numbersep=4pt,
        showspaces=false,
        showstringspaces=false,
        showtabs=false,
        tabsize=2
}
\lstset{style=tlcStyle}

% ------------------------------------------------------------------------------
% End Row : Generally applied to the end of a table row.
\newcommand{\ER}{\\ \hline}%

% ------------------------------------------------------------------------------
% Macro to include a file if it exists.
% 1 = the file path to input
\newcommand{\inputIfExists}[1]{\IfFileExists{#1}{\input{#1}}{}}%

% ------------------------------------------------------------------------------
% Each document uses the same author name, title page and table of contents.
% Arguments:
%   1 - the title
%   2 - the author
%   3 - the abstract
\newcommand{\tlcTitlePageAndTableOfContents}[3]{%
  \title{#1}%
  \author{#2}%
  \maketitle%
  \begin{abstract}#3\end{abstract}%
  \tableofcontents%
  \thispagestyle{fancy}%
  \clearpage%
}%

% ------------------------------------------------------------------------------
% We define tlcDebug to aid our users when they are debugging their document.
% tlcDebug should be placed at the end of your document to allow LaTeX to 
% fully expand all macros and definitions.
\newcommand{\tlcIsDefined}[1]%
{\IfFileExists{#1}%
  {\textcolor{green}{DEFINED}}%
  {\textcolor{red}{NOT DEFINED}}%
}%
\newcommand{\tlcDebug}{%
  \clearpage
  \section{tlc-article Debug}
  \subsection{tlc-article default files}
  \begin{description}[align=right,leftmargin=*,labelindent=5cm]
    \item[tlc@location:]\tlc@location
    \item[tlc@additionalLayout:]\tlc@additionalLayout
    \item[tlc@headerFooter:]\tlc@headerFooter
    \item[tlc@versionFile:]\tlc@versionFile
    \item[tlc@logoFile:]\tlc@logoFile
    \item[tlc@versionFile:]\tlc@versionFile
  \end{description}
  %
  \subsection{tlc-article file hooks}
  \begin{description}[align=right,leftmargin=*,labelindent=5cm]
    \item [tlc@additionalLayout:]\tlcIsDefined{\tlc@additionalLayout}
    \item [tlc@headerFooter:]\tlcIsDefined{\tlc@headerFooter}
    \item [tlc@logoFile:]\tlcIsDefined{\tlc@logoFile}
    \item [tlc@versionFile:]\tlcIsDefined{\tlc@versionFile}
  \end{description}
  %
  \subsection{tlc-article header and footer hooks}
  \begin{description}[align=right,leftmargin=*,labelindent=5cm]
    \item[tlc@version:] \tlc@version
    \item[tlc@date:] \tlc@date
    \item[tlc@status:] \tlc@status
    \item[tlc@institution:] \tlc@institution
    \item[tlc@permission:] \tlc@permission
  \end{description}
}%
% ------------------------------------------------------------------------------
\endinput
