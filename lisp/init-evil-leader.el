;;; code:
(require-package 'evil-leader)

(global-evil-leader-mode)

(setq evil-leader/leader ",")

(cl-defun dired-goto-current-directory ()
  (interactive)
  (dired default-directory))

(evil-leader/set-key
  "ff" 'helm-projectile-find-file
  "ft" 'helm-projectile-grep
  "fd" 'dired-goto-current-directory
  "fl" 'find-grep-dired-within-specified-filetype
  "bb" 'helm-projectile-switch-to-buffer
  "c" 'projectile-commander
  "be" 'helm-projectile-recentf
  )

(provide 'init-evil-leader)

;;;
