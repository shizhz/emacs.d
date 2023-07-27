;;; init-paredit.el --- Configure paredit structured editing -*- lexical-binding: t -*-
;;; Commentary:
;;; Code:

(require-package 'paredit)

(defun sanityinc/maybe-map-paredit-newline ()
  (unless (or (memq major-mode '(inferior-emacs-lisp-mode cider-repl-mode))
              (minibufferp))
    (local-set-key (kbd "RET") 'paredit-newline)))

(add-hook 'paredit-mode-hook 'sanityinc/maybe-map-paredit-newline)

(with-eval-after-load 'paredit
  (diminish 'paredit-mode " Par")
  ;; Suppress certain paredit keybindings to avoid clashes, including
  ;; my global binding of M-?
  (dolist (binding '("C-<left>" "C-<right>" "C-M-<left>" "C-M-<right>" "M-s" "M-?"))
    (define-key paredit-mode-map (read-kbd-macro binding) nil)))



;; Use paredit in the minibuffer
;; TODO: break out into separate package
;; http://emacsredux.com/blog/2013/04/18/evaluate-emacs-lisp-in-the-minibuffer/
;;
;; FIXME: there's a problem after upgrading to emacs master branch: the RET key is bound to paredit-RET, which opens a new line rather than submit and eval the expression.
;; So this hook is disabled for now, there's no too much requirement for me to edit s-expression in minibuffer
;; (add-hook 'minibuffer-setup-hook 'sanityinc/conditionally-enable-paredit-mode)

(defvar paredit-minibuffer-commands '(eval-expression
                                      pp-eval-expression
                                      eval-expression-with-eldoc
                                      ibuffer-do-eval
                                      ibuffer-do-view-and-eval)
  "Interactive commands for which paredit should be enabled in the minibuffer.")

(defun sanityinc/conditionally-enable-paredit-mode ()
  "Enable paredit during lisp-related minibuffer commands."
  (if (memq this-command paredit-minibuffer-commands)
      (enable-paredit-mode)))


(provide 'init-paredit)
;;; init-paredit.el ends here
