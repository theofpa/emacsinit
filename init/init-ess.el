(require 'ess-site)
(setq inferior-julia-program-name "/home/xin/julia/bin/julia")

(add-hook 'ess-mode-hook 'eldoc-mode)
(setq ess-eval-visibly-p nil)
(setq ess-use-auto-complete t)
(add-to-list 'auto-mode-alist '("\\.r$" . R-mode))
(add-hook 'ess-mode-hook 'auto-complete-mode)
(add-hook 'inferior-ess-mode-hook 'auto-complete-mode)
(add-hook 'inferior-ess-mode-hook 'golden-ratio)
(add-hook 'ess-mode-hook 'forbid-vertical-split)


(provide 'init-ess)
