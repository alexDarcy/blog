;;; Publish: --- configure the blog for publishing with emacs
;;; Commentary:

;; load org
(require 'org)
;; load org export functions
(require 'ox-publish)
(require 'ox-html)

(setq user-full-name "Alexis Praga")
;; Thanks to https://www.john2x.com/blog/blogging-with-orgmode.html
(defun my-org-html-postamble (plist)
  (concat "<hr>"
          (format "<p class=\"date\">Created: %s, " (car (plist-get plist ':date)))
          (format "last modified: %s</p>" (format-time-string "%Y-%m-%d"))
          (format "<p class=\"author\">Author: %s</p>" (car (plist-get plist ':author)))
          (format "<p>Generated by %s</p>" (plist-get plist ':creator))))
(setq org-html-postamble 'my-org-html-postamble)

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
         :with-author "AlexisPraga"
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
        )))
(provide 'publish)
