(add-to-list 'auto-mode-alist '("\\.inl$" . c++-mode))
(add-hook 'c++-mode-hook 'irony-mode)
(add-hook 'c-mode-hook 'irony-mode)
(add-hook 'objc-mode-hook 'irony-mode)
(add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;; (optional) adds CC special commands to `company-begin-commands' in order to
;; trigger completion at interesting places, such as after scope operator
;;     std::|
(add-hook 'irony-mode-hook 'company-irony-setup-begin-commands)
(add-hook 'c++-mode-hook 'company-mode)
(add-hook 'irony-mode-hook 'eldoc-mode)
(add-hook 'irony-mode-hook 'irony-eldoc)

(setq gdb-delete-out-of-scope nil)
(defun my-gdb-many-windows ()
  (interactive)
  (setq gdb-many-windows t)
  (call-interactively 'gdb))
(defun my-gdb-in-sub ()
  (interactive)
  (e2wm:dp-code-navi-sub-command)
  (setq gdb-many-windows nil)
  (call-interactively 'gdb))


(provide 'init-cpp)
