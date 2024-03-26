;;; init-frame-hooks.el --- Provide specific hooks for GUI/TTY frame creation -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(defvar after-make-console-frame-hooks '()
  "Hooks to run after creating a new TTY frame")
(defvar after-make-window-system-frame-hooks '()
  "Hooks to run after creating a new window-system frame")



(defun run-after-make-frame-hooks (frame)
  "Run configured hooks in response to the newly-created FRAME.
Selectively runs either `after-make-console-frame-hooks' or
`after-make-window-system-frame-hooks'"
  (with-selected-frame frame
    (run-hooks (if window-system
                   'after-make-window-system-frame-hooks
                 'after-make-console-frame-hooks))))

(add-hook 'after-make-frame-functions 'run-after-make-frame-hooks)

(defconst sanityinc/initial-frame (selected-frame)
  "The frame (if any) active during Emacs initialization.")

(add-hook 'after-init-hook
          (lambda () (when sanityinc/initial-frame
                  (run-after-make-frame-hooks sanityinc/initial-frame))))
;; Make new frame size the same with monitor
; (add-hook 'after-init-hook
;	  (lambda () (when window-system
;			(add-to-list 'default-frame-alist (cons 'width (/ (display-pixel-width) 2)))
;			(add-to-list 'default-frame-alist (cons 'height (/ (display-pixel-height) 2)))
;		       )))


(provide 'init-frame-hooks)
;;; init-frame-hooks.el ends here
