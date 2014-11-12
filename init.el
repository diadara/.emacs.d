;;; init.el -- this is run first
;;; Nithin Saji
;;; Commentary:
;;; Organize everything once you get some  time.
;;;
;;; Code


;;; emacs daemon
(setq server-use-tcp t)
(require 'server)
(unless (server-running-p) (server-start))


;;; Package Management
(add-to-list 'load-path "~/.emacs.d/lisp/")

(require 'cl)
(require 'package)
(require 'elpa-packages)
(setq package-archives '(("org" . "http://orgmode.org/elpa/")
("gnu" . "http://elpa.gnu.org/packages/")
("marmalade" . "http://marmalade-repo.org/packages/")
("melpa" . "http://melpa.milkbox.net/packages/")))
(package-initialize)


(defun diadara/packages-installed-p ()
(loop for pkg in diadara/packages
when (not (package-installed-p pkg)) do (return nil)
finally (return t)))


(unless (diadara/packages-installed-p)
(message "%s" "Refreshing package database...")
(package-refresh-contents)
(dolist (pkg diadara/packages)
(when (not (package-installed-p pkg))
  (package-install pkg))))


(require 'sane-defaults)
(require 'lambda-font)
(require 'guru-mode)
(require 'projectile)
(require 'ido-vertical-mode)
(ido-vertical-mode t)


;;;smex
(setq smex-save-file (expand-file-name ".smex-items" user-emacs-directory))
(smex-initialize)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)

;;;Custome shit

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file)


;;; editing tricks
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c C->") 'mc/skip-to-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-S-<mouse-1>") 'mc/add-cursor-on-click)
(global-set-key  (kbd "C-`") 'er/expand-region)

(projectile-global-mode t)
(guru-mode t)

;;; guide-key.el
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x" "C-c" "C-r" "C-t" "C-v"))
(setq guide-key/text-scale-amount '-1)
(setq guide-key/recursive-key-sequence-flag t)
(setq guide-key/popup-window-position 'bottom)
(guide-key-mode t)

(require 'wrap-region)
(wrap-region-mode t)
