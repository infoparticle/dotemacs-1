;;;;;;;;;;;;;;;;;;;;
;;    Markdown    ;;
;;;;;;;;;;;;;;;;;;;;

;; markdown and pandoc support
(use-package markdown-mode
  :ensure t
  :mode (("\\.txt\\'" . markdown-mode)
		 ("\\.md\\'" . markdown-mode)
         ("\\.mkd\\'" . markdown-mode)
         ("\\.markdown\\'" . markdown-mode))

  :config

  ;; pandoc
  (use-package pandoc-mode
	:ensure t
	:diminish pandoc-mode
	:config
	(add-hook 'markdown-mode-hook 'pandoc-mode))

  ;; nice hooks
  (add-hook 'markdown-mode-hook 'visual-line-mode)
  (add-hook 'gfm-mode-hook 'visual-line-mode)

  ;; markdown bindings
  (ryo-modal-major-mode-keys
   'markdown-mode
   ;; navigation
   ("m j" markdown-next-visible-heading :name "next heading")
   ("m k" markdown-previous-visible-heading :name "previous heading")
   ("m h" markdown-up-heading :name "up heading")
   ;; organizing
   ("m RET" markdown-follow-thing-at-point :name "jump")
   ("m d" markdown-kill-thing-at-point :name "delete")
   ("m [" markdown-move-up :name "move up")
   ("m ]" markdown-move-down :name "move down")
   ("m <" markdown-promote :name "promote")
   ("m >" markdown-demote :name "demote")

   ;; inserting
   ("m i i" markdown-insert-italic :name "italic" :exit t)
   ("m i b" markdown-insert-bold :name "bold" :exit t)
   ("m i h" markdown-insert-hr :name "horizontal rule" :exit t)
   ("m i l" markdown-insert-link :name "link" :exit t)
   ("m i r" markdown-insert-reference-link :name "ref link" :exit t)
   ("m i w" markdown-insert-wiki-link :name "wiki link" :exit t)
   ("m i u" markdown-insert-uri :name "uri" :exit t)
   ("m i f" markdown-insert-footnote :name "footnote" :exit t)
   ("m i m" markdown-insert-image :name "image" :exit t)
   ("m i g" markdown-insert-reference-image :name "ref image" :exit t)
   ("m i c" markdown-insert-gfm-code-block :name "gfm code" :exit t)
   ("m i p" markdown-insert-pre :name "pre" :exit t)
   ("m i q" markdown-insert-blockquote :name "blockquote" :exit t)
   ("m i t" markdown-insert-list-item :name "list item" :exit t)
   ("m i k" markdown-insert-kbd :name "kbd" :exit t)
   ("m i 1" markdown-insert-header-atx-1 :name "atx h1" :read t)
   ("m i 2" markdown-insert-header-atx-2 :name "atx h2" :read t)
   ("m i 3" markdown-insert-header-atx-3 :name "atx h3" :read t)
   ("m i 4" markdown-insert-header-atx-4 :name "atx h4" :read t)
   ("m i 5" markdown-insert-header-atx-5 :name "atx h5" :read t)
   ("m i 6" markdown-insert-header-atx-6 :name "atx h6" :read t)
   ("m i =" markdown-insert-header-setext-1 :name "setext h1" :read t)
   ("m i -" markdown-insert-header-setext-2 :name "setext h2" :read t)

   ;; preview
   ("m l" markdown-toggle-inline-images :name "toggle images")
   ("m m" markdown-export :name "export")
   ("m x" markdown-export-and-preview :name "export and preview")
   ("m v" markdown-preview :name "markdown preview")
   ("m c" markdown-check-refs :name "check refs")
   ("m n" markdown-cleanup-list-numbers :name "cleanup list numbers")
   ("m o" markdown-complete-buffer :name "complete buffer")
   ("m w" markdown-other-window :name "other window")
   ;; pandoc
   ("m g" pandoc-main-hydra/body :name "pandoc")))

;; ryo major mode hints
(which-key-add-major-mode-key-based-replacements 'markdown-mode
  "m i" "insert")

;; provide this config
(provide 'sk-markdown)
