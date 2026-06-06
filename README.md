[tlc-article](data/logo.png)

---
The goal of **tlc-article** is to simplify document layout.  **tlc-article**
orchestrates a logical arrangement for document header, footer, author,
abstract, table of contents, and margins.
[tlc-article.pdf](doc/tlc-article.pdf) is a document instantiated
using **tlc-article.cls**.

## Released version
v1.2.23

## Local or Global Installation
### Local Installation
The example below copies tlc-article.cls to path/to/document. Your LaTeX
compiler will use tlc-article.cls from path/to/document.

```bash
cd $HOME
git clone git@github.com:Traap/tlc-article.git
cd tlc-article
cp -v tlc-article.cls $HOME/mydoc
cp -v tlc-article.cls $HOME/mydoc/.
```

### Global Installation
This is the [deployment](https://github.com/Traap/tlc-article/blob/master/bin/deploy)
strategy that I use prior to releasing to CTAN.

```bash
cd $HOME
git clone git@github.com:Traap/tlc-article.git
cd tlc-article
./bin/deploy tlc-article.cls
```

### Installation checks
Use your LaTeX compiler to compile tlc-article.tex.  Except for the header, your
output should match [tlc-article.pdf](doc/tlc-article.pdf).
