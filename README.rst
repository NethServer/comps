
Workflow
========

1. Edit updates-groups.xml.in

2. Execute `make pot`

3. Upload i18n strings to Transifex: ``tx push -s``

4. Open PR then Travis loads the XML and rebuild repodata
