(add-hook 'c++-mode-hook 'projectile-mode)
(setq projectile-completion-system 'helm)
(setq projectile-keymap-prefix (kbd "C-. p"))

(provide 'init-projectile)
