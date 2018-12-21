svgs = $(shell for F in media/svg/*.svg; do echo $${F%.svg}; done)

_: MT_Dite_Mikulas_2019

media/%.pdf: media/%.svg
	inkscape -D -z --file="$(shell echo ${PWD})/$<" --export-pdf "$(shell echo ${PWD})/$@" --export-latex

quick:
	echo "" | xelatex -shell-escape main
	mv main.pdf MT_Dite_Mikulas_2019.pdf

MT_Dite_Mikulas_2019: $(addsuffix .pdf,$(svgs))
	arara main
	mv main.pdf MT_Dite_Mikulas_2019.pdf

skim:
	open -a /Applications/Skim.app MT_Dite_Mikulas_2019.pdf

clean:
	git clean -Xf

.PHONY: clean all
