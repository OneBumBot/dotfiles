;; -*- lexical-binding: t; -*-
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)
(load (expand-file-name "config.el" user-emacs-directory))
