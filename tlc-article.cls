% ------------------------------------------------------------------------------
% Class: tlc-article
%
% Purpose: This LaTeX class provides an article implementation that standardizes
% a document layout intended for formal documents.
% ------------------------------------------------------------------------------
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{tlc-article}[2017/01/05 v1.0.1 Traap LaTeX Class Article]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions

\LoadClass{article}

% ------------------------------------------------------------------------------
% Page layout
\RequirePackage{parskip}                   % Blank line after section break.
\RequirePackage[a4paper,
                top=1.0in,
                bottom=1.0in,
                left=1.0in,
                right=1.0in]{geometry}
\RequirePackage{multicol}
\setlength{\parskip}{0.5em}

% ------------------------------------------------------------------------------
% Fonts etc.
\RequirePackage{lmodern}
\RequirePackage[T1]{fontenc}
\RequirePackage{textcomp}

% ------------------------------------------------------------------------------
% Color, Graphics and links.
\RequirePackage[colorlinks]{hyperref}
\RequirePackage{graphicx}
\RequirePackage[table]{xcolor}
\RequirePackage{xcolor}
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
\RequirePackage{listings}
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
\RequirePackage{parskip}
\RequirePackage[toc,page]{appendix}

% ------------------------------------------------------------------------------
% This function is used to simplify making textcolor darkblue.
\newcommand{\tlcDarkblue}[1]{\textcolor{darkblue}{#1}}

% ------------------------------------------------------------------------------
% newcolumtype's have been defined to assist you when need to define longtable
% columns.  L, C, R are Left, Center, Right. Text is wrapped within the cell.
% Argument is used to specify the column width.  L{2cm} gives us Left aligned,
% ragged right, wrapped text a 2cm wide.
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
% myBeginLandscape and myEndLandscape are two new commands used to simplify
% setting page orientation to landscape and consistently setting margins.
\newcommand{\tlcBeginLandscape}{%
  \begin{landscape}%
  \newgeometry{top=1in, bottom=1in,left=1.9in,right=0in}%
}%
\newcommand{\tlcEndLandscape}{%
  \restoregeometry%
  \end{landscape}%
}

% ------------------------------------------------------------------------------
% We want to allow the calling document to setup additional layout.
\IfFileExists{docstyle/additional-layout.tex}
  {\input{docstyle/additional-layout.tex}}
  {}

% ------------------------------------------------------------------------------
% We want to allow the calling document to override the headers and footers that
% we are defining.
\IfFileExists{docstyle/header-footer.tex}
  {\input{docstyle/header-footer.tex}}
  {
    % We provide a default implementation for lhead, chead, rhead, 
    % lfoot, cfoot, and rfoot.
    \newcommand*{\tlc@Lhead}{\tiny \tlcDarkblue{fancyndr.lhead}}
    \newcommand*{\tlc@Chead}{\large\tlcDarkblue{fancyndr.chead}}
    \newcommand*{\tlc@Rhead}{\tiny \tlcDarkblue{fancyndr.rhead}}
    \newcommand*{\tlc@Lfoot}{\tiny \tlcDarkblue{fancyndr.lfoot}}
    \newcommand*{\tlc@Cfoot}{\tiny \tlcDarkblue{fancyndr.cfoot}}
    \newcommand*{\tlc@Rfoot}{\tiny \tlcDarkblue{Page~\thepage~of~\pageref{LastPage}}}

    % We want our table of contents to use dots as a leader.
    \RequirePackage{tocloft}
    \renewcommand\cftsecleader{\cftdotfill{\cftdotsep}}
    % Packages needed to create nice looking headers and footers.
    \RequirePackage{fancyhdr}   % Page layout in \LaTeX
    \RequirePackage{titling}    % Control over \maketitle & \thanks
    \RequirePackage{lastpage}   % Page n of m
    \pagestyle{fancy}           % fancy page style
    % Header applied to all pages.
    \lhead{\tlc@Lhead}
    \chead{\tlc@Chead}
    \rhead{\tlc@Rhead}
    \renewcommand{\headrulewidth}{0.1pt}
    % Eliminate head height too small warning, which is occurring because
    % we are using multiple lines in our header.
    \setlength\headheight{18pt}
    % Footer applied to all pages.
    \lfoot{\tlc@Lfoot}
    \cfoot{\tlc@Cfoot}
    \rfoot{\tlc@Rfoot}
    \renewcommand{\footrulewidth}{0.1pt}
    % We want our header and footer to remain consistent with a table of
    % contents that span multiple pages.
    \AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{fancy}}}
  }

% ------------------------------------------------------------------------------
% We define colors that are used throughout the document.
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
  pdfauthor       = {Amgen Digital Health},
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
% Each document uses the same author name, title page and table of
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
\endinput
