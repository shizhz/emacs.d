;;; init-company.el --- Completion with company -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; WAITING: haskell-mode sets tags-table-list globally, breaks tags-completion-at-point-function
;; TODO Default sort order should place [a-z] before punctuation

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(when (maybe-require-package 'company)
  (add-hook 'after-init-hook 'global-company-mode)
  (with-eval-after-load 'company
    (diminish 'company-mode)
    (setq company-show-numbers t)
    (define-key company-mode-map (kbd "M-/") 'company-complete)
    (define-key company-mode-map [remap completion-at-point] 'company-complete)
    (define-key company-mode-map [remap indent-for-tab-command] 'company-indent-or-complete-common)
    (define-key company-active-map (kbd "M-/") 'company-other-backend)
    (define-key company-active-map (kbd "C-n") 'company-select-next)
    (define-key company-active-map (kbd "C-p") 'company-select-previous)
    (define-key company-active-map (kbd "C-d") 'company-show-doc-buffer)
    (define-key company-active-map (kbd "M-.") 'company-show-location)
    (define-key company-active-map (kbd "C-w") 'evil-delete-backward-word)  ; Seems I don't need company-show-location
    (setq-default company-dabbrev-other-buffers 'all
                  completion-ignore-case t  ;; 补全时忽略大小写
                  company-dabbrev-code-ignore-case t
                  company-idle-delay 0
                  company-selection-wrap-around t
                  company-show-quick-access t
                  company-tooltip-align-annotations t)
    ;; 参考：https://stackoverflow.com/questions/72601990/how-to-show-suggestions-for-yasnippets-when-using-eglot
    ;; FIXME: 将company-yasnippet加入后补全时的浏览快捷键会被污染，禁用evil-mode则不会，暂时将下面代码注释掉
    ;; Update[2022-07-08]: 在Linux环境中没有上述问题
    (add-hook 'eglot-managed-mode-hook
              (lambda ()
                (unless *is-windows*
                  (add-to-list 'company-backends '(company-capf :with company-yasnippet)))))
    )
  (global-set-key (kbd "M-C-/") 'company-complete)
  (when (maybe-require-package 'company-quickhelp)
    (add-hook 'after-init-hook 'company-quickhelp-mode)))


(provide 'init-company)
;;; init-company.el ends here
