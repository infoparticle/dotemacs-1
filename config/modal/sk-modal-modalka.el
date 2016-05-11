;;; sk-modal-modalka.el --- Global settings -*- lexical-binding: t; -*-

;;; Commentary:

;; Modalka bindings

;;; Code:

(modalka-define-kbd "0" "C-0")
(modalka-define-kbd "1" "C-1")
(modalka-define-kbd "2" "C-2")
(modalka-define-kbd "3" "C-3")
(modalka-define-kbd "4" "C-4")
(modalka-define-kbd "5" "C-5")
(modalka-define-kbd "6" "C-6")
(modalka-define-kbd "7" "C-7")
(modalka-define-kbd "8" "C-8")
(modalka-define-kbd "9" "C-9")

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
(modalka-define-kbd "/" "C-s")
(modalka-define-kbd "y" "M-w")
(modalka-define-kbd "p" "C-y")
(modalka-define-kbd "P" "M-y")
(modalka-define-kbd "x" "C-d")
(modalka-define-kbd "D" "C-k")
(modalka-define-kbd "z" "C-l")
(modalka-define-kbd "&" "M-!")
(modalka-define-kbd "!" "M-&")
(modalka-define-kbd "J" "C-v")
(modalka-define-kbd "K" "M-v")
(modalka-define-kbd "M" "C-u")
(modalka-define-kbd "d" "C-S-w")
(modalka-define-kbd "L" "C-x <")
(modalka-define-kbd "H" "C-x >")
(modalka-define-kbd "'" "C-c '")
(modalka-define-kbd "Z" "C-x 1")
(modalka-define-kbd "q" "C-x (")
(modalka-define-kbd "Q" "C-x )")
(modalka-define-kbd "." "C-x z")
(modalka-define-kbd "?" "C-x ?")
(modalka-define-kbd "v" "C-SPC")
(modalka-define-kbd "=" "C-c v =")
(modalka-define-kbd "R" "C-c v R")
(modalka-define-kbd "X" "C-x C-x")
(modalka-define-kbd "+" "C-x r m")
(modalka-define-kbd "\\" "C-c C-c")
(modalka-define-kbd "V" "C-c v C-v")
(modalka-define-kbd "<" "C-c v C-o")
(modalka-define-kbd "," "C-c v C-S-o")

(modalka-define-kbd "g g" "M-<")
(modalka-define-kbd "g o" "C-x C-e")
(modalka-define-kbd "g m" "C-c v g m")
(modalka-define-kbd "g M" "C-c v g M")
(modalka-define-kbd "g k" "C-c v g k")
(modalka-define-kbd "g j" "C-c v g j")
(modalka-define-kbd "g f" "C-c v g f")
(modalka-define-kbd "g u" "C-c v g u")
(modalka-define-kbd "g U" "C-c v g U")
(modalka-define-kbd "g T" "C-c v g T")
(modalka-define-kbd "g q" "C-c v g q")
(modalka-define-kbd "g w" "C-x 3")
(modalka-define-kbd "g W" "C-x 2")
(modalka-define-kbd "g S" "C-j")

(modalka-define-kbd "i a" "C-x h")

(modalka-define-kbd "] ]" "C-x n n")
(modalka-define-kbd "[ [" "C-x n w")

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
(modalka-define-kbd "SPC c" "C-c c")
(modalka-define-kbd "SPC q" "C-x 0")
(modalka-define-kbd "SPC SPC" "C-s")
(modalka-define-kbd "SPC f" "C-x C-f")
(modalka-define-kbd "SPC w" "C-x C-s")
(modalka-define-kbd "SPC i" "C-c C-e")
(modalka-define-kbd "SPC h" "C-c C-w")
(modalka-define-kbd "SPC o" "C-c C-k")
(modalka-define-kbd "SPC g" "C-c C-f")

;; which key explanations
(require 'sk-modal-modalka-which-key)

(provide 'sk-modal-modalka)
;;; sk-modal-modalka.el ends here