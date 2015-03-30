;; (add-to-list 'load-path "~/Projects/emacs-jedi/")
;; (load "jedi-core")
;; (load "jedi")
;; (autoload 'jedi:setup "jedi" nil t)

(require 'jedi)
(setq jedi:install-imenu t)
(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:complete-on-dot t)

(eval-after-load "python"
  '(define-key python-mode-map "\C-c ; o" 'jedi-direx:pop-to-buffer))
(add-hook 'python-mode-hook 'jedi-direx:setup)


(provide 'init-jedi)
