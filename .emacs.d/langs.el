(use-package go-mode
  :straight t
	:defer t
  :commands go-mode
  :hook ((go-mode . (lambda ()
											(add-hook 'before-save-hook #'gofmt-before-save 0 t))))
  :mode "\\.go\\'")

(use-package cc-mode
  :straight t
	:defer t
  :commands (c++-mode c-mode)
  :mode (("\\.cpp\\'" . c++-mode)
				 ("\\.hpp\\'" . c++-mode)
				 ("\\.c\\'" . c-mode)
				 ("\\.h\\'" . c-mode)))

(use-package js2-mode
  :straight t
	:defer t
  :commands js2-mode
  :mode ("\\.js\\'" . js2-mode)
	:hook (js2-mode . (lambda ()
											(setq create-lockfiles nil))))

(use-package rjsx-mode
  :straight t
	:defer t
  :commands rjsx-mode
  :mode ("\\.jsx\\'" . rjsx-mode)
	:hook (rjsx-mode . (lambda ()
											(setq create-lockfiles nil))))

(use-package typescript-mode
	:straight t
	:defer t
  :commands typescript-mode
	:mode (("\\.ts\\'" . typescript-mode)
				 ("\\.tsx\\'" . typescript-mode))
	:hook (typescript-mode . (lambda ()
														 (setq create-lockfiles nil
																	 typescript-indent-level 2))))

(use-package haskell-mode
  :straight t
	:defer t
  :commands haskell-mode
  :mode "\\.hs\\'")

(use-package rust-mode
  :straight t
	:defer t
  :commands rust-mode
  :mode "\\.rs\\'")

(use-package dart-mode
  :straight t
	:defer t
  :commands dart-mode
  :mode "\\.dart\\'")
(use-package flutter
  :straight t)
  ;;:hook (after-save . flutter-hot-reload))

(use-package python-mode
  :straight t
	:defer t
  :commands python-mode
  :mode "\\.py\\'")

(use-package kotlin-mode
  :straight t
	:defer t
  :commands kotlin-mode
	:mode ("\\.kt\\'")
  :custom
  (kotlin-tab-width 2))

(use-package markdown-mode
  :straight t
	:defer t
  :commands (markdown-mode gfm-mode)
  :mode (("\\.md\\'" . markdown-mode)
				 ("README\\.md\\'" . gfm-mode))
	:init
	(setq markdown-command
				(concat "pandoc"
								" --from=markdown --to=html"
								" --standalone --mathjax --highlight-style=pygments")))

(use-package yaml-mode
  :straight t
	:defer t
  :commands yaml-mode
  :mode ("\\.yaml\\'" "\\.yml\\'"))

;; lsp-mode configuration
(use-package lsp-mode
  :straight t
	:defer t
  :commands (lsp lsp-deferred)
  :hook ((go-mode
					c++-mode
					js2-mode
					rjsx-mode
					typescript-mode
					rust-mode
					python-mode
					elm-mode
					dart-mode) . lsp-deferred)
  :custom
  (gc-cons-threshold 100000000) ;;100mb
  (read-process-output-max (* 1024 1024)) ;;Size in bytes, 1024b = 1k, 1k * 1024 = 1mb
  (lsp-prefer-capf t)
	(lsp-sqls-server (expand-file-name "~/go/bin/sqls"))
	:config
	(add-to-list 'lsp-language-id-configuration '(js-jsx-mode . "javascriptreact")))

(use-package lsp-haskell
  :straight t
	:defer t
	:after lsp-mode
  :hook (haskell-mode . lsp-deferred))

(use-package lsp-dart
  :straight t
	:defer t
	:after lsp-mode
  :hook (dart-mode . lsp-deferred)
  :custom
  (lsp-dart-flutter-widget-guides nil)
	(lsp-dart-enable-sdk-formatter nil))

(use-package lsp-ui
  :straight t
	:defer t
  :commands lsp-ui-mode
  :custom
  (lsp-prefer-flymake nil)
  (lsp-ui-sideline-enable t)
  (lsp-ui-sideline-ignore-duplicate t)
  (lsp-ui-sideline-show-code-actions t))

(use-package lsp-ivy
  :straight t
	:defer t
  :commands lsp-ivy-workspace-symbol)

(use-package flycheck
  :straight t
  :config
  (global-flycheck-mode))

(use-package company
  :straight t
	:defer t
  :commands (global-company-mode company-mode)
  :hook ((after-init . global-company-mode))
  :general
  (:states '(insert normal) "<backtab>" 'company-complete))

;;(use-package company-lsp
;;  :straight t
;;  :commands company-lsp)

(use-package company-quickhelp
  :straight t
  :after company
  :config
  (company-quickhelp-mode))

(use-package company-box
  :straight t
  :after company
  :hook (company-mode . company-box-mode))

(use-package dap-mode
  :straight t
	:defer t
  :hook ((dap-stopped-hook . (lambda (arg) (call-interactively #'dap-hydra)))))
