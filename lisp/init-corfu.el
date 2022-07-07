;;; init-corfu.el --- Configure corfu -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-separator ?\s)
  :init (global-corfu-mode))

(use-package cape)

(use-package emacs
  :init
  (setq completion-cycle-threshold 3)
  (setq read-extended-command-predicate #'command-completion-default-include-p)
  (setq tab-always-indent 'complete))

(provide 'init-corfu)
