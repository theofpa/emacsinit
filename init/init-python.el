(setq python-shell-virtualenv-path "/home/xin/anaconda")
(setq pdb-path '/home/xin/anaconda/lib/python3.5/pdb.py
      gud-pdb-command-name (symbol-name pdb-path))

(elpy-enable)
(elpy-use-ipython)
(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-backend "jedi")
(add-hook 'python-mode-hook 'forbid-vertical-split)
(add-hook 'inferior-python-mode-hook 'company-mode)


(provide 'init-python)
