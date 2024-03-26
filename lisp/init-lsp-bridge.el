;;; init-go.el ---  lsp-bridge setup -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(require 'init-snippet)
(add-to-list 'load-path "~/Tools/lsp-bridge")
(require 'lsp-bridge)
; (setq acm-backend-lsp-candidate-min-length 2)
(setq acm-backend-yas-candidate-min-length 2)
(setq acm-backend-search-file-words-candidate-min-length 2)
(setq acm-backend-lsp-match-mode "fuzzy")

;; acm completion keybindings are changed in source file acm.el as followings:
;; C-n: select next
;; C-p: select prev
;; M-n: select last
;; M-p: select first
;; C-S-n: next page
;; C-S-n: prev page
;; To make it works in evil mode, commands [evil-complete-next, evil-complete-previous] are also remap to related acm commands

;; TODO:
;; 1. 删除字符时补全框消失了，希望不要消失
;; 2. 补全框消失后，希望有快捷键能够重新trigger补全动作

(global-lsp-bridge-mode)


(provide 'init-lsp-bridge)
