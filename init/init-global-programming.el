;; Affect multiple programming modes

;;--------------------------------------------------------------------------------------------------------------------------------------------
;; ---- BEGIN YASNIPPET ----------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------

(require 'yasnippet)
(setq yas-snippet-dirs
      '("~/.emacs.d/yasnippet-master/snippets"
		))
(yas-global-mode 1)

;;--------------------------------------------------------------------------------------------------------------------------------------------
;; ---- END YASNIPPET ------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------


;;--------------------------------------------------------------------------------------------------------------------------------------------
;; ---- BEGIN FLYCHECK -----------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------

(add-hook 'c++-mode-hook #'flycheck-mode)
(eval-after-load 'flycheck
  '(add-hook 'flycheck-mode-hook #'flycheck-irony-setup))

;;--------------------------------------------------------------------------------------------------------------------------------------------
;; ---- END FLYCHECK -------------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------


;;--------------------------------------------------------------------------------------------------------------------------------------------
;; ---- BEGIN AUTO-COMPLETE ------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------

(require 'auto-complete)
(setq ad-redefinition-action 'accept)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(eval-after-load "auto-complete"
  '(setq ac-modes (append '(sage-shell-mode sage-shell:sage-mode) ac-modes)))
(add-hook 'sage-shell:sage-mode-hook 'ac-sage-setup)
(add-hook 'sage-shell-mode-hook 'ac-sage-setup)
(add-hook 'sage-shell:sage-mode-hook 'auto-complete-mode)
(add-hook 'sage-shell-mode-hook 'auto-complete-mode)
(add-hook 'emacs-lisp-mode-hook 'auto-complete-mode)
(add-hook 'LaTeX-mode-hook 'auto-complete-mode)
(define-key ac-completing-map [return] nil)
(define-key ac-completing-map "\r" nil)
(define-key ac-mode-map (kbd "M-;") 'auto-complete)
(define-key ac-mode-map (kbd "M-'") 'ac-complete)
(setq ac-auto-start nil)

;;--------------------------------------------------------------------------------------------------------------------------------------------
;; ---- END AUTO-COMPLETE --------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------


;;--------------------------------------------------------------------------------------------------------------------------------------------
;; ---- BEGIN COMPANY-MODE -------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------

(eval-after-load 'company
  (progn					;'(add-to-list 'company-backends 'company-anaconda)
    '(push 'company-robe company-backends)
  ))
(defun my-company-setting ()
  (local-set-key (kbd "M-;") 'company-complete-common)
  (local-set-key (kbd "M-'") 'company-complete-selection))
(add-hook 'company-mode-hook 'my-company-setting)

;;--------------------------------------------------------------------------------------------------------------------------------------------
;; ---- END COMPANY-MODE ---------------------------------------------------------------------------------------------------------------------
;;--------------------------------------------------------------------------------------------------------------------------------------------


(provide 'init-global-programming)
