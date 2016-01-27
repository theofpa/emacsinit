(defun indent-whole-buffer ()
  "indent whole buffer"
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
(untabify (point-min) (point-max)))
(defun indent-current-paragraph ()
  "indent current paragraph"
  (interactive)
  (save-excursion
    ;; lisp code here involving moving cursor, mark, changing buffer.
    (delete-trailing-whitespace)
    (mark-paragraph)
    (indent-region (region-beginning) (region-end) nil)))
(defun quick-revert-buffer ()
  (interactive)
  (revert-buffer t t t)
  (message "buffer is reverted"))

(defun copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring"
  (interactive "p")
  (kill-ring-save (line-beginning-position)
                  (line-beginning-position (+ 1 arg)))
  (message "%d line%s copied" arg (if (= 1 arg) "" "s")))
(defun quick-copy-line ()
  "Copy the whole line that point is on and move to the beginning of the next line.
    Consecutive calls to this command append each line to the
    kill-ring."
  (interactive)
  (let ((beg (line-beginning-position 1))
        (end (line-end-position 1)))
    (if (eq last-command 'quick-copy-line)
        (kill-append (buffer-substring beg end) (< end beg))
      (kill-new (buffer-substring beg end))))
  (message "current line copied")
  ; (beginning-of-line 1)
  )

(defun toggle-window-split ()
  (interactive)
  (if (= (count-windows) 2)
      (let* ((this-win-buffer (window-buffer))
	     (next-win-buffer (window-buffer (next-window)))
	     (this-win-edges (window-edges (selected-window)))
	     (next-win-edges (window-edges (next-window)))
	     (this-win-2nd (not (and (<= (car this-win-edges)
					 (car next-win-edges))
				     (<= (cadr this-win-edges)
					 (cadr next-win-edges)))))
	     (splitter
	      (if (= (car this-win-edges)
		     (car (window-edges (next-window))))
		  'split-window-horizontally
		'split-window-vertically)))
	(delete-other-windows)
	(let ((first-win (selected-window)))
	  (funcall splitter)
	  (if this-win-2nd (other-window 1))
	  (set-window-buffer (selected-window) this-win-buffer)
	  (set-window-buffer (next-window) next-win-buffer)
	  (select-window first-win)
	  (if this-win-2nd (other-window 1))))))

(fset 'insert-grouping-brackets
   [?\{ ?\C-j ?\C-j tab ?\C-p tab])


;; better approach to bind keys - use a minor-mode
(defvar my-keys-minor-mode-map (make-keymap) "my-keys-minor-mode keymap.")
 
(define-key my-keys-minor-mode-map (kbd "C-c l") 'quick-copy-line)
(define-key my-keys-minor-mode-map (kbd "C-, C-/") 'indent-whole-buffer)
(define-key my-keys-minor-mode-map (kbd "C-c ;") 'comment-or-uncomment-region)
(define-key my-keys-minor-mode-map (kbd "C-?") 'help-command)
(define-key my-keys-minor-mode-map (kbd "M-?") 'mark-paragraph)
;(define-key my-keys-minor-mode-map (kbd "C-h") 'delete-backward-char)
(define-key my-keys-minor-mode-map (kbd "M-h") 'backward-kill-word)
;(define-key my-keys-minor-mode-map (kbd "C-, SPC") 'just-one-space)
(define-key my-keys-minor-mode-map (kbd "M-y") 'helm-show-kill-ring)
(define-key my-keys-minor-mode-map (kbd "C-. i") 'helm-imenu)
(define-key my-keys-minor-mode-map (kbd "C-. n") 'neotree-toggle)
(define-key my-keys-minor-mode-map (kbd "C-x C-f") 'helm-find-files)
(define-key my-keys-minor-mode-map (kbd "C-. /") 'indent-region)
(define-key my-keys-minor-mode-map (kbd "C-. C-/") 'indent-current-paragraph)
(define-key my-keys-minor-mode-map (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
(define-key my-keys-minor-mode-map (kbd "C-+") 'e2wm:start-management)
(define-key my-keys-minor-mode-map (kbd "C-_") 'e2wm:stop-management)
(define-key my-keys-minor-mode-map (kbd "C-c C-, m") 'e2wm:dp-code-navi-main-command)
(define-key my-keys-minor-mode-map (kbd "C-c C-, f") 'e2wm:dp-code-navi-files-command)
(define-key my-keys-minor-mode-map (kbd "C-c C-, i") 'e2wm:dp-code-navi-imenu-command)
(define-key my-keys-minor-mode-map (kbd "C-c C-, s") 'e2wm:dp-code-navi-sub-command)
(define-key my-keys-minor-mode-map (kbd "C-c C-, h") 'e2wm:dp-code-navi-history-command)
(define-key my-keys-minor-mode-map (kbd "C-c C-, l") 'e2wm:dp-code-navi-left-command)
(define-key my-keys-minor-mode-map (kbd "C-c C-, r") 'e2wm:dp-code-navi-right-command)
(define-key my-keys-minor-mode-map (kbd "C-c C-, k") 'e2wm:dp-code-sub-toggle-command)
(define-key my-keys-minor-mode-map (kbd "C-, '") 'comment-dwim)
(define-key my-keys-minor-mode-map (kbd "C-, {") 'insert-grouping-brackets)
(define-key my-keys-minor-mode-map (kbd "C-c C-r") 'quick-revert-buffer)
(define-key my-keys-minor-mode-map (kbd "C-. C-a") 'indent-rigidly-left-to-tab-stop)
(define-key my-keys-minor-mode-map (kbd "C-. o") 'switch-window)
(define-key my-keys-minor-mode-map (kbd "C-. C-g") 'golden-ratio)
(define-key my-keys-minor-mode-map (kbd "C-, C-o") 'delete-trailing-whitespace)
(define-key my-keys-minor-mode-map (kbd "C-, l") 'ace-jump-line-mode)
(define-key my-keys-minor-mode-map (kbd "C-. C-s") 'swiper-helm)
(define-key my-keys-minor-mode-map (kbd "C-s") 'helm-swoop-without-pre-input)
(define-key my-keys-minor-mode-map (kbd "M-o") 'ace-window)
(define-key my-keys-minor-mode-map (kbd "C-x C-r") 'helm-recentf)
(define-key my-keys-minor-mode-map (kbd "C-c u") 'undo-tree-visualize)
(define-key my-keys-minor-mode-map (kbd "C-. ww") 'which-key-show-top-level)
(define-key my-keys-minor-mode-map (kbd "C-. wa") 'which-key-abort)
(define-key my-keys-minor-mode-map (kbd "C-. c") 'cfw:open-org-calendar)
(define-key my-keys-minor-mode-map (kbd "C-, m") 'helm-global-mark-ring)
(define-key my-keys-minor-mode-map (kbd "C-. k") 'kill-this-buffer)
(define-key my-keys-minor-mode-map (kbd "C-c C-q") 'quit-window)
(define-key my-keys-minor-mode-map (kbd "C-. d") 'deft)
(define-key my-keys-minor-mode-map (kbd "C-. 4") 'toggle-window-split)
(define-key my-keys-minor-mode-map (kbd "C-. 2") (lambda () (interactive)(split-window-vertically) (other-window 1)))
(define-key my-keys-minor-mode-map (kbd "C-. 3") (lambda () (interactive)(split-window-horizontally) (other-window 1)))


(define-minor-mode my-keys-minor-mode
  "A minor mode so that my key settings override annoying major modes."
  t " my-keys" 'my-keys-minor-mode-map)

(defadvice load (after give-my-keybindings-priority)
  "Try to ensure that my keybindings always have priority."
  (if (not (eq (car (car minor-mode-map-alist)) 'my-keys-minor-mode))
      (let ((mykeys (assq 'my-keys-minor-mode minor-mode-map-alist)))
        (assq-delete-all 'my-keys-minor-mode minor-mode-map-alist)
        (add-to-list 'minor-mode-map-alist mykeys))))
(ad-activate 'load)

(my-keys-minor-mode 1)

(put 'dired-find-alternate-file 'disabled nil)

(defun py-save-all-and-compile ()
  (interactive)
  (save-some-buffers 1)
  (py-execute-buffer))
(defun my-python-keys ()
  (local-set-key (kbd "C-, C-c") 'py-save-all-and-compile)
  (local-set-key (kbd "C-c C-s") 'py-switch-to-python)
  )
(add-hook 'python-mode-hook 'my-python-keys)


(provide 'init-global-keys)
