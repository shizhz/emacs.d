;;; init-go.el ---     yasnippet setup     -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package yasnippet
  :config
  (yas-global-mode 1))

;;TODO: 快捷TAB键设置参考: https://emacs-china.org/t/tab-company-yasnippet/15590
(use-package yasnippet-snippets
  :init
  (setq yas-triggers-in-field t)
  :config
  ;; 在 . 之后禁用 company-yasnippet
  ;; 参见：https://emacs-china.org/t/company-yasnippet/12232
  (defun company-yasnippet/disable-after-dot (fun command &optional arg &rest _ignore)
    (if (eq command 'prefix)
        (let ((prefix (funcall fun 'prefix)))
          (when (and prefix (not
                             (eq
                              (char-before (- (point) (length prefix)))
                              ?.)))
            prefix))
      (funcall fun command arg)))

  (advice-add #'company-yasnippet :around #'company-yasnippet/disable-after-dot)
  )

(provide 'init-snippet)
