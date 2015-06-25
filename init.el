;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Created using http://tuhdo.github.io/                                      ;;
;; last edited: 24.6.15, Patrick Helfenstein                                  ;;
;; Notes:                                                                     ;;
;; show message:                                                              ;;
;; (defun hello () (interactive) (message                                     ;;
;; "Hello World"))                                                            ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; -------------------------------------------------------------------------- ;;
;; use built-in package manager                                               ;;
;; -------------------------------------------------------------------------- ;;
(require 'package)

(add-to-list 'package-archives
 	     '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; (add-to-list 'package-archives
;; 	     '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
	     '("melpa-stable" . "http://stable.melpa.org/packages/") t)

(package-initialize)


;; install magit from melpa-stable
;; magit is an interface to git
(add-to-list 'package-pinned-packages '(magit . "melpa-stable"))

;; -------------------------------------------------------------------------- ;;
;; load files from subdir custom                                              ;;
;; -------------------------------------------------------------------------- ;;
(mapc 'load (directory-files "~/.emacs.d/custom" t ".*\.el"))


;; -------------------------------------------------------------------------- ;;
;; use ibuffer                                                                ;;
;; -------------------------------------------------------------------------- ;;
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; -------------------------------------------------------------------------- ;;
;; use ido mode (currently disabled cuz helm is used)                         ;;
;; -------------------------------------------------------------------------- ;;
;; (setq ido-enable-flex-matching t)
;; (setq ido-everywhere t)
;; (ido-mode 1)


;; -------------------------------------------------------------------------- ;;
;; use rebox                                                                  ;;
;; -------------------------------------------------------------------------- ;;
(setq rebox-style-loop '(25 23 21 20))
(setq rebox-min-fill-column 80)

(require 'rebox2)
;;(rebox-mode 1)
(global-set-key (kbd "M-q") 'rebox-dwim)
(global-set-key (kbd "<shift>-M-q") 'rebox-cycle)

;; -------------------------------------------------------------------------- ;;
;; use ggtags for source browsing                                             ;;
;; -------------------------------------------------------------------------- ;;
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(add-hook 'dired-mode-hook 'ggtags-mode)

;; workgroups2
;; (require 'workgroups2)
;; (workgroups-mode 1)


;; -------------------------------------------------------------------------- ;;
;; aliases                                                                    ;;
;; -------------------------------------------------------------------------- ;;
(defalias 'yes-or-no-p 'y-or-n-p) ; y/n is enough
(defalias 'list-buffers 'ibuffer) ; always use ibuffer
(defalias 'eb 'eval-buffer) ;; eval elisp code
(defalias 'er 'eval-region)
;; (defalias 'ed 'eval-defun)


(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector
   (vector "#4d4d4c" "#c82829" "#718c00" "#eab700" "#4271ae" "#8959a8" "#3e999f" "#ffffff"))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-blue)))
 '(custom-safe-themes
   (quote
    ("8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" default)))
 '(fci-rule-color "#d6d6d6")
 '(frame-background-mode (quote dark))
 '(save-place t nil (saveplace))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#c82829")
     (40 . "#f5871f")
     (60 . "#eab700")
     (80 . "#718c00")
     (100 . "#3e999f")
     (120 . "#4271ae")
     (140 . "#8959a8")
     (160 . "#c82829")
     (180 . "#f5871f")
     (200 . "#eab700")
     (220 . "#718c00")
     (240 . "#3e999f")
     (260 . "#4271ae")
     (280 . "#8959a8")
     (300 . "#c82829")
     (320 . "#f5871f")
     (340 . "#eab700")
     (360 . "#718c00"))))
 '(vc-annotate-very-old-color nil)
 '(vlf-application (quote dont-ask)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
