;;; init-formatter.el --- Format programs -*- lexical-binding: t -*-
;;; Commentary:

;; Place to configure program formatters

;;; Code:

(use-package format-all
  :hook ((
          go-mode
          ) . format-all-mode)
  :config
  (define-format-all-formatter gofumpt
    (:executable "gofumpt")
    (:languages "Go")
    (:features)
    (:format (format-all--buffer-easy executable)))
  (setq format-all-formatters '(("Go" . gofumpt)))
  )

(provide 'init-formatter)
