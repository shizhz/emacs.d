;;; init-go.el ---  lsp-bridge setup -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package posframe)


(add-to-list 'load-path "~/Projects/lsp-bridge")

(require 'yasnippet)
(yas-global-mode 1)

(require 'lsp-bridge)
(global-lsp-bridge-mode)

(provide 'init-lsp-bridge)
