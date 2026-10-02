;; -*- lexical-binding: t; -*-

;; remove window decorations
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
 
(load-theme 'tango-dark)

;; set mini-buffer completion mode
(fido-vertical-mode)

;; set pair brackets autocomplete
(electric-pair-mode 1)

;; change where file backups are created
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
