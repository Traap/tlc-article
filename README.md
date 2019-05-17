![tlc-article](data/logo.png)

---
The goal of **tlc-article** is to simplify document layout.  **tlc-article**
orchestrates a logical arrangement for document header, footer, author,
abstract, table of contents, and margins.
[tlc-article.pdf](doc/tlc-article.pdf) is a document instantiated
using **tlc-article.cls**.

## Installation are done Locally or Globally
### Local Installation
```bash
cd $HOME
git clone git@github.com:Traap/tlc-article.git
cd tlc-article
cp -v tlc-article.cls $HOME/mydoc
cp -v tlc-article.cls $HOME/mydoc/.
```

### Global Installation
```bash
cd $HOME
git clone git@github.com:Traap/tlc-article.git
cd tlc-article
./bin/distribute tlc-article.cls
```
