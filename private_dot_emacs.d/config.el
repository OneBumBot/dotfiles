;; -*- lexical-binding: t; -*-
;; (load (expand-file-name "config.el" user-emacs-directory))

;; ---------------------------------------------------------------------------
;; Пакеты
;; ---------------------------------------------------------------------------
(require 'package)
(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

(require 'use-package)
(setq use-package-always-ensure t)

;; remove window decorations
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(load-theme 'tango-dark)

;; set mini-buffer completion mode
(fido-vertical-mode)

;; set pair brackets autocomplete
(electric-pair-mode 1)

(delete-selection-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(recentf-mode 1)
(winner-mode 1)
(repeat-mode 1)
(global-auto-revert-mode 1)
(display-time-mode 1)
(display-battery-mode 1)

(keymap-global-set "C-x C-b" #'ibuffer)


;; backups
(setq auto-save-default nil
      backup-directory-alist
      `(("." . ,(expand-file-name "backups/" user-emacs-directory)))
      backup-by-copying t
      version-control t
      kept-new-versions 5
      kept-old-versions 2
      delete-old-versions t
      create-lockfiles nil)

(setq completion-auto-help nil ;; disable minibuffera completion
      ring-bell-function #'ignore
      history-length 10000)

(setq inhibit-startup-screen t  initial-scratch-message "")

(set-face-attribute 'default nil :height 140)
(set-face-attribute 'variable-pitch nil :height 1.2)

(add-to-list 'default-frame-alist '(font . "FiraCode Nerd Font-14"))

;; ---------------------------------------------------------------------------
;; PATH: rustup/cargo и pipx/uv лежат в домашней папке
;; ---------------------------------------------------------------------------
(dolist (dir (list (expand-file-name "~/.cargo/bin")
                   (expand-file-name "~/.local/bin")))
  (when (file-directory-p dir)
    (add-to-list 'exec-path dir)
    (setenv "PATH" (concat dir path-separator (getenv "PATH")))))

;; ---------------------------------------------------------------------------
;; Общие настройки для кода
;; ---------------------------------------------------------------------------
(setq-default indent-tabs-mode nil
              tab-width 4
              fill-column 80)

(column-number-mode 1)
(show-paren-mode 1)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)
(add-hook 'compilation-filter-hook #'ansi-osc-compilation-filter)

;; ---------------------------------------------------------------------------
;; Dired
;; ---------------------------------------------------------------------------

(setq dired-kill-when-opening-new-dired-buffer t
      dired-listing-switches "-alh"
      dired-dwim-target t)


;; ---------------------------------------------------------------------------
;; LSP: Eglot (встроен в Emacs 29+)
;; ---------------------------------------------------------------------------
(use-package eglot
  :ensure nil
  :hook ((rust-mode   . eglot-ensure)
         (python-mode . eglot-ensure))
  :bind (:map eglot-mode-map
              ("C-c r" . eglot-rename)
              ("C-c a" . eglot-code-actions)
              ("C-c f" . eglot-format)
              ("C-c h" . eldoc))
  :custom
  (eglot-autoshutdown t)
  (eglot-events-buffer-size 0)
  :config
  ;; Python: ty от Astral (uv tool install ty / pipx install ty)
  (add-to-list 'eglot-server-programs
               '(python-mode . ("ty" "server")))
  ;; Rust: rust-analyzer, проверка через clippy
  (setq-default eglot-workspace-configuration
                '(:rust-analyzer (:check (:command "clippy")))))

;; Ошибки и предупреждения (Flymake встроен в Emacs)
(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error))

(use-package corfu
  :custom
  (corfu-auto t)           ; показывать окно автоматически при вводе
  (corfu-auto-delay 0.2)   ; задержка в секундах
  (corfu-auto-prefix 2)    ; сколько символов набрать до появления окна
  (corfu-cycle t)          ; прокрутка по кругу
  :init
  (global-corfu-mode))

;; eldoc: не выводить в нижнюю строку, показывать по C-c h в отдельном окне
(with-eval-after-load 'eldoc
  (setq eldoc-display-functions '(eldoc-display-in-buffer)))


;; Цветной eldoc: markdown в документации
(use-package markdown-mode
  :custom (markdown-fontify-code-blocks-natively t))

;; ---------------------------------------------------------------------------
;; Rust
;; ---------------------------------------------------------------------------
(use-package rust-mode)

;; C-c C-c C-r: cargo run, C-c C-c C-t: cargo test, C-c C-c C-b: cargo build
(use-package cargo
  :hook (rust-mode . cargo-minor-mode))

;; ---------------------------------------------------------------------------
;; Python
;; ---------------------------------------------------------------------------
(setq python-indent-offset 4)

(with-eval-after-load 'python
  (when (executable-find "ipython")
    (setq python-shell-interpreter "ipython"
          python-shell-interpreter-args "-i --simple-prompt --InteractiveShell.display_page=True")))
;; ---------------------------------------------------------------------------
;; Форматирование при сохранении: rustfmt для Rust, ruff для Python
;; (uv tool install ruff / pipx install ruff)
;; ---------------------------------------------------------------------------
(use-package apheleia
  :config
  (setf (alist-get 'python-mode apheleia-mode-alist) '(ruff-isort ruff))
  (setf (alist-get 'rust-mode   apheleia-mode-alist) '(rustfmt))
  (apheleia-global-mode +1))
