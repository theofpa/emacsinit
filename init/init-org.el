(use-package org-bullets
:ensure t
:init
(setq org-bullets-bullet-list
'("✸" "▶" "◉" "★" "○" "◇"))
:config
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))

(setq org-log-done 'time)
;; The following lines are always needed.  Choose your own keys.
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; (setq org-html-htmlize-output-type 'inline-css) ;; default
(setq org-html-htmlize-output-type 'css)
;; (setq org-html-htmlize-font-prefix "") ;; default
(setq org-html-htmlize-font-prefix "org-")

(add-to-list 'load-path "~/Dropbox/org/")


(load-library "org-global-todo")
(setq org-todo-keywords
      '((sequence "TODO(t)" "|" "DONE(d)")
		(sequence "|" "RESCHEDULED(r)" "CANCELED(c)")))
(setq org-startup-indented t)
(setq org-html-postamble nil)
(setq org-list-allow-alphabetical t)
(setq org-tags-column 110)
(setq org-agenda-tags-column 120)

;; a TODO entry automatically changes to DONE when all children are done
(defun org-summary-todo (n-done n-not-done)
  "Switch entry to DONE when all subentries are done, to TODO otherwise."
  (let (org-log-done org-log-states)   ; turn off logging
	(org-todo (if (= n-not-done 0) "DONE" "TODO"))))

(add-hook 'org-after-todo-statistics-hook 'org-summary-todo)

(setq org-columns-default-format
      "%3PRIORITY %ITEM %CATEGORY %TAGS %DEADLINE %SCHEDULED")

;; (org-babel-load-file "org-ref.org")

(add-to-list 'load-path "/home/xin/.emacs.d/calfw/")
(require 'calfw)
(require 'calfw-org)


(provide 'init-org)
