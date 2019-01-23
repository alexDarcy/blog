login_file="../login.cfg"

#STACK=~/.local/bin/stack
STACK=stack

all: generate mng deploy

biblio:
	wget http://www.citeulike.org/bibtex/user/AlexisPraga -O bibliography/history.bib

generate: build picture notes

build:
	${STACK} exec blog build

MED=notes/medecine
NOTES_ORG= \
${MED}/douleur.org\
${MED}/hge.org\
${MED}/endocrino.org\
${MED}/ophtalmo.org

# Some note are still in latex
NOTES_TEX= \
${MED}/afgsu.tex\
${MED}/maladies_infectieuses.tex\
${MED}/nutrition.tex\
${MED}/pneumologie.tex\
${MED}/neurologie.tex\
$(NOTES_ORG:.org=.tex)

NOTES_PDF=$(NOTES_TEX:.tex=.pdf) 

.PHONY: notes
.PHONY: ${NOTES_TEX} 
notes: ${NOTES_PDF} 
	mkdir -p _site/notes/medecine
	cp $^ _site/notes/medecine

notes/medecine/%.pdf: notes/medecine/%.tex
	latexmk -pdf -lualatex -cd $<

${MED}/%.tex: ${MED}/%.org
	emacs -u "$(id -un)" --batch $< --eval '(load user-init-file)' -f org-latex-export-to-latex

debug: generate update

# Update the current tab in firefox (hopefully the web page)
# Require xdotool
update:
	WID=`xdotool search --name "Mozilla Firefox" | head -1` ; xdotool windowactivate $$WID ; xdotool key F5

mng:
	mng export movie -o _site/misc
	mng export comic -o _site/misc

# -z flags avoid to upload identical files !
deploy: 
	ncftpput -z -f ${login_file} -R . _site/*

PICS_TEX=$(wildcard pictures/medecine/*.tex)
PICS=$(PICS_TEX:.tex=.svg) pictures/medecine/148_antibio.svg

picture:${PICS}

# Non-recursive rules for pictures
pictures/medecine/%.svg: pictures/medecine/%.pdf
	pdftocairo -svg $< $@
	#convert -background white $< $@

pictures/medecine/%.pdf: pictures/medecine/%.tex
	lualatex --output-directory=pictures/medecine $< 
