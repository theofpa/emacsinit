(setq deft-extensions '("org" "tex" "txt"))
(setq deft-directory "~/Dropbox/deft-notes")
(setq deft-org-mode-title-prefix t)

(defun deft-enter-close-last-window ()
  (interactive)
  (progn
	(other-window 1)
	(delete-window)
	(deft-complete)))

(defun deft-mode-local-keys ()
  (local-set-key (kbd "M-m") 'deft-enter-close-last-window))

(add-hook 'deft-mode-hook 'deft-mode-local-keys)


(provide 'init-deft)
