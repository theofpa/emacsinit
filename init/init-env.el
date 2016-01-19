(require 'package)
(add-to-list 'package-archives '("marmalade"
                                 . "http://marmalade-repo.org/packages/"))
(add-to-list 'package-archives '("melpa"
                                 . "http://melpa.milkbox.net/packages/"))

(setq default-cursor-type 'bar)
(package-initialize)
(global-linum-mode t)


(require 'popwin)
(popwin-mode 1)

(push '(direx:direx-mode :position left :width 25 :dedicated t)
      popwin:special-display-config)


(setq default-frame-alist '((cursor-color . "Gold")))
(add-to-list 'default-frame-alist
             '(font . "-adobe-Source Code Pro-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1"))


(toggle-frame-maximized)
(setq initial-major-mode 'text-mode)
(setq visible-bell t)
(setq split-width-threshold nil)
(scroll-bar-mode 0)
(menu-bar-mode 0)
(tool-bar-mode 0)
(electric-indent-mode 0)
(setq default-tab-width 4)
(setq c-basic-offset 4)
(setq-default fill-column 85)
(setq user-full-name "Xin Jin")
(setq user-mail-address "xjin@rbox.me")

(setq utf-translate-cjk-mode nil) ; disable CJK coding/encoding (Chinese/Japanese/Korean characters)
(set-language-environment 'utf-8)
(set-keyboard-coding-system 'utf-8-unix) ; For old Carbon emacs on OS X only
(setq locale-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(unless (eq system-type 'windows-nt)
  (set-selection-coding-system 'utf-8))
(prefer-coding-system 'utf-8)

(defun forbid-vertical-split ()
  "Only permit horizontal window splits."
  (setq-local split-height-threshold nil)
  (setq-local split-width-threshold 0))


(defun toggle-fullscreen (&optional f)
  (interactive)
  (let ((current-value (frame-parameter nil 'fullscreen)))
    (set-frame-parameter nil 'fullscreen
                         (if (equal 'fullboth current-value)
                             (if (boundp 'old-fullscreen) old-fullscreen nil)
                           (progn (setq old-fullscreen current-value)
                                  'fullboth)))))
(global-set-key [f11] 'toggle-fullscreen)
(global-set-key [f10] 'toggle-menu-bar-mode-from-frame)
(global-set-key [f9] 'toggle-tool-bar-mode-from-frame)
(global-set-key (kbd "C-<tab>") 'next-buffer)
(global-set-key (kbd "s-<tab>") 'previous-buffer)
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)


;; Enable Transparency
(set-frame-parameter (selected-frame) 'alpha '(85 50))
(add-to-list 'default-frame-alist '(alpha 100 100))
(eval-when-compile (require 'cl))
(defun toggle-transparency ()
  (interactive)
  (if (/=
       (cadr (frame-parameter nil 'alpha))
       100)
      (set-frame-parameter nil 'alpha '(100 100))
    (set-frame-parameter nil 'alpha '(80 50))))
(global-set-key (kbd "C-c t") 'toggle-transparency)


(set-face-attribute 'default nil :height 120)
(load-theme 'xin-cyber t)


(provide 'init-env)
