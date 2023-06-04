;;; bindings.el --- Summary
;; -*- lexical-binding: t -*-
;;; Commentary:
;;; Idk these are the bindings and chords i use
;;; Code:
(defmacro quq-switch-non-special-buffer (command)
  `(lambda ()
      (interactive)
      (,command)
      (let ((i 0))
        (while (< i 20)
          (if (or (let ((name (buffer-name)))
										(and (char-equal (string-to-char name) ?*)
												 (char-equal (aref name (- (length name) 1)) ?*)))
									(member major-mode '("dired-mode" "magit-status-mode")))
	    (progn (,command)
		    (setq i (+ i 1)))
	    (setq i 20))))))

;; Inspired by doom emacs
(use-package general
  :straight t
  :demand t
  :config

  ;; Definitions
	(general-define-key
		:keymaps '(normal motion emacs dired-mode-map magit-mode-map help-mode-map)
		:prefix "SPC"
		:non-normal-prefix "C-SPC"

		;;Unbinding SPC first to avoid problems
		"" nil

		;;<leader> c --- code
		"c" '(:wk "Code")
			"cC" '(compile :wk "Compile")
			"cc" '(recompile :wk "Recompile")
		;;<leader> f --- file
		"f" '(:wk "File")
			"fr" '(recentf-open-files :wk "Recent files")
			"fR" '(projectile-recentf :wk "Recent project files")
			"fs" '(save-buffer :wk "Save buffer")
			"fS" '(save-some-buffer :wk "Save some buffers")
		;;<leader> s --- search
		"s" '(:wk "Search")
			"sb" '(swiper :wk "Search Buffer")
			"sf" '(locate :wk "Locate file")
			"si" '(imenu :wk "Jump to symbol")
			"sL" '(ffap-menu :wk "Jump to link")
			"sj" '(evil-show-jumps :wk "Jump list")
			"sm" '(evil-show-marks :wk "Jump to mark")
			"ss" '(swiper-isearch :wk "Search Buffer")
			"sS" '(swiper-isearch-thing-at-point :wk "Search Buffer for thing at point")
		;;<leader> n --- notes
		"n" '(:wk "Notes")
			"na" '(org-agenda :wk "Org agenda")
			"nl" '(org-store-link :wk "Org store link")
			"nm" '(org-tags-view :wk "Tags search")
			"nn" '(org-capture :wk "Org capture")
			"nN" '(org-capture-goto-target :wk "Goto capture")
			"no" '(org-clock-goto :wk "Active org-clock")
			"nt" '(org-todo-list :wk "Todo list")
			"nv" '(org-search-view :wk "View search")
		;;<leader> n --- open
		"o" '(:wk "Open/Toggle")
			"ob" '(browse-url-of-file :wk "Browser")
			"of" '(make-frame :wk "New frame")
			"o-" '(dired-jump :wk "Dired")
			"oe" '(eshell :wk "Open eshell here")
			"ot" '(treemacs :wk "Treemacs")
		;;<leader> p --- project
		"p" '(:keymap projectile-command-map :package projectile :wk "Project")
		;;<leader> q --- quit/restart
		"q" '(:wk "Quit/Restart")
			"qf" '(delete-frame :wk "Delete frame")
			"qK" '(save-buffers-kill-emacs :wk "Kill Emacs (and daemon)")
			"qQ" '(kill-emacs :wk "Quit Emacs")
			"qq" '(save-buffers-kill-terminal :wk "Save and quit Emacs")
		;;<leader> & --- snippets
		"&" '(:wk "Snippets")
		;;<leader> g --- versioning
		"g" '(:wk "Git/Versioning")
			"gR" '(vc-revert :wk "Git revert file")
			"g;" '(with-editor-finish :wk "With Editor Finish")
			"gl" '(with-editor-cancel :wk "With Editor Cancel")
			"g/" '(magit-dispatch :wk "Magit dispatch")
			"gg" '(magit-status :wk "Magit status")
			"gx" '(magit-file-delete :wk "Magit file delete")
			"gB" '(magit-blame-addition :wk "Magit blame")
			"gC" '(magit-clone :wk "Magit clone")
			"gF" '(magit-fetch :wk "Magit fetch")
			"gL" '(magit-log :wk "Magit buffer log")
			"gS" '(magit-stage-file :wk "Git stage file")
			"gU" '(magit-unstage-file :wk "Git unstage file")
			"gf" '(:wk "Find")
				"gvff" '(magit-find-file :wk "Find file")
				"gvfg" '(magit-find-git-config-file :wk "Find gitconfig file")
				"gvfc" '(magit-show-commit :wk "Find commit")
			"gl" '(:wk "List")
				"gvlr" '(magit-list-repositories :wk "List repositories")
				"gvls" '(magit-list-submodules :wk "List submodules")
			"gc" '(:wk "Create")
				"gcr" '(magit-init :wk "Initialize repo")
				"gcR" '(magit-clone :wk "Clone repo")
				"gcc" '(magit-commit-create :wk "Commit")
				"gcf" '(magit-commit-fixup :wk "Fixup")
		;;<leader> w --- windows
		"w" '(:wk "Windows")
			"wl" '(windmove-right :wk "Move to Right Window")
			"wj" '(windmove-down :wk "Move to Bottom Window")
			"wk" '(windmove-up :wk "Move to Top Window")
			"wh" '(windmove-left :wk "Move to Left Window")
			"wo" '(other-window :wk "Move to Other Window")
			"w;" '(delete-window :wk "Kill current Window")
			"w:" '(delete-other-windows :wk "Kill all other windows")
			"w+" '(evil-window-increase-height :wk "Increase window height")
			"w-" '(evil-window-decrease-height :wk "Decrease window height")
			"w>" '(evil-window-increase-width :wk "Increase window width")
			"w<" '(evil-window-decrease-width :wk "Decrease window width")
			"w=" '(balance-windows :wk "Balance Windows")
			"ws" '(evil-window-split :wk "Split Horizontally")
			"wS" '(evil-window-vsplit :wk "Split Vertically")
		;;<leader> h --- help
		"h" '(:keymap help-map :wk "Help")
		;;<leader> x --- C-x compatibility
		"x" '(:keymap ctl-x-map :wk "C-x")
		;;<leader> y --- LSP-mode Keymap
		"y" '(:keymap lsp-command-map :package lsp-mode :wk "LSP")
		;;<leader> j --- Buffer
		"b" '(:wk "Buffer")
			"bo" '(other-buffer :wk "Other Buffer")
			"bk" '(kill-buffer :wk "Kill Buffer")
			"bs" '(save-buffer :wk "Save Buffer")
			"bl" '(list-buffers :wk "List Buffers")
			"bm" '(switch-to-buffer :wk "Switch to Buffer")
		;;Buffer movements
		"l" `(,(quq-switch-non-special-buffer next-buffer) :wk "Move to Next Buffer")
		"h" `(,(quq-switch-non-special-buffer previous-buffer) :wk "Move to Previous Buffer")
		"j" '(kill-this-buffer :wk "Kill this Buffer")
		"." '(find-file :wk "Find File"))
	(general-define-key
		:keymaps '(normal motion visual)

		;;Unbinding m first to avoid problems
		"m" nil

		;;<leader> m --- multiple cursors
		"m" '(:wk "Multiple Cursors")
			"mu" '(evil-mc-undo-last-added-cursor :wk "Undo last cursor")
			"mU" '(evil-mc-undo-all-cursors :wk "Undo all cursors")
			"my" '(evil-mc-make-and-goto-next-match :wk "Make a cursor and go to the next selection match")
			"mY" '(evil-mc-make-and-goto-prev-match :wk "Make a cursor and go to the previous selection match")
			"mn" '(evil-mc-skip-and-goto-next-match :wk "Go to the next selection match")
			"mN" '(evil-mc-skip-and-goto-prev-match :wk "Go to the previous selection match")
			"mm" '(evil-mc-make-cursor-here :wk "Make cursor here")
			"mM" `(,(let ((state t))
					(lambda ()
						(interactive)
						(if (eq state t)
					(progn
						(evil-mc-pause-cursors)
						(setq state nil))
							(progn
						(evil-mc-resume-cursors)
						(setq state t))))) :wk "Pause/Resume cursors"))
  (evil-normalize-keymaps)
	:hook ((lsp-mode . (lambda ()
											 ;; Modified directly from emacs-lsp/lsp-mode.el
											 (with-eval-after-load "which-key"
												 (which-key-add-key-based-replacements
													 "SPC y s"   "Sessions"
													 "SPC Y S S" "Start Server"
													 "SPC Y S R" "Restart Server"
													 "SPC Y S Q" "Shutdown Server"
													 "SPC Y S D" "Describe Session"
													 "SPC Y S D" "Disconnect"

													 "SPC Y F"   "Folders"
													 "SPC Y F A" "Add Folder"
													 "SPC Y F R" "Remove Folder"
													 "SPC Y F B" "Un-Blacklist Folder"

													 "SPC Y ="   "Formatting"
													 "SPC Y = R" "Format Region"
													 "SPC Y = =" "Format Buffer"

													 "SPC Y T"   "Toggle"
													 "SPC Y T L" "Toggle Lenses"
													 "SPC Y T H" "Toggle Highlighting"
													 "SPC Y T L" "Toggle Log Io"
													 "SPC Y T S" "Toggle Signature"
													 "SPC Y T S" "Toggle Sideline"
													 "SPC Y T D" "Toggle Documentation Popup"
													 "SPC Y T P" "Toggle Signature Help"
													 "SPC Y T F" "Toggle On Type Formatting"
													 "SPC Y T T" "Toggle Treemacs Integration"

													 "SPC Y G"   "Goto"
													 "SPC Y G G" "Find Definitions"
													 "SPC Y G R" "Find References"
													 "SPC Y G I" "Find Implementations"
													 "SPC Y G D" "Find Declarations"
													 "SPC Y G T" "Find Type Definition"
													 "SPC Y G H" "Call Hierarchy"
													 "SPC Y G A" "Find Symbol In Workspace"
													 "SPC Y G A" "Find Symbol In All Workspaces"

													 "SPC Y H"   "Help"
													 "SPC Y H H" "Describe Symbol At Point"
													 "SPC Y H S" "Signature Help"

													 "SPC Y R"   "Refactor"
													 "SPC Y R R" "Rename"
													 "SPC Y R O" "Organize Imports"

													 "SPC Y A"   "Code Actions"
													 "SPC Y A A" "Code Actions"
													 "SPC Y A L" "Lens"
													 "SPC Y A H" "Highlight Symbol"

													 "SPC Y G"   "Peek"
													 "SPC Y G G" "Peek Definitions"
													 "SPC Y G R" "Peek References"
													 "SPC Y G I" "Peek Implementations"
													 "SPC Y G S" "Peek workspace symbol"))))))
