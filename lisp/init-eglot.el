;;; init-eglot.el --- LSP support via eglot          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; For Emacs >= 27
(setq read-process-output-max (* 1024 1024))

(use-package eglot
  :hook '((go-mode go-ts-mode js-mode protobuf-mode python-mode python-ts-mode) . eglot-ensure)
  :config
  (add-to-list 'eglot-server-programs `(protobuf-mode . ("~/bin/protobuf-ls")))
  (add-to-list 'eglot-server-programs `(python-mode . ("pyright-langserver" "--stdio")))
  (setq-default eglot-workspace-configuration
                '((:gopls . ((gofumpt . t)
                             (usePlaceholders . t)
                             (matcher . "CaseInsensitive")
                             (completeUnimported . t)
                             (annotations . ((bounds . t) (escape . t) (inline . t) (nil . t)))
                             (analyses . ((unusedparams . t) (unusedwrite . t)))
                             (allowModfileModifications . t)
                             ))))
  (define-key eglot-mode-map (kbd "C-c e R") #'eglot-reconnect)
  (define-key eglot-mode-map (kbd "C-c e n") #'flymake-goto-next-error)
  (define-key eglot-mode-map (kbd "C-c e p") #'flymake-goto-prev-error)
  (define-key eglot-mode-map (kbd "C-c e r") #'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c e i") #'eglot-find-implementation)
  )

(use-package consult-eglot)

(provide 'init-eglot)
;;; init-eglot.el ends here
