;;; init-corfu.el --- Configure corfu -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(use-package corfu
  :custom
  (corfu-cycle t)
  (corfu-auto t)
  (corfu-separator ?\s)
  :init (global-corfu-mode)
  :config
  (setq completion-ignore-case t))

(use-package cape
  :config
  (defun my/eglot-capf ()
    (setq-local completion-at-point-functions
                (list (cape-super-capf
                       #'eglot-completion-at-point
                       (cape-company-to-capf #'company-yasnippet)))))
  (add-hook 'eglot-managed-mode-hook #'my/eglot-capf)
  ;; (add-to-list 'completion-at-point-functions (cape-company-to-capf #'company-yasnippet))
  )

(if *nice-ui*
    (progn
      (use-package svg-lib
        :disabled)
      (use-package kind-icon
        :disabled
        :after corfu
        :custom
        (kind-icon-default-face 'corfu-default) ; to compute blended backgrounds correctly
        :config
        (add-to-list 'corfu-margin-formatters #'kind-icon-margin-formatter))
      ))

(use-package emacs
  :init
  (setq completion-cycle-threshold 3)
  (setq read-extended-command-predicate #'command-completion-default-include-p)
  (setq tab-always-indent 'complete))

(provide 'init-corfu)
