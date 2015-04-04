;; ----------------------------------------
;; Config for lispy-mode
;; ----------------------------------------

;;; code:

(require-package 'lispy)

(add-hook 'lisp-mode-hook (lambda () (lispy-mode 1)))
(add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))

(setq lispy-no-space t)

(provide 'init-lispy)
