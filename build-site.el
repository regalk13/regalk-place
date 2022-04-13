;; Load the publishing system
(require 'ox-publish)

;; Define the publishing project
(setq org-publish-project-alist
      (list
       (list "website-org-mode"
             :recursive t
             :base-directory "./content"
             :publishing-directory "./public"
             :publishing-function 'org-html-publish-to-html
             :with-author nil
             :with-creator t
             :with-toc nil
             :section-numbers nil
             :time-stamp-file nil)))

;; Generate the site output
(org-publish-all t)

(message "Build complete!")
