(provide 'setup-help)

;; -------------------------------------------------------------------------- ;;
;; Packages                                                                   ;;
;; -------------------------------------------------------------------------- ;;

;; provide extra highlighting in info docs
(require 'info+)

;; show key bindings in curr major mode
(global-unset-key (kbd "C-h h"))        ; original "C-h h" displays "hello world" in different languages
(define-key 'help-command (kbd "h m") 'discover-my-major)

;; change bckgr color to color for strings matching color names
(add-hook 'html-mode-hook 'rainbow-mode)
(add-hook 'css-mode-hook 'rainbow-mode)

;; better help
(require 'help+)

;; extensions to help-fns
(require 'help-fns+)

;; provide links to other help docs
(require 'help-mode+)

