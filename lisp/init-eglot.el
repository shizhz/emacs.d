;;; init-eglot.el --- LSP support via eglot          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; For Emacs >= 27
(setq read-process-output-max (* 1024 1024))

(use-package eglot
  :hook ((go-mode) . eglot-ensure)
  :config
  (setq-default eglot-workspace-configuration
                '((:gopls . (
                             (gofumpt . t)
                             ))))
  )

(use-package consult-eglot)

(provide 'init-eglot)
;;; init-eglot.el ends here
