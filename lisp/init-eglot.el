;;; init-eglot.el --- LSP support via eglot          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; For Emacs >= 27
(setq read-process-output-max (* 1024 1024))

(use-package eglot
  :hook ((go-mode) . eglot-ensure)
  :config
  (setq-default eglot-workspace-configuration
                '((:gopls . ((gofumpt . t)
                             (usePlaceholders . t)
                             (completeUnimported . t)
                             (annotations . ((bounds . t) (escape . t) (inline . t) (nil . t)))
                             (analyses . ((unusedparams . t) (unusedwrite . t)))
                             (allowModfileModifications . t)
                             ))))
  (define-key eglot-mode-map (kbd "C-c e n") #'flymake-goto-next-error)
  (define-key eglot-mode-map (kbd "C-c e p") #'flymake-goto-prev-error)
  (define-key eglot-mode-map (kbd "C-c e r") #'eglot-rename)
  )

(use-package consult-eglot)

(provide 'init-eglot)
;;; init-eglot.el ends here
