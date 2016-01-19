(defun my-cc-init-hook ()
  "Initialization hook for CC-mode runs before any other hooks."
  (setq c-doc-comment-style
    '((java-mode . javadoc)
      (pike-mode . autodoc)
      (c-mode    . javadoc)
      (c++-mode  . javadoc)))
  )

(add-hook 'c++-mode-hook 'my-cc-init-hook)

;; Make fill-paragraph compatible with doxygen/Javadoc comments
(setq paragraph-start "^\\s-*\\#\\s-*\\\\\\(arg\\|ret\\).*$")


(provide 'init-comment)
