;;; init-local.el --- My personal config  -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package protobuf-mode)

;;; UNDO
;; Vim style undo not needed for emacs 28
(use-package undo-fu)

;;; Vim Bindings
(use-package evil
  :demand t
  :bind (("<escape>" . keyboard-escape-quit))
  :init
  ;; allows for using cgn
  ;; (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil)
  ;; no vim insert bindings
  (setq evil-undo-system 'undo-fu)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-Y-yank-to-eol t)
  :config
  (define-key evil-normal-state-map (kbd "SPC SPC") 'execute-extended-command)
  (define-key evil-insert-state-map (kbd "C-e") 'evil-end-of-line)
  (define-key evil-insert-state-map (kbd "C-a") 'evil-first-non-blank)
  (evil-mode 1))

;;; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))
(use-package undo-fu)

(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window))

;;; Font
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-12"))

;;; Try to fix 'Error: Variable binding depth exceeds max-specpdl-size'
(setq max-specpdl-size 13000)

;;; Jump between source file and related test file
(define-key global-map (kbd "C-M-t") #'projectile-toggle-between-implementation-and-test)

;;; To replace thr original C-x C-h
(setq prefix-help-command #'embark-prefix-help-command)
(global-set-key (kbd "C-s") #'consult-line)

(provide 'init-local)
