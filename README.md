![tlc-article](data/logo.png)

# tlc-article

`tlc-article` is a LaTeX document class built on the standard `article` class.
It provides a consistent layout for title pages, abstracts, tables of contents,
headers, footers, and margins while remaining customizable through optional
data files.

The [getting-started guide](doc/tlc-article.pdf) is typeset with
`tlc-article.cls` and documents the class in detail.

## Current release

Version 1.2.42

## Installation

Clone the repository first:

```bash
git clone https://github.com/Traap/tlc-article.git
cd tlc-article
```

### Install for one document

Copy the class next to your document's `.tex` file. LaTeX searches the current
directory, so no system-wide installation is required.

```bash
cp tlc-article.cls /path/to/document/
```

### Install system-wide

The deployment script copies the class into your TeX distribution and refreshes
its filename database. It requires `sudo` and a TeX installation that provides
`kpsewhich` and `mktexlsr`.

```bash
./bin/deploy tlc-article.cls
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
- `logo.png` for title-page and header branding
- `version.csv` for document status, date, version, institution, and permission

See the [getting-started guide](doc/tlc-article.pdf) for the expected formats,
available commands, and package dependencies.

## License

This project is distributed under the [BSD 3-Clause License](LICENSE).
