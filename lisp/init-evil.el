;; ----------------------------------------
;; Config for evil-mode
;; ----------------------------------------

;;; code:

(require-package 'evil)

(evil-mode 1)

(define-key evil-insert-state-map "\C-e" 'end-of-line)
(define-key evil-insert-state-map "\C-k" 'kill-line)
(define-key evil-normal-state-map "\C-u" 'evil-scroll-up)

(provide 'init-evil)
