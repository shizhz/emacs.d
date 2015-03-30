(require 'yasnippet)

(yas-reload-all)

(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
(define-key yas-minor-mode-map (kbd "C-i") nil)
(define-key yas-minor-mode-map (kbd "C-i") 'yas-expand)

(add-hook 'python-mode-hook
          '(lambda ()
             (yas-minor-mode)))

(provide 'init-yas)
