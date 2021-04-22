;;; Publish: --- configure the blog for publishing with emacs
;;; Commentary:

;; load org
(require 'org)
;; load org export functions
(require 'ox-publish)
(require 'ox-html)

;; Does not work
(setq org-html-postamble-format
      "<p class=\"author\">Author: %a (%e)</p>
<p class=\"date\">Last updated: %C</p>
<p class=\"date\">Created: %d</p>
<p class=\"validation\">%v</p>")

;; This works but we need more info
;; (defun my-org-html-postamble (plist)
 ;; (format "Last update : %s" (format-time-string "%d %b %Y")))
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
         :with-author "Alexis Praga"
         :with-creator nil
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
         :sitemap-filename "index.org"
        )))
(provide 'publish)
