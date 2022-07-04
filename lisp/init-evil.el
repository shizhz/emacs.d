;;; init-local.el --- evil configuration  -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

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
  (define-key evil-visual-state-map (kbd "SPC SPC") 'execute-extended-command)
  (define-key evil-insert-state-map (kbd "C-e") 'evil-end-of-line)
  (define-key evil-insert-state-map (kbd "C-a") 'evil-first-non-blank)
  (evil-mode 1))

;;; Speed up motion
(use-package evil-easymotion
  :disabled
  :config
  (evilem-default-keybindings "SPC"))

(use-package evil-snipe
  :disabled)

;;; Key-bindings 参考 evil-easymotion
(use-package avy
  :config
  (defvar avy-map (make-sparse-keymap)
    "Keymap used for the keybindings")
  (defun avy-default-keybindings (prefix)
    "Define easymotions for all motions evil defines by default"
    (define-key evil-motion-state-map (kbd prefix) avy-map))

  (define-key avy-map "w" #'avy-goto-word-0)
  (define-key avy-map "W" #'avy-goto-word-1)
  (define-key avy-map "C" #'avy-goto-char)
  (define-key avy-map "c" #'avy-goto-char-2)
  (define-key avy-map "t" #'avy-goto-char-timer)
  (define-key avy-map "l" #'avy-goto-line)
  (avy-default-keybindings "SPC")
  )

;;; Vim Bindings Everywhere else
(use-package evil-collection
  :after evil
  :config
  (setq evil-want-integration t)
  (evil-collection-init))

(provide 'init-evil)
