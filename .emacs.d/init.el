(let ((bootstrap-file
				(expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
			(bootstrap-version 5))
    (unless (file-exists-p bootstrap-file)
      (with-current-buffer
	  (url-retrieve-synchronously
	  "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
	  'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(straight-use-package 'use-package)
(use-package package
	     :config
	     (add-to-list 'package-archives
			  '("melpa" . "https://melpa.org/packages/")))

(use-package undo-tree
	:straight t
	:defer t
	:commands (global-undo-tree-mode undo-tree-mode)
	:config (global-undo-tree-mode t)
	:custom
	(undo-tree-auto-save-history nil))

(use-package evil
	:straight t
	:init
	:custom
	(evil-want-Y-yank-to-eol t)
	(evil-undo-system 'undo-tree)
	(evil-want-keybinding nil)
	:config
	(evil-mode t))

(use-package evil-goggles
  :straight t
	:after evil
	:commands evil-googles-mode
  :config
  (evil-googles-mode t))

(use-package evil-mc
  :straight t
	:after evil
  :config
  (global-evil-mc-mode t))

(use-package evil-collection
  :straight t
	:after evil
  :config
  (evil-collection-init))

(load (concat user-emacs-directory "bindings.el"))

(use-package magit
  :straight t)

;(use-package projectile
;  :straight t
;  :commands projectile-global-mode
;  :hook ((emacs-startup . projectile-global-mode))
;  :custom (projectile-completion-system 'ivy))

(use-package counsel
  :straight t)

(use-package ivy
  :straight t
  :config
  (ivy-mode 1)
  :custom
  (ivy-use-virtual-buffers t))
(use-package ivy-rich
  :straight t
  :config
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  (ivy-rich-mode 1))

;; EditorConfig
(use-package editorconfig
	:straight t
	:config
	(editorconfig-mode 1))

;; Configuration for programming languages
(load (concat user-emacs-directory "langs.el"))
(load (concat user-emacs-directory "notes.el"))

(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)

(setq make-backup-files nil)
(setq auto-save-default nil)

;;(setq inhibit-startup-screen t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
	 ["#2d3743" "#ff4242" "#74af68" "#dbdb95" "#34cae2" "#008b8b" "#00ede1" "#e1e1e0"])
 '(c-basic-offset 2)
 '(css-indent-offset 2)
 '(custom-safe-themes
	 '("a2cde79e4cc8dc9a03e7d9a42fabf8928720d420034b66aecc5b665bbf05d4e9" default))
 '(display-line-numbers-type 'relative)
 '(evil-shift-width 2)
 '(gc-cons-threshold 100000000)
 '(global-display-line-numbers-mode t)
 '(global-undo-tree-mode t)
 '(indent-tabs-mode t)
 '(ivy-use-virtual-buffers t)
 '(js-indent-level 2 nil nil "Customized with use-package js-mode")
 '(line-number-mode nil)
 '(lsp-completion-provider t)
 '(lsp-dart-flutter-widget-guides nil)
 '(lsp-enable-indentation nil)
 '(lsp-enable-snippet nil)
 '(lsp-go-gopls-server-path "~/go/bin/gopls")
 '(lsp-gopls-server-path "~/go/bin/gopls")
 '(lsp-prefer-flymake nil t)
 '(lsp-rust-server 'rust-analyzer)
 '(lsp-ui-sideline-enable t)
 '(lsp-ui-sideline-ignore-duplicate t)
 '(lsp-ui-sideline-show-code-actions t)
 '(markdown-enable-math t)
 '(menu-bar-mode nil)
 '(package-selected-packages
	 '(neotree evil-mc-extras evil-mc general which-key magit projectile evil-leader monokai-theme evil))
 '(read-process-output-max 1048576 t)
 '(rust-format-on-save t)
 '(rust-indent-offset 2)
 '(scroll-bar-mode nil)
 '(standard-indent 2)
 '(tab-width 2)
 '(tool-bar-mode nil)
 '(web-mode-code-indent-offset 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :extend nil :stipple nil :background "#272822" :foreground "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 100 :width normal :foundry "UKWN" :family "Iosevka")))))

(use-package which-key
	:straight t
	:config
	(which-key-mode 1))

(use-package treemacs
  :straight t
  :commands treemacs
  :hook ((treemacs-mode . (lambda () (display-line-numbers-mode -1)))))
(use-package lsp-treemacs
  :straight t
  :commands lsp-treemacs-error-list)
(use-package treemacs-projectile
  :straight t
  :after treemacs projectile)

(use-package monokai-theme
	:straight t
	:hook ((emacs-startup . (lambda ()
														(load-theme 'monokai t)))))
