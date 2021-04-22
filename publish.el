;;; Publish: --- configure the blog for publishing with emacs
;;; Commentary:

;; load org
(require 'org)
;; load org export functions
(require 'ox-publish)
(require 'ox-html)

;;; Code:
(setq org-html-html5-fancy t
      org-html-doctype "html5")

;; ;; org-html-head blog-html-head);; Can't set it in org-publish-project-alist...
(setq org-publish-project-alist
      '(
        ("blog"
         :base-directory "~/projects/blog/"
         :base-extension "org"
         :publishing-directory "~/projects/blog/html/"
         :recursive t
         :with-toc nil
         :exclude "notes"
         ;; Custom CSS
         :html-style nil
         :html5-fancy nil
         ;; Ugly but I can't make variables works
         :html-head "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
<link href=\"https://taopeng.me/org-notes-style/css/notes.css\" rel=\"stylesheet\" type=\"text/css\" />"
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-sitemap t
        )))
(provide 'publish)
