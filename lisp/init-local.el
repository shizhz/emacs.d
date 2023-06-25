;;; init-local.el --- My personal config  -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(use-package protobuf-mode
  :mode "\\.proto\\'"
  :config
  (add-hook 'before-save-hook #'eglot-format)
  )

(use-package ace-window
  :config
  (global-set-key (kbd "M-o") 'ace-window))

(use-package hl-todo
  :init (global-hl-todo-mode)
  :config
  (define-key hl-todo-mode-map (kbd "C-c t p") 'hl-todo-previous)
  (define-key hl-todo-mode-map (kbd "C-c t n") 'hl-todo-next)
  (define-key hl-todo-mode-map (kbd "C-c t o") 'hl-todo-occur)
  (define-key hl-todo-mode-map (kbd "C-c t i") 'hl-todo-insert)
  )

;;; Borrowed from https://github.com/granddaifuku/.emacs.d/
(use-package mwim
  :after evil
  :config
  (define-key evil-insert-state-map (kbd "C-a") 'mwim-beginning-of-code-or-line)
  (define-key evil-insert-state-map (kbd "C-e") 'mwim-end-of-code-or-line))

(use-package tree-sitter
  :disabled
  :config
  (use-package tree-sitter-langs
    :ensure t)
  (global-tree-sitter-mode)
  (add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode))

(use-package minimap
  :ensure t
  :commands
  (minimap-buffer-name minimap-create-window minimap-kill)
  :diminish
  :custom
  (minimap-major-modes '(prog-mode))
  (minimap-minimum-width 15)
  (minimap-window-location 'right)
  :bind
  ("C-c C-m" . minimap-mode))

(use-package origami
  :diminish
  :hook (after-init . global-origami-mode)
  :bind
  ("C-c o z" . origami-open-node)
  ("C-c o c" . origami-close-node))

(use-package restclient)
(add-to-list 'auto-mode-alist '("\\.rest\\'" . restclient-mode))

(use-package kubernetes)
(use-package kubernetes-evil
  :ensure t
  :after kubernetes)

;;; Font
;;(add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-12"))

;;; Try to fix 'Error: Variable binding depth exceeds max-specpdl-size'
(setq max-specpdl-size 13000)

;;; Jump between source file and related test file
(define-key global-map (kbd "C-M-t") #'projectile-toggle-between-implementation-and-test)

;;; To replace thr original C-x C-h
(setq prefix-help-command #'embark-prefix-help-command)
(global-set-key (kbd "C-s") #'consult-line)
(global-set-key (kbd "C-c i") #'consult-line)

;;; Display relative line number, this needs Emacs version > 28
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)
(setq tab-width 4)
(setq max-lisp-eval-depth 30000)

;; tree-sitter
(use-package tree-sitter)
(use-package tree-sitter-langs)
(global-tree-sitter-mode)
(use-package evil-textobj-tree-sitter :ensure t)

;; bind `function.outer`(entire function block) to `f` for use in things like `vaf`, `yaf`
(define-key evil-outer-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.outer"))
;; bind `function.inner`(function block without name and args) to `f` for use in things like `vif`, `yif`
(define-key evil-inner-text-objects-map "f" (evil-textobj-tree-sitter-get-textobj "function.inner"))

;; You can also bind multiple items and we will match the first one we can find
(define-key evil-outer-text-objects-map "a" (evil-textobj-tree-sitter-get-textobj ("conditional.outer" "loop.outer")))


;; See more textobj from https://github.com/nvim-treesitter/nvim-treesitter-textobjects#built-in-textobjects
;; Goto start of next function
(define-key evil-normal-state-map (kbd "]f") (lambda ()
                                               (interactive)
                                               (evil-textobj-tree-sitter-goto-textobj "function.outer")))
;; Goto start of previous function
(define-key evil-normal-state-map (kbd "[f") (lambda ()
                                               (interactive)
                                               (evil-textobj-tree-sitter-goto-textobj "function.outer" t)))
;; Goto end of next function
(define-key evil-normal-state-map (kbd "]F") (lambda ()
                                               (interactive)
                                               (evil-textobj-tree-sitter-goto-textobj "function.outer" nil t)))
;; Goto end of previous function
(define-key evil-normal-state-map (kbd "[F") (lambda ()
                                               (interactive)
                                               (evil-textobj-tree-sitter-goto-textobj "function.outer" t t)))

;; fancy-narrow
(use-package fancy-narrow
  :after evil
  :commands (fancy-narrow-to-region fancy-widen evil-fancy-narrow)
  :config
  ;; TODO: remove extra args
  (evil-define-operator evil-fancy-narrow (beg end type register _handler)
    "Narrow to region"
    :move-point nil
    :repeat nil
    (interactive "<R><x><y>")
    (fancy-narrow-to-region beg end))
  (defun shizhz/narrow-region-dwim (&optional basic)
    "Narrow or widen the region (dwim)."
    (interactive)
    (if (eq evil-state 'visual)
        (if basic
            (call-interactively 'narrow-to-region)
          (call-interactively 'fancy-narrow-to-region))
      (if basic
          (call-interactively 'widen)
        (call-interactively 'fancy-widen))))
  :init
  (define-key evil-normal-state-map (kbd "C-x n n") 'fancy-narrow-region)
  (define-key evil-normal-state-map (kbd "C-x n f") 'fancy-narrow-to-defun)
  (define-key evil-normal-state-map (kbd "C-x n w") 'fancy-widen)
  (define-key evil-normal-state-map (kbd "C-x n p") 'fancy-narrow-to-page))

;; evil-multiedit, multiple-cursors init in init-editing-utils.el has been commented
(use-package evil-multiedit)
(evil-multiedit-default-keybinds)

;; defined in init-envars.el
;; (setenv-file-set-envars-hooks)
(global-set-key (kbd "C-M-v") 'scroll-other-window)
(global-set-key (kbd "C-M-V") 'scroll-other-window-down)

(use-package evil-owl
  :config
  (setq evil-owl-display-method 'posframe
        evil-owl-extra-posframe-args '(:width 50 :height 20)
        evil-owl-max-string-length 50)
  (evil-owl-mode))

(provide 'init-local)
