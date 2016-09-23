;;; package --- Summary

;;; Commentary:
;; Here be pokemons.

;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    Change some settings    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; General settings
(setq user-full-name "Sriram Krishnaswamy")                                    ; Hi Emacs, I'm Sriram
(setq gc-cons-threshold (* 100 1024 1024))                                     ; increase the threshold for garbage collection - 100 MB
(setq delete-old-versions -1)                                                  ; delete excess backup versions silently
(setq version-control t)                                                       ; use version control for backups
(setq backup-directory-alist `(("." . "~/.emacs.d/backups")))                  ; which directory to put backups file
(setq vc-make-backup-files t)                                                  ; make backups file even when in version controlled dir
(setq vc-follow-symlinks t)                                                    ; don't ask for confirmation when opening symlinked file
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t))) ; transform backups file name
(setq inhibit-startup-screen t)                                                ; inhibit useless and old-school startup screen
(setq visible-bell nil)                                                        ; no visible bell for errors
(setq ring-bell-function 'ignore)                                              ; silent bell when you make a mistake
(setq coding-system-for-read 'utf-8)                                           ; use utf-8 by default for reading
(setq coding-system-for-write 'utf-8)                                          ; use utf-8 by default for writing
(setq sentence-end-double-space nil)                                           ; sentence SHOULD end with only a point.
(setq fill-column 80)                                                           ; toggle wrapping text at the 80th character
(setq initial-scratch-message "(hello-human)")                                 ; print a default message in the empty scratch buffer opened at startup
(menu-bar-mode -1)                                                             ; deactivate the menubar
(tool-bar-mode -1)                                                             ; deactivate the toolbar
(scroll-bar-mode -1)                                                           ; deactivate the scrollbar
(tooltip-mode -1)                                                              ; deactivate the tooltip
(setq initial-frame-alist                                                      ; initial frame size
      '((width . 102)                                                          ; characters in a line
	(height . 54)))                                                        ; number of lines
(setq default-frame-alist                                                      ; subsequent frame size
      '((width . 100)                                                          ; characters in a line
	(height . 52)))                                                        ; number of lines
(setq-default cursor-type '(bar . 1))                                          ; let the default cursor shape be a bar - '|'
(blink-cursor-mode -1)                                                         ; don't blink the cursor
(defun display-startup-echo-area-message () (message "Let the games begin!"))  ; change the default startup echo message
(setq-default truncate-lines t)                                                ; if line exceeds screen, let it
(setq large-file-warning-threshold (* 15 1024 1024))                           ; increase threshold for large files
(fset 'yes-or-no-p 'y-or-n-p)                                                  ; prompt for 'y' or 'n' instead of 'yes' or 'no'
(setq-default abbrev-mode t)                                                   ; turn on abbreviations by default
(setq save-abbrevs 'silently)                                                  ; don't inform when saving new abbreviations
(setq ediff-window-setup-function 'ediff-setup-windows-plain                   ; have a plain setup for ediff
      ediff-split-window-function 'split-window-horizontally)                  ; show two vertical windows instead of horizontal ones
(setq recenter-positions '(top middle bottom))                                 ; recenter from the top instead of the middle
(put 'narrow-to-region 'disabled nil)                                          ; enable narrowing to region
(put 'narrow-to-defun 'disabled nil)                                           ; enable narrowing to function
(when (fboundp 'winner-mode)                                                   ; when you can find 'winner-mode'
  (winner-mode 1))                                                             ; activate winner mode
(setq recentf-max-saved-items 1000                                             ; set the number of recent items to be saved
      recentf-exclude '("/tmp/" "/ssh:"))                                      ; exclude the temporary and remote files accessed recently
(setq ns-use-native-fullscreen nil)                                            ; don't use the native fullscreen - more useful in a Mac
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))         ; setup a new custom file
(when (file-exists-p custom-file)                                              ; if the custom file exists
  (load custom-file))                                                          ; load the custom file
(savehist-mode)                                                                ; keep persistent history
(subword-mode 1)                                                               ; move correctly over camelCase words
(add-to-list 'load-path (expand-file-name "config" user-emacs-directory))      ; load more configuration from the 'config' folder
(put 'scroll-left 'disabled nil)                                               ; enable sideward scrolling
(load-theme 'leuven t)                                                         ; load leuven - an awesome default theme
(define-key minibuffer-local-map (kbd "C-w") 'backward-kill-word)              ; backward kill word in minibuffer

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    Package management    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Include the module to install packages
(require 'package)
(setq package-enable-at-startup nil)      ; tells emacs not to load any packages before starting up
;; the following lines tell emacs where on the internet to look up
;; for new packages.
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "https://melpa.org/packages/")))
(package-initialize)                      ; initialize the packages

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)  ; unless it is already installed
  (package-refresh-contents)                ; updage packages archive
  (package-install 'use-package))           ; and install the most recent version of use-package
(require 'use-package)                      ; Source use-package

;; Keep the mode-line clean
(use-package diminish                       ; diminish stuff from the mode-line
  :ensure t                                 ; ensure the package is present
  :demand t                                 ; load the package immediately
  :diminish (visual-line-mode . " ω")        ; diminish the `visual-line-mode'
  :diminish hs-minor-mode                   ; diminish the `hs-minor-mode'
  :diminish abbrev-mode                     ; diminish the `abbrev-mode'
  :diminish auto-fill-function              ; diminish the `auto-fill-function'
  :diminish subword-mode)                   ; diminish the `subword-mode'

;; ;; Make sure the path is set right
;; (use-package exec-path-from-shell
;;   :ensure t
;;   :init
;;   (setq exec-path-from-shell-check-startup-files nil)
;;   :config
;;   ;; (exec-path-from-shell-copy-env "PYTHONPATH")
;;   (when (memq window-system '(mac ns x))
;;     (exec-path-from-shell-initialize)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    General key bindings    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Create consistent keybindings
(use-package general
  :ensure t
  :config
  (general-evil-setup))
(setq sk--emacs-leader "C-c")
(setq sk--evil-local-leader "m")
(general-nvmap :prefix sk--evil-local-leader
	       "" '(nil :which-key "major mode map"))
(setq sk--evil-global-leader "SPC")
(general-nvmap :prefix sk--evil-global-leader
	       "" '(nil :which-key "global map"))

;; hint for bindings
(use-package which-key
  :ensure t
  :demand t
  :diminish which-key-mode
  :general
  (general-define-key "M-m" 'which-key-show-top-level)
  (general-nvmap "M-m" 'which-key-show-top-level)
  (general-iemap "M-m" 'which-key-show-top-level)
  :config
  (which-key-enable-god-mode-support)
  (which-key-mode)
  (which-key-add-key-based-replacements
    "`" "C-c C-c"
    "Z" "zoom"
    "go" "C-x C-e"
    "gS" "C-j"
    "m'" "C-c '"
    "m`" "C-c C-g"
    "m-" "C-c C-k"
    "SPC r" "switch buffers"
    "SPC w" "save buffers"
    "SPC h" "help"
    "SPC k" "kill buffers"
    "SPC y" "kill ring"
    "SPC j" "exec command"
    "SPC J" "major-mode command"
    "SPC f" "find files"))

;;;;;;;;;;;;;;;;;;;;;;;;
;;    Modal states    ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; Evil - Vim emulation
(require 'sk-evil)

;; hydra
(use-package hydra
  :ensure t
  :demand t)
;; window movement hydra
(defhydra hydra-windows (:color red
                         :hint nil)
  "
 ^Move^    ^Size^    ^Change^                    ^Split^           ^Text^
 ^^^^^^^^^^^------------------------------------------------------------------
 ^ ^ _k_ ^ ^   ^ ^ _K_ ^ ^   _u_: winner-undo _o_: rotate  _v_: vertical     _+_: zoom in
 _h_ ^+^ _l_   _H_ ^+^ _L_   _r_: winner-redo _w_: other   _s_: horizontal   _-_: zoom out
 ^ ^ _j_ ^ ^   ^ ^ _J_ ^ ^   _c_: close                  _z_: zoom         _q_: quit
"
  ("h" windmove-left)
  ("j" windmove-down)
  ("k" windmove-up)
  ("l" windmove-right)
  ("H" shrink-window-horizontally)
  ("K" shrink-window)
  ("J" enlarge-window)
  ("L" enlarge-window-horizontally)
  ("v" sk/split-right-and-move)
  ("s" sk/split-below-and-move)
  ("c" delete-window)
  ("o" sk/rotate-windows)
  ("w" other-window :color blue)
  ("z" delete-other-windows)
  ("u" (progn
         (winner-undo)
         (setq this-command 'winner-undo)))
  ("r" winner-redo)
  ("+" text-scale-increase)
  ("-" text-scale-decrease)
  ("q" nil :exit t))
(general-nmap "w" '(hydra-windows/body :which-key "manage windows"))

;; bookmark hydra
(defhydra hydra-bookmarks (:color blue :hint nil)
  "
 _s_: set  _b_: bookmark   _j_: jump   _d_: delete   _q_: quit
  "
  ("s" bookmark-set)
  ("b" bookmark-save)
  ("j" bookmark-jump)
  ("d" bookmark-delete)
  ("q" nil :color blue))
(general-nvmap "+" '(hydra-bookmarks/body :which-key "bookmarks"))

;;;;;;;;;;;;;;;;;;;
;;    Editing    ;;
;;;;;;;;;;;;;;;;;;;

;; snippets
(use-package yasnippet
  :ensure t
  :commands (yas-insert-snippet yas-new-snippet)
  :general
  (general-imap "C-a" '(yas-insert-snippet :which-key "choose snippet"))
  (general-nvmap :prefix sk--evil-global-leader
		 "c" '(yas-new-snippet :which-key "new snippet")
		 "C" '(yas-reload-all :which-key "reload snippets"))
  :diminish (yas-minor-mode . " γ")
  :config
  (setq yas/triggers-in-field t); Enable nested triggering of snippets
  (setq yas-prompt-functions '(yas-completing-prompt))
  (add-hook 'snippet-mode-hook '(lambda () (setq-local require-final-newline nil)))
  (yas-global-mode))

;;;;;;;;;;;;;;;;;;;;;;
;;    Navigation    ;;
;;;;;;;;;;;;;;;;;;;;;;

;; Avy - simulating a mouse click
(use-package avy		     ; avy - a replacement to ace-jump
  :ensure t			     ; ensure the package is loaded
  :demand t
  :init				     ; configuration before the package is laded
  (setq avy-keys-alist		     ; what keys to use for clicking
        `((avy-goto-char-timer . (?j ?k ?l ?f ?s ?d))
	  (avy-goto-char-2 . (?j ?k ?l ?f ?s ?d ?e ?r ?u ?i))
          (avy-goto-line . (?j ?k ?l ?f ?s ?d ?e ?r ?u ?i))))
  (setq avy-style 'pre)			; where the characters should be placed
  (setq avy-background t)		; always highlight the background
  :general				; `general.el' maps
  (general-nvmap "-" nil)
  (general-nvmap "-" '(avy-goto-line :which-key "jump to line"))
  (general-omap "-" '(avy-goto-line :which-key "jump to line"))
  (general-mmap "-" '(avy-goto-line :which-key "jump to line"))
  (general-nvmap "gw" '(avy-goto-char-2 :which-key "jump to 2 char"))
  (general-omap "gw" '(avy-goto-char-2 :which-key "jump to 2 char"))
  (general-mmap "gw" '(avy-goto-char-2 :which-key "jump to 2 char"))
  :config
  (use-package ace-link
    :ensure t
    :demand t
    :general
    (general-nvmap :prefix "\\"
		   "\\" '(nil :which-key "link/clipboard")
		   "h" '(ace-link-help :which-key "help mode link")
		   "i" '(ace-link-info :which-key "info mode link")
		   "w" '(ace-link-eww :which-key "eww mode link")
		   "m" '(ace-link-woman :which-key "woman mode link")
		   "c" '(ace-link-compilation :which-key "compilation mode link")
		   "u" '(ace-link-custom :which-key "custom mode link"))
    :config
    (ace-link-setup-default)))

;; file explorer
(use-package ranger
  :ensure t
  :init
  :general
  (general-nmap :prefix sk--evil-global-leader
		"n" '(ranger :which-key "file explorer")))

;; tags based navigation
(use-package ggtags
  :ensure t
  :defer 2
  :diminish ggtags-mode
  :general
  (general-nmap "T" '(ggtags-find-tag-regexp :which-key "tags in project"))
  :config
  (add-hook 'prog-mode-hook 'ggtags-mode))
;; tags hydra
(defhydra hydra-ggtags (:hint nil
			      :color red)
  "
 ^Tags^              ^Find^
------------------------------------------------------
 _c_: create tags    _d_: find definition      _q_: quit
 _u_: update tags    _f_: find reference
 _r_: reload         _t_: find tag dwim"
  ("c" ggtags-create-tags)
  ("u" ggtags-update-tags)
  ("r" ggtags-reload-tags)
  ("d" ggtags-find-definition)
  ("f" ggtags-find-reference)
  ("t" ggtags-find-tag-dwim)
  ("q" nil :exit t))
(general-nmap :prefix sk--evil-global-leader
	      "t" '(hydra-ggtags/body :which-key "manage tags"))

;; dumb semantic jump
(use-package dumb-jump
  :ensure t
  :general
  (general-nvmap "J" '(dumb-jump-go :which-key "find definition"))
  :init
  (setq dumb-jump-selector 'ivy)
  :config
  (dumb-jump-mode))

;; dash documentation
(use-package dash-at-point
  :ensure t
  :general
  (general-nvmap "K" '(dash-at-point-with-docset :which-key "show doc"))
  (general-nvmap "gD" '(dash-at-point-with-docset :which-key "dash documentation")))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    Debugging using GDB    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq gdb-many-windows t                                                       ; let gdb invoke multiple windows
      gdb-show-main t)                                                         ; focus on the main window

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    Remote edits - Tramp    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(setq tramp-default-method "ssh"                                               ; remote log using ssh
      tramp-backup-directory-alist backup-directory-alist)                     ; use the same backup directory for remote backups

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    Improve aesthetics      ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; rainbow paranthesis for easier viewing
(use-package rainbow-delimiters
  :ensure t
  :demand t
  :config
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  (add-hook 'text-mode-hook 'rainbow-delimiters-mode))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    Convenience packages    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; easy copying between system clipboard and Emacs kill ring
(use-package simpleclip
  :ensure t
  :general
  (general-nvmap :prefix "\\"
		 "d" '(simpleclip-cut :which-key "system clipboard cut")
		 "y" '(simpleclip-copy :which-key "system clipboard copy")
		 "p" '(simpleclip-paste :which-key "system clipboard paste")))

;; cleanup whitespace
(use-package ws-butler
  :ensure t
  :diminish ws-butler-mode
  :config
  (ws-butler-global-mode))

;; restart emacs from emacs
(use-package restart-emacs
  :ensure t
  :general
  (general-nmap :prefix sk--evil-global-leader
		"Q" '(restart-emacs :which-key "restart emacs")))

;; discovering the major mode bindings and details
(use-package discover-my-major
  :ensure t
  :bind (("C-h B" . discover-my-major)
         ("C-h M" . discover-my-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    Convenience functions    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; VERY useful
(require 'sk-functions)

;;;;;;;;;;;;;;;;;;;
;;    Writing    ;;
;;;;;;;;;;;;;;;;;;;

;; markdown and pandoc support
(use-package markdown-mode
  :ensure t
  :mode ("\\.markdown\\'" "\\.mkd\\'" "\\.md\\'")
  :config
  (use-package pandoc-mode
    :ensure t
    :mode ("\\.markdown\\'" "\\.mkd\\'" "\\.md\\'")))

;; LaTeX support
(use-package tex-site
  :defer 2
  :ensure auctex
  :ensure auctex-latexmk
  :mode (("\\.tex\\'" . LaTeX-mode)
	 ("\\.xtx\\'" . LaTeX-mode))
  :general
  (general-nvmap :prefix sk--evil-local-leader
		 "x" '(hydra-latex/body :which-key "latex"))
  :init
  (setq reftex-plug-into-AUCTeX t)
  (setq reftex-default-bibliography '("~/Dropbox/PhD/articles/tensors/tensors.bib"))
  (setq TeX-auto-save t)
  (setq TeX-parse-self t)
  (setq-default TeX-master nil)
  (setq TeX-PDF-mode t)
  :config
  ;; Use Skim as viewer, enable source <-> PDF sync
  ;; make latexmk available via C-c C-c
  ;; Note: SyncTeX is setup via ~/.latexmkrc (see below)
  (add-hook 'LaTeX-mode-hook (lambda ()
			       (push
				'("latexmk" "latexmk -xelatex -pdf %s" TeX-run-TeX nil t
				  :help "Run latexmk on file")
				TeX-command-list)))
  (add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "latexmk")))
  ;; use Skim as default pdf viewer
  ;; Skim's displayline is used for forward search (from .tex to .pdf)
  ;; option -b highlights the current line; option -g opens Skim in the background
  (setq TeX-view-program-selection '((output-pdf "PDF Viewer")))
  (setq TeX-view-program-list
	'(("PDF Viewer" "/Applications/Skim.app/Contents/SharedSupport/displayline -b -g %n %o %b"))))
;; custom function to setup latex mode properly - why isn't the normal use-package definition working?
(defun sk/setup-latex ()
  "hooks to setup latex properly"
  (interactive)
  (visual-line-mode)
  (flyspell-mode)
  (auctex-latexmk-setup)
  (reftex-mode)
  (turn-on-reftex))
(add-hook 'LaTeX-mode-hook 'sk/setup-latex)
(defun sk/diminish-reftex ()
  "diminish reftex because use-package is unable to do it"
  (interactive)
  (diminish 'reftex-mode))
(add-hook 'reftex-mode-hook 'sk/diminish-reftex)

;; hydra for latex
(defhydra hydra-latex (:color pink :hint nil)
  "
 ^LaTeX^                                                ^Commands^
^^^^^^^^^^----------------------------------------------------------------------------------------------------
 _l_: preview at pt   _i_: fill region    _v_: tex view     _c_: command master    _O_: cmd kill      _q_: quit
 _L_: preview buffer  _b_: fill para      _m_: master file  _o_: compile output    _C_: preview clear
 _f_: fill env        _s_: fill section   _h_: home buffer  _r_: cmd run all       _x_: setup
"
  ("l" preview-at-point)
  ("L" preview-buffer :color blue)
  ("f" LaTeX-fill-environment)
  ("i" LaTeX-fill-region)
  ("b" LaTeX-fill-paragraph)
  ("s" LaTeX-fill-section)
  ("v" TeX-view :color blue)
  ("m" TeX-master-file-ask :color blue)
  ("h" TeX-home-buffer)
  ("c" TeX-command-master :color blue)
  ("o" TeX-recenter-output-buffer :color blue)
  ("r" TeX-command-run-all :color blue)
  ("O" TeX-kill-job :color blue)
  ("C" preview-clearout-buffer :color blue)
  ("x" sk/setup-latex :color blue)
  ("q" nil :color blue))

;; pick out weasel words
(use-package writegood-mode
  :ensure t
  :diminish writegood-mode
  :general
  (general-nvmap "g]" '(writegood-grade-level :which-key "grade writing"))
  (general-nvmap "g[" '(writegood-reading-ease :which-key "grade reading"))
  :config
  (progn
    (add-hook 'text-mode-hook 'writegood-mode)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    Version control    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; best git wrapper ever
(use-package magit
  :ensure t
  :general
  (general-nvmap :prefix sk--evil-global-leader "e" '(magit-status :which-key "git status"))
  (general-nvmap "gb" '(magit-blame :which-key "git blame"))
  (general-evil-define-key '(normal visual) 'magit-blame-mode-map
    "q" (general-simulate-keys "q" t "quit")
    "n" (general-simulate-keys "n" t "quit")
    "p" (general-simulate-keys "p" t "quit")
    "N" (general-simulate-keys "N" t "quit")
    "P" (general-simulate-keys "P" t "quit")
    "t" (general-simulate-keys "t" t "quit")
    "y" (general-simulate-keys "y" t "quit")
    "d" (general-simulate-keys "SPC" t "quit")
    "u" (general-simulate-keys "DEL" t "quit")
    "c" (general-simulate-keys "RET" t "quit")
    "RET" (general-simulate-keys "RET" t "quit"))
  :config
  (use-package evil-magit
    :ensure t
    :demand t
    :init
    (setq evil-magit-want-horizontal-movement t))
  ;; Github integration - press '@' in Magit status
  (use-package magithub
    :ensure t))

;; highlight diffs
(use-package diff-hl
  :ensure t
  :commands (global-diff-hl-mode
             diff-hl-mode
             diff-hl-next-hunk
             diff-hl-previous-hunk
             diff-hl-mark-hunk
             diff-hl-diff-goto-hunk
             diff-hl-revert-hunk)
  :general
  (general-nvmap "[h" '(diff-hl-previous-hunk :which-key "previous hunk"))
  (general-nvmap "]h" '(diff-hl-next-hunk :which-key "next hunk"))
  (general-tomap "h" '(diff-hl-mark-hunk :which-key "hunk"))
  (general-nvmap "gh" '(diff-hl-diff-goto-hunk :which-key "goto hunk"))
  (general-nvmap "gH" '(diff-hl-revert-hunk :which-key "revert hunk"))
  :config
  (global-diff-hl-mode)
  (diff-hl-flydiff-mode)
  (diff-hl-margin-mode)
  (diff-hl-dired-mode))

;; git timemachine
(use-package git-timemachine
  :ensure t
  :general
  (general-nmap "gl" '(git-timemachine-toggle :which-key "git timemachine"))
  (general-nmap "gL" '(git-timemachine-switch-branch :which-key "git timemachine branch")))

;; posting gists
(use-package yagist
  :ensure t
  :init
  (setq yagist-encrypt-risky-config t)
  :general
  (general-nmap "gp" '(yagist-region-or-buffer :which-key "create gist"))
  (general-nmap "gP" '(yagist-region-or-buffer-private :which-key "create private gist")))

;; browse remote packages
(use-package browse-at-remote
  :ensure t
  :general
  (general-nmap "gI" '(browse-at-remote :which-key "browse remote")))

;;;;;;;;;;;;;;;
;;    Org    ;;
;;;;;;;;;;;;;;;

;; org configuration
(require 'sk-org)

;;;;;;;;;;;;;;;;;;;;;;;
;;    Programming    ;;
;;;;;;;;;;;;;;;;;;;;;;;

;; better tabs and spaces convention
(use-package editorconfig
  :ensure t
  :demand t
  :config
  (editorconfig-mode 1))

;; start services
(use-package prodigy
  :ensure t
  :commands (prodigy)
  :general
  (general-nvmap :prefix sk--evil-global-leader
		 "g" '(prodigy :which-key "background process"))
  (general-evil-define-key '(normal visual) 'prodigy-mode-map
    "q" (general-simulate-keys "q" t "quit")
    "s" (general-simulate-keys "s" t "start")
    "S" (general-simulate-keys "S" t "stop"))
  :init
  (prodigy-define-tag
   :name 'blog
   :ready-message "Serving blog. Ctrl-C to shutdown server")
  (prodigy-define-service
   :name "personal blog build"
   :command "hexo"
   :args '("generate")
   :cwd "/Users/sriramkswamy/Dropbox/blog"
   :tags '(blog)
   :kill-signal 'sigkill)
  (prodigy-define-service
   :name "personal blog view"
   :command "hexo"
   :args '("server")
   :cwd "/Users/sriramkswamy/Dropbox/blog"
   :tags '(blog)
   :kill-signal 'sigkill
   :kill-process-buffer-on-stop t)
  (prodigy-define-service
   :name "personal blog publish"
   :command "hexo"
   :args '("deploy")
   :cwd "/Users/sriramkswamy/Dropbox/blog"
   :tags '(blog)
   :kill-signal 'sigkill)
  (prodigy-define-service
   :name "watchandcode blog build"
   :command "hexo"
   :args '("generate")
   :cwd "/Users/sriramkswamy/Downloads/JS/watchandcode"
   :tags '(blog)
   :kill-signal 'sigkill)
  (prodigy-define-service
   :name "watchandcode blog view"
   :command "hexo"
   :args '("server")
   :cwd "/Users/sriramkswamy/Downloads/JS/watchandcode"
   :tags '(blog)
   :kill-signal 'sigkill
   :kill-process-buffer-on-stop t)
  (prodigy-define-service
   :name "watchandcode blog publish"
   :command "hexo"
   :args '("deploy")
   :cwd "/Users/sriramkswamy/Downloads/JS/watchandcode"
   :tags '(blog)
   :kill-signal 'sigkill))

;; YAML mode
(use-package yaml-mode
  :ensure t
  :mode ("\\.yml$" "\\.yaml$"))

;; error checking
(use-package flycheck
  :ensure t
  :defer 2
  :general
  (general-nmap "[l" '(flycheck-previous-error :which-key "previous error"))
  (general-nmap "]l" '(flycheck-next-error :which-key "next error"))
  (general-nmap :prefix sk--evil-global-leader "l" '(flycheck-list-errors :which-key "list errors"))
  :config
  (global-flycheck-mode))

;; autocompletion
(use-package company
  :ensure t
  :init
  (setq company-minimum-prefix-length 2
	company-require-match 0
	company-selection-wrap-around t
	company-dabbrev-downcase nil
	company-tooltip-limit 20                      ; bigger popup window
	company-tooltip-align-annotations 't          ; align annotations to the right tooltip border
	company-idle-delay .2                         ; decrease delay before autocompletion popup shows
	company-begin-commands '(self-insert-command)) ; start autocompletion only after typing
  (eval-after-load 'company
    '(add-to-list 'company-backends '(company-files
				      company-capf)))
  :general
  (general-imap "C-d" 'company-complete)
  :bind (("C-c f" . company-files)
	 ("C-c a" . company-dabbrev)
	 ("C-c d" . company-ispell)
	 :map company-active-map
	 ("C-n"    . company-select-next)
	 ("C-p"    . company-select-previous)
	 ([return] . company-complete-selection)
	 ([tab]    . yas/expand)
	 ("C-f"    . company-search-filtering)
	 ("C-w"    . backward-kill-word)
	 ("C-c"    . company-abort)
	 ("C-c"    . company-search-abort))
  :diminish (company-mode . " ς")
  :config
  (global-company-mode)
  ;; C++ header completion
  (use-package company-c-headers
    :ensure t
    :bind (("C-c c" . company-c-headers))
    :config
    (add-to-list 'company-backends 'company-c-headers))
  ;; Python auto completion
  (use-package company-jedi
    :ensure t
    :bind* (("C-c j" . company-jedi))
    :config
    (add-to-list 'company-backends 'company-jedi))
  ;; Tern for JS
  (use-package company-tern
    :ensure t
    :bind (("C-c t" . company-tern))
    :init
    (setq company-tern-property-marker "")
    (setq company-tern-meta-as-single-line t)
    :config
    (add-to-list 'company-backends 'company-tern))
  ;; HTML completion
  (use-package company-web
    :ensure t
    :bind (("C-c w" . company-web-html))
    :config
    (add-to-list 'company-backends 'company-web-html))
  ;; LaTeX autocompletion
  (use-package company-auctex
    :ensure t
    :bind (("C-c l" . company-auctex))
    :config
    (add-to-list 'company-backends 'company-auctex)))

;; Shell interaction
(require 'sk-shell)

;; additional configuration - this is where language specific configurations reside
(require 'sk-programming)

;;;;;;;;;;;;;;;
;;    Fun    ;;
;;;;;;;;;;;;;;;

;; google stuff
(use-package google-this
  :ensure t
  :config
  (defun sk/google-this ()
    "Google efficiently"
    (interactive)
    (if (region-active-p)
	(google-this-region 1)
      (google-this-symbol 1)))
  :general
  (general-nvmap "gG" '(sk/google-this :which-key "google")))

;; creepy function
(defun hello-human ()
  "The scratch function for fun"
  (interactive)
  (message (concat "I know who you are, " user-full-name)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    Narrowing packages    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; ivy
(require 'sk-ivy)
;; helm
;; (require 'sk-helm)
;; (helm-ido-like)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    Included packages    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; dired, doc-view and all that
(require 'sk-included)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;    Local configuration    ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; load the local configuration if it exists
(when (file-exists-p (concat user-emacs-directory "local.el"))
  (load-file (concat user-emacs-directory "local.el")))

;;;;;;;;;;;;;;;;;;;;;;;;
;;    Start server    ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(use-package server
  :config
  (unless (server-running-p)
    (server-start)))
