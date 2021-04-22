all:
	emacs -Q --batch -l publish.el -f org-publish-all

force:
	emacs -Q --batch -l publish.el --eval="(org-publish-all t)"

send: clean
	ncftpput -R -f ../login.cfg . html/*

clean:
	find html -iname \*.html~ -exec rm {} \;
