;;;

; protobuf-mode
(require-package 'protobuf-mode)
                                        ; evil-mode
(unless (package-installed-p 'evil)
  (package-install 'evil))

(setq evil-want-C-u-scroll t)
(setq evil-want-Y-yank-to-eol t)
(require 'evil)
(evil-mode 1)

;;; Evil  keybindings
(define-key evil-normal-state-map (kbd "SPC SPC") 'execute-extended-command)
(define-key evil-insert-state-map (kbd "C-e") 'evil-end-of-line-or-visual-line)
(define-key evil-insert-state-map (kbd "C-a") 'evil-beginning-of-visual-line)

(provide 'init-local)
