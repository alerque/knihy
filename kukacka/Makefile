CHAPTERS = meta.md pro-kukacku.md hrdlicka.md pod-vlivem.md tiraz.md

.PHONY: all clean
.PRECIOUS: out/%.html out/%.epub out/%.pdf
.ONESHELL:
SHELL = bash

all: html epub pdf

clean:
	rm out/*

%: out/pro-kukacku.% ;

out/%.html: | $(CHAPTERS) meta.yml style-html.css $(MAKEFILE_LIST)
	pandoc -o $@ --css style-html.css --toc --self-contained -s meta.yml $(CHAPTERS)

out/%.epub: | $(CHAPTERS) meta.yml $(MAKEFILE_LIST)
	pandoc -o $@ -s meta.yml $(CHAPTERS)

# out/%.pdf: %.tex | $(MAKEFILE_LIST)
#      context $< --batch-mode --purgeresult --result=$@

out/%.pdf: %.sil | $(MAKEFILE_LIST)
	sile $^ -o $@

%.tex: | $(CHAPTERS) meta.yml sablona.contex $(MAKEFILE_LIST)
	pandoc -o $@ -t context --toc --self-contained --template=sablona.contex -s meta.yml $(CHAPTERS)

%.sil: | $(CHAPTERS) $(MAKEFILE_LIST)
	cat <<- EOF > $@
		\begin[papersize=a5,class=markdown]{document}
		\language[main=pl]
		\define[command=book:chapterfont]{\font[family=Antykwa Torunska,size=22pt]{\process}}
		\define[command=book:sectionfont]{\font[family=Antykwa Torunska,size=18pt]{\process}}
		\font[language=pl,family=Iwona,size=12pt]
		\begin{obeylines}$(foreach CHAPTER,$(CHAPTERS),
		\include[src=$(CHAPTER)])
		\end{obeylines}
		\end{document}
	EOF
