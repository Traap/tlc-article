#![](data/logo.png)
The tlc_article repository uses a SCRUM framework adapted to standard GitHub
tooling.  tlc_article is integrated with Travis-ci.org for continuous
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
$ sudo mv -v tlc-article.cls $(kpsewhich -var-value TEXMFLOCAL)/tex/latex/tlcarticle/.
$ sudo mktexlsr $(kpsewhich -var-value TEXMFLOCAL)
```
# Project Management
## Project Name and Project Board.
[TLC-ARTICLE](https://github.com/Traap/tlc-article/projects/1) is the project
name.  The project board has the following columns:
* **Backlog** - [Issues](https://github.com/Traap/tlc-article/issues)
  that have not been started.
* **In Progress** - [Issues](https://github.com/Traap/tlc-article/issues).
* **In Review** - [Issues](https://github.com/Traap/tlc-article/issues) that
  have are part of a [pull request](https://github.com/Traap/tlc-article/pulls).
* **Done** - [Issues](https://github.com/Traap/tlc-article/issues) that are done.
* **Pull Resuest** - [Issues](https://github.com/Traap/tlc-article/issues) that
  are a [pull request](https://github.com/Traap/tlc-article/pulls).

## What does Done mean?
[TLC-ARTICLE](https://github.com/Traap/tlc-article/projects/1) uses different
done classifications as follows:
* **duplicate** - A reference to one or more duplicate
  [Issues](https://github.com/Traap/tlc-article/issues) is provided.
* **invalid** - An [Issues](https://github.com/Traap/tlc-article/issues) has
  been determined to be invalid.  A rationale is given.
* **wontfix** - An [Issues](https://github.com/Traap/tlc-article/issues) will
  not be fixed and a rationale is given.

## Milestones Equate to Sprints.
[TLC-ARTICLE](https://github.com/Traap/tlc-article/projects/1) uses GitHub
[milestones](https://github.com/Traap/tlc-article/milestones) as a Sprint.  The
project uses 3-day sprints and started on January 5th, 2017.  Sprints names use
the following naming convention: Sprint vM.N.S, where
* **M** - the major Release number starting with 1.
* **N** - the minor Release number starting with 0.
* **S** - the Sprint number starting with 0.

Therefore the next Sprints have been declared:
* **Sprint v1.0.0** - Started 2017.01.05 and ended 2017.01.07.
* **Sprint v1.0.1** - Started 2017.01.08 and ended 2017.01.10.
* **Sprint v1.0.2** - Started 2017.01.09 and ended 2017.01.13.

## Labels
[TLC-ARTICLE](https://github.com/Traap/tlc-article/projects/1) uses labels as
follows:
* **bug** - is an [Issues](https://github.com/Traap/tlc-article/issues) that did
  not meet the intent of the Story.
* **duplicate** - is an [Issues](https://github.com/Traap/tlc-article/issues)
  that duplicates another issue regardless of the
  [Issues](https://github.com/Traap/tlc-article/issues) label.  A rationale is
  given for duplicate [Issues](https://github.com/Traap/tlc-article/issues).
* **enhancement** - the Agile Story format
```
    As a <type of user> I want <some goal> so that <some reason>.
```
* **help wanted** - is most often used as a secondary tag to ask for help
  determining the direction an
  [Issues](https://github.com/Traap/tlc-article/issues) should take.
* **invalid** - is an issue that is invalid.  A rationale is given for invalid
  [Issues](https://github.com/Traap/tlc-article/issues).
* **pull request** - is used to label a pull request.
* **question** - is most often used as a secondary tag to ask another person
  a question and to track the answer to closure.
* **wontfix** - this [Issues](https://github.com/Traap/tlc-article/issues) will
  not be fixed.  A rationale is given
  for [Issues](https://github.com/Traap/tlc-article/issues) that are not fixed.

## Releases
[TLC-ARTICLE](https://github.com/Traap/tlc-article/projects/1) consist of one or
more milestones.  Release names use the following naming convention: vM.N.P
name, where
* **M** - the major Release number starting with 1.
* **N** - the minor Release number starting with 0.
* **P** - the patch Release number starting with 0.
* **name** - a descriptive name for the release.

[Current](https://github.com/Traap/tlc-article/releases/latest)
[releases](https://github.com/Traap/tlc-article/releases) include a the deployed
version of **GettingStarted.pdf**.
