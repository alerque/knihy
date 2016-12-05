CHAPTERS = meta.md pro-kukacku.md hrdlicka.md pod-vlivem.md tiraz.md

.PHONY: all clean
.PRECIOUS: out/%.html out/%.epub out/%.pdf

all: html epub pdf

clean:
	rm out/*

%: out/pro-kukacku.% ;

out/%.html: | $(CHAPTERS) meta.yml style-html.css $(MAKEFILE_LIST)
	pandoc -o $@ --css style-html.css --toc --self-contained -s meta.yml $(CHAPTERS)

out/%.epub: | $(CHAPTERS) meta.yml $(MAKEFILE_LIST)
	pandoc -o $@ -s meta.yml $(CHAPTERS)

# out/%.pdf: %.tex | $(MAKEFILE_LIST)
#     context $< --batch-mode --purgeresult --result=$@

out/%.pdf: %.sil | $(MAKEFILE_LIST)
	sile $< -o $@

%.tex: | $(CHAPTERS) meta.yml sablona.contex $(MAKEFILE_LIST)
	pandoc -o $@ -t context --toc --self-contained --template=sablona.contex -s meta.yml $(CHAPTERS)

%.sil: | $(CHAPTERS) meta.yml sablona.sile $(MAKEFILE_LIST)
	pandoc -o $@ --template=sablona.sile -s meta.yml $(CHAPTERS)
