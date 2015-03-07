;; ----------------------------------------
;; Config for evil-mode
;; ----------------------------------------

;;; code:

(require-package 'evil)

(evil-mode 1)

(define-key evil-insert-state-map "\C-e" 'end-of-line)

(provide 'init-evil)
