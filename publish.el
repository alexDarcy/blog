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

(defun custom-preamble (plist)
  "<nav>
<a href='/index.html'>Home</a> ---
<a href='/about.html'>About</a></li>
</nav>")

;; ;; org-html-head blog-html-head);; Can't set it in org-publish-project-alist...
(setq org-publish-project-alist
      '(
        ("pages"
         :base-directory "~/projects/blog/"
         :base-extension "org"
         :publishing-directory "~/projects/blog/html/"
         :recursive t
         :with-toc nil
         :with-author "AlexisPraga"
         ;; Skip org roam files in notes (but not in notes/reviez). They start with 14 digits
         :exclude "notes/\\([[:digit:]]\\)\\{14\\}.*.org"
         ;; Custom CSS
         :style-default nil ;; No other css
         :html-head-include-scripts nil ;; No other css (both must be set)
         ;; Ugly but I can't make variables works
         :html-head "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\">
<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">
<link href=\"https://taopeng.me/org-notes-style/css/notes.css\" rel=\"stylesheet\" type=\"text/css\" />"
         ;; end of custom css
         :html-preamble custom-preamble
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
        )
        ;; Static files
        ("files"
         :base-directory "~/projects/blog/files/"
         :base-extension "pdf\\|\\|png\\|jpg\\|mp4\\|tar.gz\\|jar\\|java"
         :publishing-directory "~/html/"
         :recursive t
         :publishing-function org-publish-attachment
         )
        ("blog" :components ("pages" "files"))
        ))
(provide 'publish)
