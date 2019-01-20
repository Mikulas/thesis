svgs = $(shell for F in media/svg/*.svg; do echo $${F%.svg}; done)

_: MT_Dite_Mikulas_2019

media/%.pdf: media/%.svg
	inkscape -D -z --file="$(shell echo ${PWD})/$<" --export-pdf "$(shell echo ${PWD})/$@" --export-latex

quick:
	./preprocess.sh -D'TODO=1'
	echo "" | xelatex -shell-escape main
	mv main.pdf MT_Dite_Mikulas_2019.pdf
	make clean-log

MT_Dite_Mikulas_2019: $(addsuffix .pdf,$(svgs))
	./preprocess.sh -D'TODO=1'
	arara main || ( make clean-log && exit 1 )
	mv main.pdf MT_Dite_Mikulas_2019.pdf
	make clean-log

library-test:
	./library-test.sh

clean-log:
	./clean-log.sh

skim:
	open -a /Applications/Skim.app MT_Dite_Mikulas_2019.pdf

clean:
	git clean -Xf

progress:
	./progress.sh


.PHONY: clean all
