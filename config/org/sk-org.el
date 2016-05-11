;;; sk-org.el --- Global settings -*- lexical-binding: t; -*-

;;; Commentary:

;; Org mode configurations and helpers

;;; Code:

;; Basic settings
(setq org-directory "~/Dropbox/org"
      org-completion-use-ido nil
      ;; Emphasis
      org-hide-emphasis-markers t
      ;; Indent
      org-startup-indented t
      org-hide-leading-stars t
      ;; Images
      org-image-actual-width '(300)
      ;; Source code
      org-src-fontify-natively t
      org-src-tab-acts-natively t
      ;; Links
      org-return-follows-link t
      ;; Quotes
      org-export-with-smart-quotes t
      ;; Citations
      org-latex-to-pdf-process '("pdflatex %f" "biber %b" "pdflatex %f" "pdflatex %f")
      org-export-backends '(ascii beamer html latex md))

;; Refile settings
(setq org-refile-targets '((nil :maxlevel . 9)
                           (org-agenda-files :maxlevel . 9)))
(setq org-refile-use-outline-path t
      org-outline-path-complete-in-steps nil)

;; Tags with fast selection keys
(setq org-tag-alist (quote (("errand" . ?e)
                            ("books" . ?b)
                            ("meeting" . ?m)
                            ("article" . ?a) ;; temporary
                            ("reference" . ?r) ;; temporary
                            ("courses" . ?c) ;; temporary
			    ("coding" . ?C)
                            ("films" . ?f)
                            ("story" . ?s)
                            ("ledger" . ?l)
                            ("gubby" . ?g)
			    ("online" . ?o)
                            ("cash" . ?$)
                            ("card" . ?d)
                            ("idea" . ?i)
			    ("technical" . ?t)
                            ("personal" . ?p)
                            ("project" . ?P)
                            ("job" . ?j)
                            ("work" . ?w)
                            ("home" . ?h)
                            ("vague" . ?v)
                            ("noexport" . ?x)
                            ("note" . ?n))))

;; TODO Keywords
(setq org-todo-keywords
      '((sequence "☛ TODO(t)" "○ IN-PROGRESS(i)" "|" "✓ DONE(d!)")
	(sequence "⚑ WAITING(w@/!)" "|" "✗ CANCELED(c@)")
	))

;; Agenda settings
(setq org-agenda-files (list
			"~/Dropbox/org/blog.org"
			"~/Dropbox/org/errands.org"
			"~/Dropbox/org/phd.org"
			"~/Dropbox/org/references/articles.org"
			"~/Dropbox/org/ledger.org"
			"~/Dropbox/org/notes.org"
			"~/Dropbox/org/fun.org"
			))

(setq org-deadline-warning-days 7
      org-agenda-span 'fortnight
      org-agenda-skip-scheduled-if-deadline-is-shown t)

;; Links
(setq org-link-abbrev-alist
      '(("bugzilla"  . "http://10.1.2.9/bugzilla/show_bug.cgi?id=")
        ("url-to-ja" . "http://translate.google.fr/translate?sl=en&tl=ja&u=%h")
        ("google"    . "http://www.google.com/search?q=")
        ("gmaps"      . "http://maps.google.com/maps?q=%s")))

;; Lispy prompt for org
(defvar oc-capture-prmt-history nil
  "History of prompt answers for org capture.")
(defun oc/prmt (prompt variable)
  "PROMPT for string, save it to VARIABLE and insert it."
  (make-local-variable variable)
  (set variable (read-string (concat prompt ": ") nil oc-capture-prmt-history)))

;; Capture templates
(setq org-capture-templates
      '(("n"               ; key
         "Note"            ; name
         entry             ; type
         (file+headline "~/Dropbox/org/notes.org" "Notes")  ; target
         "* %? %(org-set-tags)  :note:
:PROPERTIES:
:Created: %U
:Linked: %A
:END:
%i"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
        )
        ("l"               ; key
         "Ledger"          ; name
         entry             ; type
         (file+datetree "~/Dropbox/org/ledger.org" "Ledger")  ; target
         "* %^{expense} %(org-set-tags)  :accounts:
:PROPERTIES:
:Created: %U
:END:
%i
#+NAME: %\\1-%t
#+BEGIN_SRC ledger :noweb yes
%^{Date of expense (yyyy/mm/dd)} %^{'*' if cleared, else blank} %\\1
    %^{Account name}                                $%^{Amount}
    %?
#+END_SRC
"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
        )
        ("w"               ; key
         "Work"            ; name
         entry             ; type
         (file+headline "~/Dropbox/org/phd.org" "Work")  ; target
         "* ☛ TODO %^{Todo} %(org-set-tags)  :work:
:PROPERTIES:
:Created: %U
:END:
%i
%?"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
        )
        ("s"               ; key
         "story"           ; name
         entry             ; type
         (file+headline "~/Dropbox/org/fun.org" "Reading")  ; target
         "* %^{Title} %(org-set-tags)
:PROPERTIES:
:Created: %U
:END:
%i
%?"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
        )
        ("m"               ; key
         "Meeting"         ; name
         entry             ; type
         (file+datetree "~/Dropbox/org/phd.org" "Meeting")  ; target
         "* %^{Title} %(org-set-tags)  :meeting:
:PROPERTIES:
:Created: %U
:END:
%i
Minutes of the meeting:
%?"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
        )
        ("j"               ; key
         "Jobs"            ; name
         entry             ; type
         (file+headline "~/Dropbox/org/notes.org" "Jobs")  ; target
         "* %^{Title, Company} %(org-set-tags)  :job:
:PROPERTIES:
:Created: %U
:END:
%i
Referral: %^{referral}
Experience: %^{experience}
Description:
%?"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
        )
        ("f"               ; key
         "films"          ; name
         entry             ; type
         (file+headline "~/Dropbox/org/fun.org" "Movies")  ; target
         "* %^{Movie} %(org-set-tags)  :film:
:PROPERTIES:
:Created: %U
:END:
%i
Netflix?: %^{netflix? Yes/No}
Genre: %^{genre}
Description:
%?"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
        )
        ("b"               ; key
         "Blog"            ; name
         entry             ; type
         (file+headline "~/Dropbox/org/blog.org" "Blog")  ; target
         "* %^{Title} %(org-set-tags)  :blog:
:PROPERTIES:
:Created: %U
:END:
%i
%?"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
        )
        ("e"               ; key
         "Errands"         ; name
         entry             ; type
         (file+headline "~/Dropbox/org/errands.org" "Errands")  ; target
         "* ☛ TODO %^{Todo} %(org-set-tags)  :errands:
:PROPERTIES:
:Created: %U
:END:
%i
%?"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
        )
        ("c"               ; key
         "Courses"         ; name
         entry             ; type
         (file+headline "~/Dropbox/org/phd.org" "Courses")  ; target
         "* %^{Course} %(org-set-tags)  :courses:
:PROPERTIES:
:Created: %U
:END:
%i
%?"  ; template
         :prepend t        ; properties
         :empty-lines 1    ; properties
         :created t        ; properties
        )
        ))

;; Bindings for org mode
(use-package org
  :ensure t
  :bind (
	 ("C-c O a" . org-agenda)
	 ("C-c O c" . org-capture)
	 ("C-c O i" . org-insert-link)
	 ("C-c O s" . org-store-link)
	 ("C-c O S" . org-list-make-subtree)
	 ("C-c O A" . org-archive-subtree)
	 ("C-c O g" . org-goto)
	 ("C-c O l" . org-toggle-latex-fragment)
	 ("C-c O L" . org-toggle-link-display)
	 ("C-c O I" . org-toggle-inline-images)
	 ("C-c O k" . org-cut-subtree)
	 ("C-c O V" . org-reveal)
	 ("C-c O R" . org-refile)
	 ("C-c O y" . org-copy-subtree)
	 ("C-c O h" . org-toggle-heading)
	 ("C-c O H" . org-insert-heading-respect-content)
	 ("C-c O e" . org-export-dispatch)
	 ("C-c O u" . org-update-dblock)
	 ("C-c O U" . org-update-all-dblocks)
	 ("C-c O F" . org-footnote)
	 ("C-c O ]" . org-narrow-to-subtree)
	 ("C-c O [" . widen)
	 ("C-c O N" . org-note)
	 ("C-c O O" . org-open-at-point)
	 ("C-c O F" . org-attach)
	 ("C-c O E" . org-set-effort)
	 ("C-c O B" . org-table-blank-field)
	 ("C-c O M" . org-mark-subtree)
	 ("C-c O <" . org-date-from-calendar)
	 ("C-c O >" . org-goto-calendar)
	 ("C-c O d" . org-todo)
	 ("C-c O t" . org-set-tags-command))
  :config
  (which-key-add-key-based-replacements
    "C-c O" "org mode prefix"))

;; LaTeX
(use-package cdlatex
  :ensure t
  :mode "\\.org\\'"
  :diminish org-cdlatex-mode)

;; Babel for languages
(use-package babel
  :ensure t
  :init
  (setq org-confirm-babel-evaluate nil)
  :defer t
  :config
  (use-package ob-ipython
    :ensure t
    :defer t))

;; For PDF note taking
(use-package interleave
  :ensure t
  :bind (
	 ("C-c O n" . interleave)
	 )
  :commands (interleave interleave-pdf-mode))

;; Org export extras
(use-package ox-reveal
  :ensure t
  :defer t
  :init
  (setq org-reveal-title-slide-template
	"<h1>%t</h1>
<h3>%a</h3>
"
	)
  (setq org-reveal-root "file:///Users/sriramkswamy/Documents/workspace/github/reveal.js"))
(use-package ox-twbs
  :ensure t
  :defer t)

;; Drag and drop images into org mode
(use-package org-download
  :ensure t
  :defer 2)

;; Put a file system tree right into org
(use-package org-fstree
  :ensure t
  :defer t)

;; Deft for quick org notes access
(use-package deft
  :ensure t
  :commands (deft)
  :bind (
	 ("C-c O f" . deft)
	 )
  :init
  (setq deft-extensions '("org")
	deft-recursive t
	deft-use-filename-as-title t
	deft-directory "~/Dropbox/org"))

;; Org ref for academic papers
(use-package org-ref
  :ensure t
  :mode ("\\.org\\'" "\\.bib\\'" "\\.tex\\'" "\\.xtx\\'")
  :init
  (setq org-ref-completion-library 'org-ref-ivy-bibtex)
  (setq org-ref-notes-directory "~/Dropbox/org/references/notes"
	org-ref-bibliography-notes "~/Dropbox/org/references/articles.org"
	org-ref-default-bibliography '("~/Dropbox/org/references/multiphysics.bib" "~/Dropbox/org/references/chanceconstraints.bib")
	org-ref-pdf-directory "~/Dropbox/org/references/pdfs/")
  :config
  (use-package helm
    :ensure t
    :config
    (use-package helm-bibtex
      :ensure t)))

;; Fancy bullets
(use-package org-bullets
  :ensure t
  :diminish org-indent-mode
  :config
  (progn
    (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))))

;; Org load languages
(defun sk/org-custom-load ()
  (interactive)
  (require 'org-fstree)
  (require 'ox-reveal)
  (require 'ox-twbs)
  (require 'org-ref)
  (require 'org-ref-latex)
  (require 'org-ref-pdf)
  (require 'org-ref-url-utils)
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((emacs-lisp . t)
     ;; (dot . t)
     ;; (ditaa . t)
     (latex . t)
     ;; (gnuplot . t)
     (sh . t)
     ;; (C . t)
     (ledger . t)
     ;; (R . t)
     ;; (octave . t)
     (matlab . t)
     (python . t))))

;; Add obvious org mode hooks
(add-hook 'org-mode-hook 'visual-line-mode)
(add-hook 'org-mode-hook 'flyspell-mode)

;; which key explanations
(require 'sk-org-hydra)
(require 'sk-org-modalka)

(provide 'sk-org)
;;; sk-org.el ends here