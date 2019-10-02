
Workflow
========

1. Edit updates-groups.xml.in

2. Execute `make pot`

3. Upload i18n strings to Transifex: ``tx push -s``

4. Open a PR. 

When a PR is merged, Travis-CI builds and deploys the comps XML file. 

The new comps file is effective after the next `createrepo` run.
