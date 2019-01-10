svgs = $(shell for F in media/svg/*.svg; do echo $${F%.svg}; done)

_: MT_Dite_Mikulas_2019

media/%.pdf: media/%.svg
	inkscape -D -z --file="$(shell echo ${PWD})/$<" --export-pdf "$(shell echo ${PWD})/$@" --export-latex

main.tex: main.ctex
	./preprocess.sh

quick: main.tex
	echo "" | xelatex -shell-escape main
	mv main.pdf MT_Dite_Mikulas_2019.pdf

MT_Dite_Mikulas_2019: $(addsuffix .pdf,$(svgs)) main.tex
	arara main || ( tail -n 50 main.log && exit 1 )
	mv main.pdf MT_Dite_Mikulas_2019.pdf

skim:
	open -a /Applications/Skim.app MT_Dite_Mikulas_2019.pdf

clean:
	git clean -Xf

progress:
	./progress.sh


.PHONY: clean all
