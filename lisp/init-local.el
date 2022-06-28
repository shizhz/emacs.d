;;;

; protobuf-mode
(require-package 'protobuf-mode)

                                        ; evil-mode
(unless (package-installed-p 'evil)
  (package-install 'evil))

(require 'evil)
(setq evil-want-C-u-scroll t)
(evil-mode 1)


// My key-bindings


(provide 'init-local)
