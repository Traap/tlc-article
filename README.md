# Abstract
The tlc_article repository uses a SCRUM framework adapted to standard GitHub
tooling.  tlc_article is integrated with Travis-ci.org for continuous
integration and AllanConsulting.slack.com for centralized notification.

## Project Name and Project Board.
TLC-ARTICLE is the project name.  The project board has the following columns:
* **Backlog** - Issues that have not been started.
* **In Progress** - Issues that have been started.
* **In Review** - Issues that have are part of a pull request.
* **Done** - Issues that are done.
* **Pull Resuest** - Issues that are a pull request.

## What does Done mean?
TLC-ARTICLE uses different done classifications as follows:
* **duplicate** - A reference to one or more duplicate issues is provided.
* **invalid** - An issue has been determined to be invalid.  A rationale is given.
* **wontfix** - An issue will not be fixed and a rationale is given.

## Milestones Equate to Sprints.
TLC-ARTICLE uses GitHub milestones as a Sprint.  The project uses 3-day sprints
and started on January 5th, 2017.  Sprints names use the following naming
convention: Sprint vM.N.S, where
* **M** - the major Release number starting with 1.
* **N** - the minor Release number starting with 0.
* **S** - the Sprint number starting with 0.

Therefore the next Sprints have been declared:
* **Sprint v1.0.0** - Started 2017.01.05 and ended 2017.01.07.
* **Sprint v1.0.1** - Started 2017.01.08 and ended 2017.01.10.
* **Sprint v1.0.2** - Started 2017.01.09 and ended 2017.01.13.

## Labels
TLC-ARTICLE uses labels as follows:
* **bug** - is an issue that did not meet the intent of the Story.
* **duplicate** - is an issue that duplicates another issue regardless of the
  issue label.  A rationale is given for duplicate issues.
* **enhancement** - the Agile Story format **As a <type of user> I want <some
  goal> so that <some reason>.**
* **help wanted** - is most often used as a secondary tag to ask for help
  determining the direction an issue should take.
* **invalid** - is an issue that is invalid.  A rationale is given for invalid
  issues.
* **pull request** - is used to label a pull request.
* **question** - is most often used as a secondary tag to ask another person
  a question and to track the answer to closure. 
* **wontfix** - this issue will not be fixed.  A rationale is given for issues
  that are not fixed.

## Releases
TLC-ARTICLE consist of one or more milestones.  Release names use the following
naming convention: vM.N.P name, where
* **M** - the major Release number starting with 1.
* **N** - the minor Release number starting with 0.
* **P** - the patch Release number starting with 0.
* **name** - a descriptive name for the release.
