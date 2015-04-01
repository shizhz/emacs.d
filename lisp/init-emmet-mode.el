(require 'emmet-mode)
(require 'helm-emmet)

(add-hook 'web-mode-hook 'emmet-mode)

(add-hook 'web-mode-hook
          (lambda ()
            (local-set-key (kbd "C-c C-o") #'helm-emmet)
            (local-set-key (kbd "C-M-n") #'emmet-next-edit-point)
            (local-set-key (kbd "C-M-p") #'emmet-prev-edit-point)))

(provide 'init-emmet-mode)
