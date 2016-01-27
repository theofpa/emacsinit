(global-set-key (kbd "<escape>") 'god-local-mode)
(setq god-exempt-major-modes nil)
(setq god-exempt-predicates nil)
;; (defun my-update-cursor ()
;;   (setq cursor-type (if (or god-local-mode 0)
;;                         'box
;;                       'bar)))

(defun my-update-cursor ()
  (cond (god-local-mode (setq cursor-type 'box))
		(t (setq cursor-type 'bar)))
  )

(add-hook 'god-mode-enabled-hook 'my-update-cursor)
(add-hook 'god-mode-disabled-hook 'my-update-cursor)


(provide 'init-god)
