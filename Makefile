TEXMAIN=index
PAPER=a-gtk+3-experience-for-transmission-torrent-client
BIBTEX=bibtex -terse
PDFLATEX=texfot pdflatex

test:
	@[[ `which $(PDFLATEX)` ]] || echo $(PDFLATEX) not found
	@[[ `which $(BIBTEX)` ]]   || echo $(BIBTEX) not found

clean:
	rm -f ${TEXMAIN}.{ps,pdf,log,aux,out,dvi,bbl,blg}

bib:
	$(BIBTEX) $(TEXMAIN)

pdf:
	$(PDFLATEX) -draftmode $(TEXMAIN)
	$(BIBTEX) $(TEXMAIN)
	$(PDFLATEX) -draftmode $(TEXMAIN)
	$(PDFLATEX) $(TEXMAIN)

read:
	open $(TEXMAIN).pdf
