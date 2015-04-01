(require-package 'dired+)
(require-package 'dired-sort)

(setq-default diredp-hide-details-initially-flag nil
              dired-dwim-target t)


(cl-defun join-file-types (file-types)
  (if (null file-types) ""
    (concat " \\( "
            (mapconcat 'identity (mapcar
                                  (lambda (file-type) (concat " -iname '*." file-type "'"))
                                  (split-string file-types))
                       " -o ")
            " \\) ")))

(defun find-grep-dired-within-specified-filetype (dir file-types regexp)
  (interactive
   (list (read-directory-name "Find-grep (directory): " nil "" t)
         (read-from-minibuffer "Find-grep (File type): " nil
                               nil nil "*.*" t t)
         (read-from-minibuffer "Find-grep (grep regexp): " nil
                               nil nil 'dired-regexp-history t t)))
  (find-dired dir (concat "-type f " find-options
                          (join-file-types file-types)
                          " -exec grep " find-grep-options " " regexp " {} \\\; ")))

(after-load 'dired
  (require 'dired+)
  (require 'dired-sort)
  (when (fboundp 'global-dired-hide-details-mode)
    (global-dired-hide-details-mode -1))
  (setq dired-recursive-deletes 'top)
  (define-key dired-mode-map [mouse-2] 'dired-find-file)

  (setq find-grep-options "-q -I")
  (setq find-options "! -name '*.pyc' ! -iname '#*#' ")
  (setq-default dired-omit-files-p t)
  (setq dired-omit-files "^\\.?#\\|^\\.$\\|^\\.\\.$\\|*\\.pyc$\\|#*#")


  (add-hook 'dired-mode-hook
            (lambda () (guide-key/add-local-guide-key-sequence "%"))))



(provide 'init-dired)
