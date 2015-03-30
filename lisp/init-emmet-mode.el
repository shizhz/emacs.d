(require 'emmet-mode)
(require 'helm-emmet)

(add-hook 'web-mode-hook 'emmet-mode)

(add-hook 'web-mode-hook
          (lambda () (local-set-key (kbd "C-c C-o") #'helm-emmet)))

(provide 'init-emmet-mode)
