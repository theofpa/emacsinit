(require 'tex)
(add-to-list 'auto-mode-alist '("\\.tex$" . LaTeX-mode))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)
;; (setq LaTeX-command-style '(("" "%(PDF)%(latex) -file-line-error %S%(PDFout)")))
(setq LaTeX-verbatim-environments-local '("Verbatim" "lstlisting" "minted"))


(mapc (lambda (mode)
        (add-hook 'LaTeX-mode-hook mode))
      (list 'turn-on-reftex
            'LaTeX-math-mode
            ))
(setq reftex-plug-into-AUCTeX t)

                                        ; SyncTeX basics

                                        ; un-urlify and urlify-escape-only should be improved to handle all special characters, not only spaces.
                                        ; The fix for spaces is based on the first comment on http://emacswiki.org/emacs/AUCTeX#toc20

(defun un-urlify (fname-or-url)
  "Transform file:///absolute/path from Gnome into /absolute/path with very limited support for special characters"
  (if (string= (substring fname-or-url 0 8) "file:///")
      (url-unhex-string (substring fname-or-url 7))
    fname-or-url))

(defun urlify-escape-only (path)
  "Handle special characters for urlify"
  (replace-regexp-in-string " " "%20" path))

(defun urlify (absolute-path)
  "Transform /absolute/path to file:///absolute/path for Gnome with very limited support for special characters"
  (if (string= (substring absolute-path 0 1) "/")
      (concat "file://" (urlify-escape-only absolute-path))
    absolute-path))



(fset 'insert-twosided-brackets
      [?\{ ?\} left])
(fset 'insert-frac
      [?\\ ?f ?r ?a ?c ?\{ ?\} ?\{ ?\} left left left])
(fset 'insert-bigparentheses
      [?\\ ?l ?e ?f ?t ?\( ?\\ ?r ?i ?g ?h ?t ?\) left left left left left left left])
(fset 'insert-twosided-parentheses
      [?\( ?\) left])
(fset 'insert-emph
      [?\\ ?e ?m ?p ?h ?\{ ?\} left])
(fset 'insert-math-mode
      [?\\ ?\[ ?\\ ?\] left left])
(fset 'insert-exponent
      [?^ ?\{ ?\} left])
(fset 'insert-little-math-mode
      [?$ ?$ left])
(fset 'insert-begin-document
      [?\\ ?b ?e ?g ?i ?n ?\{ ?d ?o ?c ?u ?m ?e ?n ?t ?\} return return return ?\\ ?e ?n ?d ?\{ ?d ?o ?c ?u ?m ?e ?n ?t ?\} up up])
(fset 'insert-subscript
      [?_ ?\{ ?\} left])
(fset 'long-comment-mark
      "%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%")
(fset 'insert-mbox
      [?\\ ?m ?b ?o ?x ?\{ ?\} left])
(fset 'insert-\\infty
      "\\infty")
(fset 'insert-\\partial
      "\\partial")
(fset 'insert-\\numberthis
      "\\numberthis\\label{}\C-b")
(fset 'insert-\\rightarrow
      "\\rightarrow")
(fset 'insert-qquad-mbox
      "\\qquad\\mbox{}\\qquad\C-b\C-b\C-b\C-b\C-b\C-b\C-b")
(fset 'insert-qquad
      "\\qquad ")
(fset 'insert-textbf
      "\\textbf{}\C-b")
(fset 'insert-texttr
      "\\texttr{}\C-b")
(fset 'insert-backslash
      "\\")
(fset 'insert-bigbrackets
      [?\\ ?l ?e ?f ?t ?\[ ?\\ ?r ?i ?g ?h ?t ?\] left left left left left left left])
                                        ;(fset 'insert-bigbraces
                                        ;   [?\\ ?l ?e ?f ?t ?\\ ?\{ "\{" ?\\ ?r ?i ?g ?h ?t ?\\ ?\} left left left left left left left left])
(fset 'insert-bigbraces
      "\\left\\{\\right\C-b\C-b\C-b\C-b\C-b\C-b")
(fset 'insert-textit
      [?\\ ?t ?e ?x ?t ?i ?t ?\{ ?\} left])
(fset 'insert-text
      [?\\ ?t ?e ?x ?t ?\{ ?\} left])
(fset 'insert-documentclass
      [?\\ ?d ?o ?c ?u ?m ?e ?n ?t ?c ?l ?a ?s ?s ?\{ ?\} left])
(fset 'insert-documentclassxin
      [?\\ ?d ?o ?c ?u ?m ?e ?n ?t ?c ?l ?a ?s ?s ?\{ ?\} left ?x ?i ?n ?-])

(defun my-LaTeX-keys ()
  (local-set-key (kbd "C-{") 'insert-twosided-brackets)
  (local-set-key (kbd "C-, f") 'insert-frac)
  (local-set-key (kbd "C-, C-p") 'insert-bigparentheses)
  (local-set-key (kbd "C-, e") 'insert-emph)
  (local-set-key (kbd "C-, [") 'insert-math-mode)
  (local-set-key (kbd "C-, b") 'insert-begin-document)
  (local-set-key (kbd "C-(") 'insert-twosided-parentheses)
  (local-set-key (kbd "C-, ,") 'insert-exponent)
  (local-set-key (kbd "C-$") 'insert-little-math-mode)
  (local-set-key (kbd "C-, .") 'insert-subscript)
  (local-set-key (kbd "C-, %") 'long-comment-mark)
  (local-set-key (kbd "C-, m") 'insert-mbox)
  (local-set-key (kbd "C-, i") 'insert-\\infty)
  (local-set-key (kbd "C-, p") 'insert-\\partial)
  (local-set-key (kbd "C-, C-n") 'insert-\\numberthis)
  (local-set-key (kbd "C-, r") 'insert-\\rightarrow)
  (local-set-key (kbd "C-, C-m") 'insert-qquad-mbox)
  (local-set-key (kbd "C-, q") 'insert-qquad)
  (local-set-key (kbd "C-, t") 'insert-textbf)
  (local-set-key (kbd "C-, C-r") 'insert-texttr)
  (local-set-key (kbd "C-, C-b") 'insert-bigbrackets)
  (local-set-key (kbd "C-. C-b") 'insert-bigbraces)
  (local-set-key (kbd "C-, C-i") 'insert-textit)
  (local-set-key (kbd "C-, C-t") 'insert-text)
  (local-set-key (kbd "C-. C-d") 'insert-documentclass)
  (local-set-key (kbd "C-. d") 'insert-documentclassxin)
)

(add-hook 'LaTeX-mode-hook 'my-LaTeX-keys)

(defun demolish-tex-help ()
  (interactive)
  (if (get-buffer "*TeX Help*") ;; Tests if the buffer exists
      (progn ;; Do the following commands in sequence
        (if (get-buffer-window (get-buffer "*TeX Help*")) ;; Tests if the window exists
            (delete-window (get-buffer-window (get-buffer "*TeX Help*")))
          ) ;; That should close the window
        (kill-buffer "*TeX Help*") ;; This should kill the buffer
        )
    )
  )
(defun run-latexmk ()
  (interactive)
  (let ((TeX-save-query nil)
        (TeX-process-asynchronous nil)
        (master-file (TeX-master-file)))
    (TeX-save-document "")
    (TeX-run-TeX "latexmk"
                                        ;(TeX-command-expand "latexmk %t" 'TeX-master-file)
                 (TeX-command-expand "latexmk -pdflatex='pdflatex -file-line-error' -pdf %s" 'TeX-master-file)
                 master-file)
    (if (plist-get TeX-error-report-switches (intern master-file))
        (TeX-next-error t)
      (progn
        (demolish-tex-help)
        (minibuffer-message "latexmk done")))))

(add-hook 'LaTeX-mode-hook
          (lambda () (local-set-key (kbd "C-, C-,") #'run-latexmk)))

(defun run-latex ()
  (interactive)
  (let ((process (TeX-active-process))) (if process (delete-process process)))
  (let ((TeX-save-query nil)) (TeX-save-document ""))
  (TeX-command-menu "LaTeX")
  (demolish-tex-help))
(add-hook 'LaTeX-mode-hook (lambda () (local-set-key (kbd "C-, C-c") #'run-latex)))


(provide 'init-latex)
