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

(use-package go-tag
  :bind (:map go-mode-map
              ("C-c t a" . go-tag-add)
              ("C-c t r" . go-tag-remove))
  :init (setq go-tag-args (list "-transform" "snakecase")))

(use-package go-gen-test
  :bind (:map go-mode-map
              ("C-c t g" . go-gen-test-dwim)))

(use-package gotest
  :bind (:map go-mode-map
              ("C-c t f" . go-test-current-file)
              ("C-c t t" . go-test-current-test)
              ("C-c t j" . go-test-current-project)
              ("C-c t b" . go-test-current-benchmark)
              ("C-c t c" . go-test-current-coverage)
              ("C-c t x" . go-run)))

(provide 'init-go)
