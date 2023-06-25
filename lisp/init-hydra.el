;;; init-hydra.el --- Hydra -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package hydra
  :config
  (defhydra hydra-zoom (global-map "<f12>")
    "zoom"
    ("g" text-scale-increase "in")
    ("l" text-scale-decrease "out"))

  ;; window operations
  (defhydra hydra-window ()
    "window"
    ("h" evil-window-left)
    ("j" evil-window-down)
    ("k" evil-window-up)
    ("l" evil-window-right)
    ("H" evil-window-move-far-left)
    ("L" evil-window-move-far-right)
    ("J" evil-window-move-very-bottom)
    ("K" evil-window-move-very-top)
    ("R" evil-window-rotate-upwards)
    ("r" evil-window-rotate-downwards)
    ("n" evil-window-new)
    ("w" ace-window :color blue)
    ("v" (lambda ()
           (interactive)
           (split-window-right)
           (windmove-right))
     "vert")
    ("V" clone-indirect-buffer-other-window :color blue)
    ("s" (lambda ()
           (interactive)
           (split-window-below)
           (windmove-down))
     "horz")
    ("e" kill-current-buffer)
    ("x" evil-window-delete)
    ("1" delete-other-windows :color blue)
    ("f" projectile-find-file :color blue)
    ("F" counsel-fzf :color blue)
    ("o" counsel-find-file :color blue)
    ("d" projectile-dired)
    ("D" dired :color blue)
    ("b" projectile-switch-to-buffer :color blue)
    ("B" consult-buffer :color blue)
    ("t" projectile-toggle-between-implementation-and-test :color blue)
    ("<" evil-window-decrease-width)
    (">" evil-window-increase-width)
    ("+" evil-window-increase-height)
    ("-" evil-window-decrease-height)
    ("=" balance-windows)
    ("q" nil "quit"))
  )

(define-key evil-normal-state-map (kbd ",w") #'hydra-window/body)


(defhydra hydra-comment ()
  "comment"
  ("l" comment-line)
  ("d" comment-dwim)
  ("b" comment-box :color blue)
  ("r" comment-or-uncomment-region :colur blue)
  ("q" nil "quit")
  )

(define-key evil-normal-state-map (kbd ",c") #'hydra-comment/body)
(define-key evil-visual-state-map (kbd ",c") #'hydra-comment/body)

(defhydra hydra-git-gutter ()
  "Git Gutter"
  ("n" git-gutter:next-hunk)
  ("p" git-gutter:previous-hunk)
  ("i" git-gutter:popup-hunk)
  ("I" git-gutter:statistic)
  ("x" git-gutter:revert-hunk)
  ("s" git-gutter:stage-hunk)
  ("q" nil "quit")
  )
(define-key evil-normal-state-map (kbd ",g") #'hydra-git-gutter/body)
(define-key evil-visual-state-map (kbd ",g") #'hydra-git-gutter/body)

(provide 'init-hydra)
