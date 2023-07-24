;;; init-treesit.el --- config for treesitter -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(setq treesit-extra-load-path '("~/.emacs.d/tree-sitter"))

(setq treesit-language-source-alist
      '((bash "https://github.com/tree-sitter/tree-sitter-bash")
        (cmake "https://github.com/uyha/tree-sitter-cmake")
        (css "https://github.com/tree-sitter/tree-sitter-css")
        (elisp "https://github.com/Wilfred/tree-sitter-elisp")
        (go "https://github.com/tree-sitter/tree-sitter-go")
        (html "https://github.com/tree-sitter/tree-sitter-html")
        (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
        (json "https://github.com/tree-sitter/tree-sitter-json")
        (make "https://github.com/alemuller/tree-sitter-make")
        (markdown "https://github.com/ikatyang/tree-sitter-markdown")
        (python "https://github.com/tree-sitter/tree-sitter-python")
        (toml "https://github.com/tree-sitter/tree-sitter-toml")
        (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
        (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
        (yaml "https://github.com/ikatyang/tree-sitter-yaml")))

;; Eval the following expression to install all the above tree-sitter grammar
;; (mapc #'treesit-install-language-grammar (mapcar #'car treesit-language-source-alist))

;; (use-package tree-sitter)
;; (use-package tree-sitter-langs)
;; (global-tree-sitter-mode)
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

(provide 'init-treesit)
