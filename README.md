![tlc-article](data/logo.png)

# tlc-article

`tlc-article` is a LaTeX document class built on the standard `article` class.
It provides a consistent layout for title pages, abstracts, tables of contents,
headers, footers, and margins while remaining customizable through optional
data files.

The [getting-started guide](doc/tlc-article.pdf) is typeset with
`tlc-article.cls` and documents the class in detail.

## Current release

Version 1.2.43

## Installation

Requires LaTeX 2023-11-01 or newer and the dependencies listed in
`data/required-packages.csv`, including `csvsimple` with its LaTeX3 implementation.
UTF-8 input and text companion symbols are provided by the LaTeX kernel.

Install `tlc-article` with your TeX distribution's package manager whenever
possible. For TeX Live:

```bash
tlmgr install tlc-article
```

MiKTeX users can install `tlc-article` with the MiKTeX Console.

### Install for one document

For a local installation, download or clone the repository and copy the class
next to your document's `.tex` file. LaTeX searches the current directory, so
no system-wide installation is required.

```bash
cp tlc-article.cls /path/to/document/
```

## Basic usage

```latex
\documentclass[12pt]{tlc-article}

\begin{document}

\tlcTitlePageAndTableOfContents
  {Document title}
  {Document author}
  {A short abstract for the document.}

\section{Introduction}
Your content begins here.

\end{document}
```

Compile the example document with your preferred LaTeX compiler:

```bash
pdflatex tlc-article.tex
pdflatex tlc-article.tex
```

The second pass resolves the table of contents and cross-references. Apart from
environment-specific header details, the result should match
[`doc/tlc-article.pdf`](doc/tlc-article.pdf).

## Customization

When present, the class loads these optional files from the document's `data/`
directory:

- `additional-layout.tex` for additional LaTeX definitions and layout changes
- `header-footer.tex` for a custom header and footer
- `logo` with a supported graphics extension (for example, `logo.pdf`,
  `logo.png`, or `logo.jpeg` with PDF output) for header branding
- `version.csv` for document status, date, version, institution, and permission

Logo selection follows the active graphics driver’s extension search order when
multiple formats exist. Logos retain their proportions within a 3 cm × 1 cm box;
if no supported logo exists, the header omits it.

See the [getting-started guide](doc/tlc-article.pdf) for the expected formats,
available commands, and package dependencies.

## Author and contact

`tlc-article` is maintained by Gary A. Howard. Report problems or request
features through the
[GitHub issue tracker](https://github.com/Traap/tlc-article/issues).

## License

This project is distributed under the [BSD 3-Clause License](LICENSE).
