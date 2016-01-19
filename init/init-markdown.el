(autoload 'markdown-mode "markdown-mode"
  "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.text\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . markdown-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

(fset 'list-insert-br-and-two-nbsp
   "<br />\C-jnbsp;nbsp;")
(fset 'list-insert-nbsp
   "nbsp;")
(fset 'list-insert-br
   "<br />")

(defun my-markdown-keys ()
  (local-set-key (kbd "C-, C-b") 'list-insert-br-and-two-nbsp)
  (local-set-key (kbd "C-, n") 'list-insert-nbsp)
  (local-set-key (kbd "C-, b") 'list-insert-br))

(add-hook 'markdown-mode-hook 'my-markdown-keys)


(provide 'init-markdown)
