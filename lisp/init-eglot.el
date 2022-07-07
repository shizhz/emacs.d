;;; init-eglot.el --- LSP support via eglot          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

;; For Emacs >= 27
(setq read-process-output-max (* 1024 1024))

(use-package eglot
  :hook ((go-mode) . eglot-ensure)
  :config
  (setq-default eglot-workspace-configuration
                '((:gopls . ((gofumpt . t)
                             ;; (usePlaceholders . t)
                             ;; (matcher . "CaseInsensitive")
                             (completeUnimported . t)
                             (annotations . ((bounds . t) (escape . t) (inline . t) (nil . t)))
                             (analyses . ((unusedparams . t) (unusedwrite . t)))
                             (allowModfileModifications . t)
                             ))))
  (define-key eglot-mode-map (kbd "C-c e n") #'flymake-goto-next-error)
  (define-key eglot-mode-map (kbd "C-c e p") #'flymake-goto-prev-error)
  (define-key eglot-mode-map (kbd "C-c e r") #'eglot-rename)
  ;; 参考：https://stackoverflow.com/questions/72601990/how-to-show-suggestions-for-yasnippets-when-using-eglot
  ;; FIXME: 将company-yasnippet加入后补全时的浏览快捷键会被污染，禁用evil-mode则不会，暂时将下面代码注释掉
  ;; (add-hook 'eglot-managed-mode-hook
  ;;           (lambda ()
  ;;             (add-to-list 'company-backends '(company-capf :with company-yasnippet))))
  )

  (use-package consult-eglot)

(provide 'init-eglot)
;;; init-eglot.el ends here
