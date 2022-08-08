;;; init-local.el --- My personal config  -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package protobuf-mode)

(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window))

(use-package hl-todo
  :init (global-hl-todo-mode)
  :config
  (define-key hl-todo-mode-map (kbd "C-c t p") 'hl-todo-previous)
  (define-key hl-todo-mode-map (kbd "C-c t n") 'hl-todo-next)
  (define-key hl-todo-mode-map (kbd "C-c t o") 'hl-todo-occur)
  (define-key hl-todo-mode-map (kbd "C-c t i") 'hl-todo-insert)
  )

;;; Borrowed from https://github.com/granddaifuku/.emacs.d/
(use-package mwim
  :after evil
  :config
  (define-key evil-insert-state-map (kbd "C-a") 'mwim-beginning-of-code-or-line)
  (define-key evil-insert-state-map (kbd "C-e") 'mwim-end-of-code-or-line))

(use-package tree-sitter
  :disabled
  :config
  (use-package tree-sitter-langs
    :ensure t)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package minimap
  :ensure t
  :commands
  (minimap-buffer-name minimap-create-window minimap-kill)
  :diminish
  :custom
  (minimap-major-modes '(prog-mode))
  (minimap-minimum-width 15)
  (minimap-window-location 'right)
  :bind
  ("C-c C-m" . minimap-mode))

(use-package origami
  :diminish
  :hook (after-init . global-origami-mode)
  :bind
  ("C-c o z" . origami-open-node)
  ("C-c o c" . origami-close-node))

(use-package restclient)
(add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode))

;;; Font
;;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))

;;; Try to fix 'Error: Variable binding depth exceeds max-specpdl-size'
(setq max-specpdl-size 13000)

;;; Jump between source file and related test file
(define-key global-map (kbd "C-M-t") #'projectile-toggle-between-implementation-and-test)

;;; To replace thr original C-x C-h
(setq prefix-help-command #'embark-prefix-help-command)
(global-set-key (kbd "C-s") #'consult-line)
(global-set-key (kbd "C-c i") #'consult-line)

;;; Display relative line number, this needs Emacs version > 28
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq tab-width 4)
(setq max-lisp-eval-depth 30000)

(provide 'init-local)
