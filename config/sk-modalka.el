;;; sk-modalka.el --- Global settings -*- lexical-binding: t; -*-

;;; Commentary:

;; My custom maps for modal editing based on Modalka. This follows a Vi-style
;; editing

;;; Code:

(sk/require-package 'modalka)
(setq modalka-cursor-type 'box)

(modalka-define-kbd "h" "C-b")
(modalka-define-kbd "j" "C-n")
(modalka-define-kbd "k" "C-p")
(modalka-define-kbd "l" "C-f")
(modalka-define-kbd "e" "M-f")
(modalka-define-kbd "b" "M-b")
(modalka-define-kbd "n" "M-n")
(modalka-define-kbd "N" "M-p")
(modalka-define-kbd "{" "M-{")
(modalka-define-kbd "}" "M-}")
(modalka-define-kbd "0" "C-a")
(modalka-define-kbd "$" "C-e")
(modalka-define-kbd "(" "M-a")
(modalka-define-kbd ")" "M-e")
(modalka-define-kbd "G" "M->")
(modalka-define-kbd "s" "C-s")
(modalka-define-kbd "d" "C-w")
(modalka-define-kbd "y" "M-w")
(modalka-define-kbd "p" "C-y")
(modalka-define-kbd "P" "M-y")
(modalka-define-kbd "x" "C-d")
(modalka-define-kbd "D" "C-k")
(modalka-define-kbd "z" "C-l")
(modalka-define-kbd "J" "C-v")
(modalka-define-kbd "K" "M-v")
(modalka-define-kbd "L" "C-x <")
(modalka-define-kbd "H" "C-x >")
(modalka-define-kbd "I" "C-M-i")
(modalka-define-kbd "'" "C-c '")
(modalka-define-kbd "Z" "C-x 1")
(modalka-define-kbd "q" "C-x (")
(modalka-define-kbd "Q" "C-x )")
(modalka-define-kbd "." "C-x z")
(modalka-define-kbd "?" "C-x ?")
(modalka-define-kbd "v" "C-SPC")
(modalka-define-kbd "X" "C-x C-x")
(modalka-define-kbd "V" "C-c v C-v")
(modalka-define-kbd "\\" "C-c C-c")

(modalka-define-kbd "g g" "M-<")
(modalka-define-kbd "g o" "C-x C-e")
(modalka-define-kbd "g m" "C-c v g m")
(modalka-define-kbd "g f" "C-c v g f")
(modalka-define-kbd "g u" "C-c v g u")
(modalka-define-kbd "g U" "C-c v g U")
(modalka-define-kbd "g T" "C-c v g T")
(modalka-define-kbd "g r" "C-c v R")
(modalka-define-kbd "g w" "C-x 3")
(modalka-define-kbd "g W" "C-x 2")
(modalka-define-kbd "g S" "C-j")

(modalka-define-kbd "i a" "C-x h")

(modalka-define-kbd "[ {" "C-M-u")
(modalka-define-kbd "] }" "C-M-d")
(modalka-define-kbd "[ [" "C-M-p")
(modalka-define-kbd "] ]" "C-M-n")
(modalka-define-kbd "[ m" "C-M-b")
(modalka-define-kbd "] m" "C-M-f")
(modalka-define-kbd "[ f" "C-M-a")
(modalka-define-kbd "] f" "C-M-e")

(modalka-define-kbd ": w" "C-x C-s")
(modalka-define-kbd ": e" "C-x C-f")
(modalka-define-kbd ": q" "C-x C-c")
(modalka-define-kbd ": b d" "C-x k")
(modalka-define-kbd ": b u" "C-x b")
(modalka-define-kbd ": l s" "C-x C-b")

(modalka-define-kbd "SPC j" "M-x")
(modalka-define-kbd "SPC a" "C-x b")
(modalka-define-kbd "SPC k" "C-x k")
(modalka-define-kbd "SPC d" "C-x d")
(modalka-define-kbd "SPC c" "C-x c")
(modalka-define-kbd "SPC q" "C-x 0")
(modalka-define-kbd "SPC f" "C-x C-f")
(modalka-define-kbd "SPC w" "C-x C-s")
(modalka-define-kbd "SPC i" "C-c C-e")

;; aux requirements
(require 'sk-modalka-bindings)
(require 'sk-modalka-diminish)

(provide 'sk-modalka)
;;; sk-modalka.el ends here
