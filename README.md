#![](data/logo.png)
The **tlc_article** repository uses a SCRUM framework adapted to standard GitHub
tooling.  **tlc_article** is integrated with Travis-ci.org for continuous
integration and AllanConsulting.slack.com for centralized notification.

## Installation are done Locally or Globally
### Local Installation
```bash
$ cd $HOME
$ git clone git@github.com:Traap/tlc-article.git
$ cd tlc-article
$ cp -v tlc-article.cls $HOME/mydoc
$ cp -v tlc-article.cls $HOME/mydoc/.
```

### Global Installation
```bash
$ cd $HOME
$ git clone git@github.com:Traap/tlc-article.git
$ cd tlc-article
$ sudo mkdir -p $(kpsewhich -var-value TEXMFLOCAL)/tex/latex/tlc-article
$ sudo mv -v tlc-article.cls $(kpsewhich -var-value TEXMFLOCAL)/tex/latex/tlc-article/.
$ sudo mktexlsr $(kpsewhich -var-value TEXMFLOCAL)
```
# Project Management
Please refer to my [Lightweight Project Mangement](https://github.com/Traap/lpm)
for the project management strategy I use.
