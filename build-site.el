;; emacs config
(require 'package)
(setq package-user-dir (expand-file-name "./.packages"))
(setq package-archives '(("melpa" . "https://melpa.org/packages/")
                         ("elpa" . "https://elpa.gnu.org/packages/")))

;; init package system
(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))


;; Install dependencies :)
(package-install 'htmlize)

;; Load the publishing system
(require 'ox-publish)

;; Customize the HTML output
(setq org-html-validation-link nil              ;; Don't show validation link
      org-html-head-include-scripts nil         ;; Use own scripts
      org-html-head-include-default-style nil   ;; Use own styles 
      org-html-head "<link rel=\"stylesheet\" href=\"css/style.css\" /><link href=\"fonts/iosevka.css\" rel=\"stylesheet\"/>")

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "website-org-mode"
             :recursive t
             :base-directory "./content"
             :publishing-function 'org-html-publish-to-html
             :publishing-directory "./public"
             :with-author nil                   ;; Don't show author
             :with-creator t                    ;; Show emacs and org version
             :with-toc nil                      ;; Don't show tables of content
             :section-numbers nil               ;; No number section
             :time-stamp-file nil)))            ;; No time stamp in the file

;; Generate the site output
(org-publish-all t)

(message "Build complete!")
