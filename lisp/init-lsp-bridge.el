;;; init-go.el ---  lsp-bridge setup -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package posframe)


(add-to-list 'load-path "~/Projects/lsp-bridge")

(require 'yasnippet)
(yas-global-mode 1)

(require 'lsp-bridge)

(with-eval-after-load 'lsp-bridge
  (define-key acm-mode-map (kbd "C-n") #'acm-select-next)
  (define-key acm-mode-map (kbd "C-p") #'acm-select-prev)
  (define-key acm-mode-map (kbd "C-,") #'acm-select-last)
  (define-key acm-mode-map (kbd "C-.") #'acm-select-first)
  (define-key acm-mode-map (kbd "C-S-n") #'acm-select-next-page)
  (define-key acm-mode-map (kbd "C-S-p") #'acm-select-prev-page)
		 )

(global-lsp-bridge-mode)

(provide 'init-lsp-bridge)
