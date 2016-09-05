
Workflow
========

1. Edit nethserver-groups.xml.in

2. Upload i18n strings to Transifex: ``tx push -s``

3. Download translated strings from Transifex: ``tx pull -a``

4. Get the XML: ``make``

5. SFTP the XML file to packages.nethserver.org, to ``nscom/<version>/nethserver-groups.xml``

