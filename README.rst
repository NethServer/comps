
Workflow
========

1. Edit `updates-groups.xml.in`

2. Upload i18n strings to Transifex: ``tx push -s``

3. Download translated strings from Transifex: ``tx pull -a``

4. Get the XML: ``make``

5. SFTP the XML file to packages.nethserver.org: ::

     echo -e "cd nscom/7.4.1708/\nput nethserver-groups.xml updates-groups.xml"  | sftp -b - packages.nethserver.org

6. Rebuild repodata on the server: ::

     repobuild 7.3.1708/updates/x86_64

