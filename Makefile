LATEX ?= pdflatex

all: llncs.cls IEEEtran.cls submodules main.pdf

llncs.cls:
	wget ftp://ftp.springernature.com/cs-proceeding/llncs/llncs2e.zip
	unzip llncs2e.zip llncs.cls

IEEEtran.cls:
	wget https://www.ieee.org/content/dam/ieee-org/ieee/web/org/conferences/Conference-LaTeX-template_7-9-18.zip -O ieee.zip
	unzip -j ieee.zip '*/IEEEtran.cls'

submodules:
	git submodule init
	git submodule update

main.pdf:
	'$(LATEX)' main
	bibtex main
	'$(LATEX)' main
	'$(LATEX)' main

.PHONY: submodules all main.pdf
