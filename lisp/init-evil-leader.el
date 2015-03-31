;;; code:
(require-package 'evil-leader)

(global-evil-leader-mode)

(setq evil-leader/leader ",")

(evil-leader/set-key
  "f" 'helm-projectile-find-file
  "g" 'helm-projectile-grep
  "b" 'helm-projectile-switch-to-buffer
  "c" 'projectile-commander
  "e" 'helm-projectile-recentf
  "t" 'find-grep-dired-within-specified-filetype
  )

(provide 'init-evil-leader)

;;;
