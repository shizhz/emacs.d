;;; ----------------------------------------
;;; Config for Projectile
;;; ----------------------------------------

;;; Code:
(require-package 'projectile)

(projectile-global-mode)

(setq projectile-completion-system 'helm)
(setq projectile-enable-caching t)
(setq projectile-indexing-method 'native)


(provide 'init-projectile)
