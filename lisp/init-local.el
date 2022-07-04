;;; init-local.el --- My personal config  -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package protobuf-mode)


(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window))

;;; Font
;;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))

;;; Try to fix 'Error: Variable binding depth exceeds max-specpdl-size'
(setq max-specpdl-size 13000)

;;; Jump between source file and related test file
(define-key global-map (kbd "C-M-t") #'projectile-toggle-between-implementation-and-test)

;;; To replace thr original C-x C-h
(setq prefix-help-command #'embark-prefix-help-command)
(global-set-key (kbd "C-s") #'consult-line)

(provide 'init-local)
