;;; init-formatter.el --- Format programs -*- lexical-binding: t -*-
;;; Commentary:

;; Place to configure program formatters

;;; Code:

(use-package format-all
  :hook ((
          protobuf-mode
          ) . format-all-mode)
  )

(provide 'init-formatter)
