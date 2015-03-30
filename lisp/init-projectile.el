;;; ----------------------------------------
;;; Config for Projectile
;;; ----------------------------------------

;;; Code:
(require 'helm-projectile)

(projectile-global-mode)

(setq projectile-completion-system 'helm)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'native)

(setq projectile-globally-ignored-files (delete-duplicates (append projectile-globally-ignored-files grep-find-ignored-files (list "#*"))))
(setq projectile-globally-ignored-directories (delete-duplicates (append projectile-globally-ignored-directories grep-find-ignored-directories (list "ENV" "bin"))))

(helm-projectile-on)

(provide 'init-projectile)
