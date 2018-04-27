SHELL = /bin/bash
XMLINFILES=$(wildcard *.xml.in)
XMLFILES = $(patsubst %.xml.in,%.xml,$(XMLINFILES))

all: pot $(XMLFILES)

pot: $(XMLINFILES)
	pushd po; intltool-update --pot --gettext-package=comps ../$<; popd

clean:
	@rm -fv *~ *.xml

validate: $(XMLFILES) comps.rng
	for f in $(XMLFILES); do xmllint --noout --relaxng comps.rng $$f; done

%.xml: %.xml.in
	@python -c 'import libxml2; libxml2.parseFile("$<")'
	@if [[ ".$(CLEANUP)" == .yes ]] ; then xsltproc --novalid -o $< comps-cleanup.xsl $<; fi
	./update-comps $@


