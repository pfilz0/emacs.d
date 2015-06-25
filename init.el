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
;; inhibit welcome screen                                                     ;;
;; -------------------------------------------------------------------------- ;;
(setq inhibit-startup-message t)


;; -------------------------------------------------------------------------- ;;
;; load files from subdir custom                                              ;;
;; -------------------------------------------------------------------------- ;;
(mapc 'load (directory-files "~/.emacs.d/custom" t ".*\.el"))


;; -------------------------------------------------------------------------- ;;
;; use ibuffer                                                                ;;
;; -------------------------------------------------------------------------- ;;
(global-set-key (kbd "C-x C-b") 'ibuffer)


;; -------------------------------------------------------------------------- ;;
;; use ido mode                                                               ;;
;; -------------------------------------------------------------------------- ;;
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)


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
;; stop cursor from blinking                                                  ;;
;; -------------------------------------------------------------------------- ;;
(blink-cursor-mode -1)

;; -------------------------------------------------------------------------- ;;
;; more useful frame title, showing either file or buffer name                ;;
;; -------------------------------------------------------------------------- ;;
(setq frame-title-format
      '((:eval (if (buffer-file-name)
	       (abbreviate-file-name (buffer-file-name))
	       "%b"))))

;; -------------------------------------------------------------------------- ;;
;; use ggtags for source browsing                                             ;;
;; -------------------------------------------------------------------------- ;;
(add-hook 'c-mode-common-hook
          (lambda ()
            (when (derived-mode-p 'c-mode 'c++-mode 'java-mode 'asm-mode)
              (ggtags-mode 1))))

(add-hook 'dired-mode-hook 'ggtags-mode)

;; display line numbers when writing code
(add-hook 'prog-mode-hook 'linum-mode)

;; workgroups2
(require 'workgroups2)
(workgroups-mode 1)


;; -------------------------------------------------------------------------- ;;
;; aliases                                                                    ;;
;; -------------------------------------------------------------------------- ;;
(defalias 'yes-or-no-p 'y-or-n-p) ; y/n is enough
(defalias 'list-buffers 'ibuffer) ; always use ibuffer
					; elisp
(defalias 'eb 'eval-buffer)
(defalias 'er 'eval-region)
;; (defalias 'ed 'eval-defun)


