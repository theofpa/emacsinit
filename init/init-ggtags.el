(setq
 helm-gtags-path-style 'relative
 helm-gtags-ignore-case t
 helm-gtags-auto-update t
 helm-gtags-use-input-at-cursor t
 helm-gtags-pulse-at-cursor t
 ;; helm-gtags-prefix-key "\C-cg"
 ;; helm-gtags-suggested-key-mapping t
 )

;; Enable helm-gtags-mode
(add-hook 'dired-mode-hook 'helm-gtags-mode)
(add-hook 'eshell-mode-hook 'helm-gtags-mode)
(add-hook 'c-mode-hook 'helm-gtags-mode)
(add-hook 'c++-mode-hook 'helm-gtags-mode)
(add-hook 'asm-mode-hook 'helm-gtags-mode)

(eval-after-load "helm-gtags"
  '(progn
	 (define-key helm-gtags-mode-map (kbd "C-. gt") 'helm-gtags-find-tag)
	 (define-key helm-gtags-mode-map (kbd "C-. gr") 'helm-gtags-find-rtag)
	 (define-key helm-gtags-mode-map (kbd "C-. gd") 'helm-gtags-dwim)
	 (define-key helm-gtags-mode-map (kbd "C-. gs") 'helm-gtags-find-symbol)
	 (define-key helm-gtags-mode-map (kbd "C-. gP") 'helm-gtags-parse-file)
	 (define-key helm-gtags-mode-map (kbd "M-,") 'helm-gtags-pop-stack)
	 (define-key helm-gtags-mode-map (kbd "C-c <") 'helm-gtags-previous-history)
	 (define-key helm-gtags-mode-map (kbd "C-c >") 'helm-gtags-next-history)
	 (define-key helm-gtags-mode-map (kbd "C-. gU") 'helm-gtags-update-tags)
	 (define-key helm-gtags-mode-map (kbd "C-. gf") 'helm-gtags-select-path)
	 (define-key helm-gtags-mode-map (kbd "C-. gS") 'helm-gtags-show-stack)))


(provide 'init-ggtags)
