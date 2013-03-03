(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(gud-gdb-command-name "gdb --annotate=1")
 '(large-file-warning-threshold nil)
 '(transient-mark-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Size Adjustments
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; set larger font size
(set-face-attribute 'default nil :height 150)

;; make border between line numbers and text smaller, set to 0 for none
(fringe-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Displaying Non Default Stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; show column number
(setq column-number-mode t)

;; show gutter line numbers
(global-linum-mode 1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Hiding Default Stuff
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; hide startup msg  
(setq inhibit-startup-message t)

;; hide scratch buffer
(setq initial-scratch-message nil)

;; hide scroll bar
(scroll-bar-mode -1)

;; hide toolbar
(tool-bar-mode -1)

;; hide menu bar
(menu-bar-mode -1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Themes
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; add theme directory
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; load zenburn
(load-theme 'zenburn t)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Misc
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; auto complete commands typed in M-x
(icomplete-mode t)

;; syntax highlight everywhere
(global-font-lock-mode t)

;;Web Server Settings
;;(setq load-path (cons "/home/mattcarrier/.emacs.d/" load-path))
;;(load "php-mode")
;;(load "zenburn-theme")

;;Zenburn Theme
;;(setq load-path (cons "/home/mattcarrier/.emacs.d/themes/" load-path))
;;(require 'color-theme-zenburn)
;;(color-theme-zenburn)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Windows Specific
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(if (eq system-type 'windows-nt)
    ;; set consolas for windows
    (set-default-font "-outline-Consolas-normal-r-normal-normal-14-97-96-96-c-*-iso8859-1")
  
    ;; set larger font size
    (set-face-attribute 'default nil :height 150)

    ;; set default directory
    (setq default-directory "C:/users/matt/" ))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Python
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(defun my-compile ()
  "Use compile to run python programs"
  (interactive)
  (compile (concat "python " (buffer-name))))
(setq compilation-scroll-output t)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Plugins
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; yassnippet
(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas/global-mode 1)
;; ctrl n and p for menu
(setq yas/prompt-functions '(yas/x-prompt yas/dropdown-prompt))

;; auto-complete
(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")
; Load the default configuration
(require 'auto-complete-config)
; Make sure we can find the dictionaries
(add-to-list 'ac-dictionary-directories "~/.emacs.d/plugins/auto-complete/dict")
; Use dictionaries by default
(setq-default ac-sources (add-to-list 'ac-sources 'ac-source-dictionary))
(global-auto-complete-mode t)
; Start auto-completion after 2 characters of a word
(setq ac-auto-start 1)
; case sensitivity is important when finding matches
(setq ac-ignore-case nil)
;;enable hotkeys for completion menu ie c-n,c-p
(setq ac-use-menu-map t)
;; Default settings
(define-key ac-menu-map "\C-n" 'ac-next)
(define-key ac-menu-map "\C-p" 'ac-previous)
