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
              ("C-c g a" . go-tag-add)
              ("C-c g d" . go-tag-remove))
  :init (setq go-tag-args (list "-transform" "snakecase")))

(use-package go-gen-test
  :bind (:map go-mode-map
              ("C-c g g" . go-gen-test-dwim)))

(use-package gotest
  :bind (:map go-mode-map
              ("C-c g f" . go-test-current-file)
              ("C-c g t" . go-test-current-test)
              ("C-c g j" . go-test-current-project)
              ("C-c g b" . go-test-current-benchmark)
              ("C-c g c" . go-test-current-coverage)
              ("C-c g r" . go-run)))

(provide 'init-go)
