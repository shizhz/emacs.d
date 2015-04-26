;; Set default browser
(setq browse-url-browser-function 'browse-url-generic
      browse-url-generic-program "google-chrome-stable")

(if (or (eq system-type 'windows-nt)
        (eq system-type 'ms-dos))
    (setq browse-url-browser-function 'browse-url-default-windows-browser))
(if *is-a-mac*
    (setq browse-url-browser-function 'browse-url-default-macosx-browser))

(provide 'init-my-config)
