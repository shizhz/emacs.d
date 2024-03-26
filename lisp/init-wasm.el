;;; init-wasm.el --- Full-featured IDE setup for webassemble          -*- lexical-binding: t; -*-

;;; Commentary:

;;; Code:

(use-package wat-mode
  :straight (wat-mode :type git
                      :host github
                      :repo "devonsparks/wat-mode"))

(provide 'init-wasm)
