LATEX=pdflatex
LOPTS=-halt-on-error -interaction=batchmode

TEMPLATE_GENERATED_TEX=Template_MastersThesis.tex Sablona_DP_UTF-8.tex Sablona_sk_DP_UTF-8.tex
TEMPLATE_GENERATED_PDF=$(TEMPLATE_GENERATED_TEX:.tex=.pdf)

JUSTCOMPILE_TEMPLATE_TEX=Template_BachelorsThesis.tex Sablona_BP_UTF-8.tex MastersThesis_example.tex  DP_Priklad.tex Sablona_sk_BP_UTF-8.tex
JUSTCOMPILE_TEMPLATE_PDF=$(JUSTCOMPILE_TEMPLATE_TEX:.tex=.pdf)

JUSTCOMPILE_COVER_TEX=deskyBP_UTF-8_cernobile.tex coverBachelors-bw.tex
JUSTCOMPILE_COVER_PDF=$(JUSTCOMPILE_COVER_TEX:.tex=.pdf)

COVER_GENERATED_BASIC_TEX=coverBachelors-inverse_colours.tex coverMasters-bw.tex coverMasters-inverse_colours.tex deskyBP_UTF-8_invert-barvy.tex deskyDP_UTF-8_cernobile.tex deskyDP_UTF-8_invert-barvy.tex
COVER_GENERATED_BASIC_PDF=$(COVER_GENERATED_BASIC_TEX:.tex=.pdf)

COVER_IMAGES=cvut-logo-w.pdf cvut-logo-bw-symbol.pdf

TEMPLATE_TEX= $(JUSTCOMPILE_TEMPLATE_TEX) $(TEMPLATE_GENERATED_TEX)
TEMPLATE_PDF= $(TEMPLATE_TEX:.tex=.pdf)

TEMPLATE_README_EN_TXT=README_t.txt
TEMPLATE_README_EN_PDF=README_t.pdf
TEMPLATE_README_EN=$(TEMPLATE_README_EN_TXT) $(TEMPLATE_README_EN_PDF)

TEMPLATE_README_CS_TXT=CtiMe_s.txt
TEMPLATE_README_CS_PDF=CtiMe_s.pdf
TEMPLATE_README_CS=$(TEMPLATE_README_CS_TXT) $(TEMPLATE_README_CS_PDF)

COVER_README_EN_TXT=README_c.txt
COVER_README_EN_PDF=README_c.pdf
COVER_README_EN=$(COVER_README_EN_TXT) $(COVER_README_EN_PDF)

COVER_README_CS_TXT=CtiMe_d.txt
COVER_README_CS_PDF=CtiMe_d.pdf
COVER_README_CS=$(COVER_README_CS_TXT) $(COVER_README_CS_PDF)

TEMPLATE_ZIP=$(JUSTCOMPILE_TEMPLATE_TEX) FITthesis.cls iso690.bst csn690.bst mybibliographyfile.bib ref.bib cvut-logo-bw.pdf cvut-logo-bw-en.pdf gnuplot-bw.pdf gnuplot-col.pdf DP_Priklad.pdf MastersThesis_example.pdf $(TEMPLATE_GENERATED_TEX) $(TEMPLATE_README_EN) $(TEMPLATE_README_CS)

COVER_ZIP=$(JUSTCOMPILE_COVER_TEX) FITcover.cls $(JUSTCOMPILE_COVER_PDF) $(COVER_GENERATED_BASIC_TEX) $(COVER_GENERATED_BASIC_PDF) $(COVER_GENERADED_ICONV_TEX) $(COVER_IMAGES) $(COVER_README_EN) $(COVER_README_CS)

all:	$(JUSTCOMPILE_TEMPLATE_TEX) $(JUSTCOMPILE_COVER_TEX)

%.bbl : %.tex %.aux iso690.bst mybibliographyfile.bib
	- bibtex -terse $*

%.acr : %.tex %.aux
	makeglossaries -q $*

%.aux : %.tex
	$(LATEX) $(LOPTS) $*

DP_Priklad.pdf : DP_Priklad.tex csn690.bst mybibliographyfile.bib DP_Priklad.bbl

MastersThesis_example.pdf : MastersThesis_example.tex iso690.bst mybibliographyfile.bib MastersThesis_example.bbl #MastersThesis_example.acr

%.pdf : %.aux
	$(LATEX) $(LOPTS) $*
	$(LATEX) $(LOPTS) $*

%.dvi : %.tex
	latex $(LOPTS) $*

%-ascii.tex : %.tex
	cstocs utf8 ascii $< > $@

%.txt : %-ascii.dvi
	dvi2tty -q -u -c -o $@ $<

%.txt : %.dvi
	dvi2tty -q -u -c -o $@ $<

Template_MastersThesis.tex : Template_BachelorsThesis.tex
	sed 's/\[thesis=B/\[thesis=M/' $< > $@

coverMasters-bw.tex : coverBachelors-bw.tex
	sed 's/\[thesis=B/\[thesis=M/' $< > $@

%_DP_UTF-8.tex : %_BP_UTF-8.tex
	sed 's/\[thesis=B/\[thesis=M/' $< > $@

deskyDP_UTF-8_cernobile.tex : deskyBP_UTF-8_cernobile.tex
	sed 's/\[thesis=B/\[thesis=M/' $< > $@

%-inverse_colours.tex : %-bw.tex
	sed 's/,english]{FITcover}/,english,inverse]{FITcover}/' $< > $@

%_invert-barvy.tex : %_cernobile.tex
	sed 's/,czech]{FITcover}/,czech,inverse]{FITcover}/' $< > $@

clean:
	-rm --force *.bbl *.blg *.out *.djs *.aux *.log *.zip *.lof *.lot *.toc *.acn *.acr *.alg *.gls *.ist *.glo *.glg $(TEMPLATE_GENERATED_TEX) $(TEMPLATE_PDF) $(JUSTCOMPILE_COVER_PDF) $(COVER_GENERATED_BASIC_TEX) $(COVER_GENERATED_BASIC_PDF) $(COVER_GENERADED_ICONV_TEX) $(TEMPLATE_README_CS) $(TEMPLATE_README_EN) $(COVER_README_CS) $(COVER_README_EN) CtiMe-*
