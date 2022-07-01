;;; init-go.el --- Full-featured IDE setup for golang          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package go-mode
  :mode "\\.go\\'"
  :config
  (add-hook 'before-save-hook '(lambda ()
                                 (call-interactively #'eglot-code-action-organize-imports)
                                 (call-interactively #'eglot-format)
                                 ))
  )

(provide 'init-go)
