(defun quq/bind-org-keys ()
	(with-eval-after-load "which-key"
		(general-define-key
			:keymaps '(normal motion emacs)
			:prefix "SPC"
			:non-normal-prefix "C-SPC"
			;;<leader> n --- notes
			"n" '(:wk "Org Notes")
				"nL" '(org-latex-preview :wk "Org LaTeX preview")
				"ne" '(:wk "Export")
					"neh" '(org-html-export-to-html :wk "Export to HTML")
					"neH" '(quq/org-export-html-on-save :wk "Export to HTML on save"))))

(defun quq/org-export-html-on-save ()
	(interactive)
	(add-hook 'after-save-hook 'org-html-export-to-html 90 t))

(use-package org
	:straight t
	:defer t
	:hook ((org-mode . quq/bind-org-keys))
	:custom
	(org-confirm-babel-evaluate (lambda (language code)
																(if (string= language "gnuplot")
																		nil
																		t)))
	:config
	(org-babel-do-load-languages
	 'org-babel-load-languages
	 '((gnuplot . t))))

(use-package gnuplot
	:straight t
	:after org)
