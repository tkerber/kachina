LATEX ?= pdflatex

all: llncs.cls IEEEtran.cls acmart.cls submodules main.pdf

llncs.cls:
	wget ftp://ftp.springernature.com/cs-proceeding/llncs/llncs2e.zip
	unzip llncs2e.zip llncs.cls

IEEEtran.cls:
	wget https://www.ieee.org/content/dam/ieee-org/ieee/web/org/conferences/Conference-LaTeX-template_7-9-18.zip -O ieee.zip
	unzip -j ieee.zip '*/IEEEtran.cls'

acmart.cls:
	wget https://www.acm.org/binaries/content/assets/publications/consolidated-tex-template/acmart-master.zip
	unzip -j acmart-master.zip acmart-master/acmart.cls acmart-master/ACM-Reference-Format.bst

submodules:
	git submodule init
	git submodule update

main.pdf:
	'$(LATEX)' main
	bibtex main
	'$(LATEX)' main
	'$(LATEX)' main

.PHONY: submodules all main.pdf
