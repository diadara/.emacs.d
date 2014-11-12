;;; init-jedi.el

;;;Code:

(add-hook 'inferior-python-mode-hook (lambda () (linum-mode -1)))
(setq
 ;; python-shell-extra-pythonpaths
 ;; "/home/diadara/projects/linkaggrigator/"
 python-shell-interpreter "ipython"
 python-shell-interpreter-args ""
 python-shell-prompt-regexp "In \\[[0-9]+\\]: "
 python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
 python-shell-completion-setup-code
   "from IPython.core.completerlib import module_completion"
 python-shell-completion-module-string-code
   "';'.join(module_completion('''%s'''))\n"
 python-shell-completion-string-code
   "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
 python-shell-virtualenv-path
 "/home/bidgely/.virtualenvs/hoard/")

(defun setup-python()
  (interactive)
  (setq-default indent-tabs-mode nil)
  (setq-default tab-width 4)
  
  (smartparens-mode 1)
  (auto-complete-mode 1)
  (setq jedi:complete-on-dot t)
  (setq jedi:setup-keys t)
  (require 'jedi)
  (setq jedi:server-command
        (list "/usr/bin/python" jedi:server-script))
  (setq jedi:server-args
        '(
                                        ;"--virtual-env" "/home/diadara/.virtualenvs/django"
                                        ;"--virtual-env" "/home/diadara/.virtualenvs/notesapp"
          "--virtual-env" "/home/bidgely/.virtualenvs/ebay/"

          ))

  (jedi:setup))

(add-hook 'python-mode-hook 'setup-python)
(provide 'init-jedi)
;;; init-jedi.el ends here
