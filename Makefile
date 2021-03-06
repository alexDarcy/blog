all: build send

build:
	emacs -Q --batch -l publish.el -f org-publish-all

force:
	emacs -Q --batch -l publish.el --eval="(org-publish-all t)"

send: clean
	ncftpput -z -R -f ../login.cfg . html/*

clean:
	find html -iname \*.html~ -exec rm {} \;
	rsync -avz files html/
