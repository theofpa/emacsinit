(add-to-list 'load-path "~/.emacs.d/maxframe.el/")
(add-to-list 'load-path "~/.emacs.d/yasnippet-master/")
(add-to-list 'load-path "~/.emacs.d/init/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-source-correlate-method (quote synctex))
 '(TeX-source-correlate-mode t)
 '(TeX-source-correlate-start-server t)
 '(TeX-view-program-list
   (quote
	(("Okular sync" "okular --unique %o#src:%n`pwd`/./%b"))))
 '(TeX-view-program-selection (quote ((output-pdf "Okular sync"))))
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   ["#454545" "#cd5542" "#6aaf50" "#baba36" "#5180b3" "#ab75c3" "#bdbc61" "#bdbdb3"])
 '(cfs--fontsize-steps (quote (3 4 4)) t)
 '(custom-safe-themes
   (quote
	("e5b2116c396206a428c5637cba70a17b4b82930b259066326ac846e09b8a38a8" "1d3b4925028c353585101b6560644d90fc96b318b579bc6b9f87849bd72fcf6e" "79514daeac6fa1c3ff286bc8a9de61c6520437f2ab51a2d3f2cede5e0b32b8b2" "34ca0f323388ac14574d979424477481d0922c466d549b5ba53f3eef3c4c8060" "79a01b0adebeb080c85f2d18da23bf50e77cb6947757380fe1777a09f789f34c" "1a74c7271d05a4f56f45254085e30264a3c9cd44266dab0f24d170dca1792018" "73938863999dfa79ad9494dbfa418870bf7f0a2c7c5c839a35706494eb76932b" "f3e51bef1c3e55fa82c3c13ceb66bb950dce21d6d162401d0dae06bce09a71ca" "c2fb0b270522fccaf84edddb1a66e4611f56ac7aabf045e758a09c6e2daace8a" "2f6fd10633617e25fb96d222033513f2dcc285653f559c593324327d2a34f5ee" "2e28e6e2ba888bc173bea95a48ed7e944483c608eacb088d05331a46ab5ed740" "ca20bc0dc4c682c11ccfcc32a9af20b6321afc9e47a537354847ead0e8010295" "50335bb339fe40096be015622bb42990f46f45ab78b41c2269691df48ada2e61" "260bdd7453b94e58ac41abdf26dc8a0b18100cc32dfbedce9bbdfa86d8b84a05" "40cf1b2384b95f27dfb4c16e3d6c44c10db015fee9a5dfcb3b4d371c54aeb8b8" "1d4268dfd334a6cc5c15bae28e9fe677bd024ea350f3b286a845d26d1ba90e9e" "479f2bd3d7448859f61f06e82e710ee44345f509e44fa61e6fe81e565cd280b1" "16e3c08064e157a7e3310ef09edf29eb840119b6ad6c8146b8477c38b271a548" "c4294fd9f8e94ea5418e0dedb7ca307fb3ec45c3687ee695b26ad8470024c053" "c45f9cf648b2c52c9362d2b7192a0a7368ba13e1e7f130433bae74fffaa80bac" "432d077e8e5e96106fb7ba7a4bbbbd28c95a4f307fc51ed8fda00a110ae155ea" "526ef3dc87548f24d41e970f6ef9957bf63ffb25541f63d36e288925b386caa1" "55fb8c7271061752e8f9f5b18773b819d2108fa1dceca6d7d2262b8b0a8d5372" "70d83e43e0bcc3c8bd50f0b91b4b1c1c2cc13a035825a85bad444f042975adc4" "85987ca7994d67a8296ea4bfaa2a7c8c7c46c2d341776a32c022ac586887e9bf" "f60a529dc64906917aed1f7630e592f4dc9c858465a78aa30d441e1c2899de4a" "e860fdcf64f74565786a422646e061e4a99471a199b19ae8d1432d6f46d7b80f" "9c3c8c76ee295e5d92bfcf11ed6e9fd02eb7626b82d4fcbf485f42e29b69c31d" "e8c50e0283ae165e0d798b9b677c9d20a4b95fcf1405aacd574f306222d9804f" "df3297fbb02dc3bb79faf40ec65ea51a7d93b1d1e07998edad95fbc8696e7dea" "1e0d226a88d8f4f4b85417813ebeb3615fa29f5fe754ed6f3c967e952d970bf9" "777014076de0b8394923c2ccfa9e86ecfff94aae2f45ff51b94d424c6f535847" "82c6bcc362036185948f2e2d2f2879a7c30b95eedc2b7dcf082f9601799f0430" "82190afbe3b99877d2be7ef0e850c395ff35b7b4873729fbafac2a9449eca3fd" "919e03c7740d8f48592c92c5a07ff907113a03f0e3cf4790b28ec45cc63e600c" "1d1da68fe72e655b41ebc498f550259bccec2c01cd794d5eafdf2b4801df3816" "5bf35e1ef68dcf026d7b6a6919beb509d45f9aafcf1344c41c92e293ed891ee2" "a55f3153541e77ca3d3315db4d16bbaa56d87661c0b819e2f5df9bcda31a3758" "3625c04fa4b8a802e96922d2db3f48c9cb2f93526e1dc24ba0b400e4ee4ccd8a" "74278d14b7d5cf691c4d846a4bbf6e62d32104986f104c1e61f718f9669ec04b" "12b4427ae6e0eef8b870b450e59e75122d5080016a9061c9696959e50d578057" "ad950f1b1bf65682e390f3547d479fd35d8c66cafa2b8aa28179d78122faa947" "4f5bb895d88b6fe6a983e63429f154b8d939b4a8c581956493783b2515e22d6d" "870a63a25a2756074e53e5ee28f3f890332ddc21f9e87d583c5387285e882099" "680ca52e49fe887138f8328a4c9ef6b8948e8ec48f8832662ef9a33da5b0158a" "2131cb58fabbbe9aa03b7298cf8c838defeb02ca4d466ec80440f7949d7829d5" "db9944c787d31d8aa9e5684a70d4fa215681f563cfb6cf8932d5a9552392498d" "e2613836c74c5e52c470de5fef1de5aac7a9bb43081fbc15510b65ca375d4a34" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "71aac1338deba250aec21fb3a8f666569f1b0d294487600db873b2dce28378bd" "fa7aa1b77ec860cf26230fd8c07d368357fafe816f203446ad03bb248228f259" "0df77971767b97e231eb38fe11a3f9e486b4b472d7d9947aa6ff3c4bb4943214" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "df3e05e16180d77732ceab47a43f2fcdb099714c1c47e91e8089d2fcf5882ea3" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "b06aaf5cefc4043ba018ca497a9414141341cb5a2152db84a9a80020d35644d1" "94af3f550c05e9c9fa235cb686d01600ef5adbfa6edf6274696c2beab6990104" default)))
 '(fci-rule-color "#37474f")
 '(hl-sexp-background-color "#1c1f26")
 '(inhibit-startup-screen t)
 '(initial-buffer-choice nil)
 '(initial-scratch-message nil)
 '(irony-additional-clang-options (quote ("-std=c++14")))
 '(mode-require-final-newline t)
 '(paren-highlight-offscreen t)
 '(popwin:popup-window-position (quote bottom))
 '(popwin:special-display-config
   (quote
	((direx:direx-mode :width 25 :position left :dedicated t)
	 ("*Miniedit Help*" :noselect t)
	 (help-mode)
	 (completion-list-mode :noselect t)
	 (compilation-mode :noselect t)
	 (grep-mode :noselect t)
	 (occur-mode :noselect t)
	 ("*Pp Macroexpand Output*" :noselect t)
	 ("*Shell Command Output*")
	 ("*vc-diff*")
	 ("*vc-change-log*")
	 (" *undo-tree*" :width 60 :position right)
	 ("^\\*anything.*\\*$" :regexp t)
	 ("*slime-apropos*")
	 ("*slime-macroexpansion*")
	 ("*slime-description*")
	 ("*slime-compilation*" :noselect t)
	 ("*slime-xref*")
	 (sldb-mode :stick t)
	 (slime-repl-mode)
	 (slime-connection-list-mode)
	 ("*anaconda-doc*" :regexp nil))))
 '(preview-scale-function 1.5)
 '(require-final-newline nil)
 '(safe-local-variable-values (quote ((TeX-command-extra-options . "-shell-escape"))))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
	((20 . "#f36c60")
	 (40 . "#ff9800")
	 (60 . "#fff59d")
	 (80 . "#8bc34a")
	 (100 . "#81d4fa")
	 (120 . "#4dd0e1")
	 (140 . "#b39ddb")
	 (160 . "#f36c60")
	 (180 . "#ff9800")
	 (200 . "#fff59d")
	 (220 . "#8bc34a")
	 (240 . "#81d4fa")
	 (260 . "#4dd0e1")
	 (280 . "#b39ddb")
	 (300 . "#f36c60")
	 (320 . "#ff9800")
	 (340 . "#fff59d")
	 (360 . "#8bc34a"))))
 '(vc-annotate-very-old-color nil))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(powerline-active1 ((t (:inherit mode-line :background "grey22"))))
 '(powerline-active2 ((t (:inherit mode-line :background "grey34")))))


(require 'init-env)

;; Programming Modes
(require 'init-global-programming)
(require 'init-python)
(require 'init-cpp)
(require 'init-latex)
(require 'init-ess)
(require 'init-ruby)
(require 'init-markdown)
(require 'init-org)


;; Packages for General Usage
(require 'init-helm)
(require 'init-ggtags)
(require 'init-global-keys)
(require 'init-comment)
(require 'init-projectile)
(require 'init-fzf)
(require 'init-deft)
(require 'init-miscel)
