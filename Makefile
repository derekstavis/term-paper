TEXMAIN=index
PAPER="a-new-gtk+3-experience-for-transmission-torrent-client"
BIBTEX=bibtex
PDFLATEX=texliveonfly

test:
	@[[ `which $(PDFLATEX)` ]] || echo $(PDFLATEX) not found
	@[[ `which $(BIBTEX)` ]]   || echo $(BIBTEX) not found

clean:
	rm -f ${TEXMAIN}.{ps,pdf,log,aux,out,dvi,bbl,blg}

pdf:
	$(PDFLATEX) $(TEXMAIN)
	$(BIBTEX) $(TEXMAIN)
	$(PDFLATEX) $(TEXMAIN)
	$(PDFLATEX) $(TEXMAIN)

read:
	open $(TEXMAIN).pdf
