;;; init-go.el --- Full-featured IDE setup for golang          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package posframe)

(use-package yasnippet
  :config
  (yas-global-mode 1))

(require 'lsp-bridge)
(global-lsp-bridge-mode)

(provide 'init-lsp-bridge)
