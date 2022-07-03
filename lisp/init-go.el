;;; init-go.el --- Full-featured IDE setup for golang          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:
(use-package go-mode
  :mode "\\.go\\'"
  :config
  (add-hook 'before-save-hook '(lambda ()
                                 ;; Don't change the order, otherwise eglot-code-action-organize-imports will raise an error if there no code action, which will interrupt the call to eglot-format
                                 (call-interactively #'eglot-format)
                                 (call-interactively #'eglot-code-action-organize-imports)
                                 ))
  )

(provide 'init-go)
