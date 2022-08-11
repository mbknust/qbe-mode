;; TODO add header

(defvar qbe-mode-keywords
  '("export" "section" "type" "align" "function" "data")
  "List of QBE IR keywords")

(defvar qbe-mode-opcodes
  '("add" "sub" "div" "mul"
    "neg" "udiv" "rem" "urem"
    "or" "xor" "and"
    "sar" "shr" "shl"
    "stored" "stores" "storel"
    "storew" "storeh" "storeb"
    "loadd" "loads" "loadl"
    "loadsw" "loadsh" "loadsb"
    "loaduw" "loaduh" "loadub"
    "alloc4" "alloc8" "alloc16"
    "ceqd" "ceql" "ceqs" "ceqw"
    "cged" "cges" "cgtd" "cgts"
    "cled" "cles" "cltd" "clts"
    "cned" "cnel" "cnes" "cnew"
    "cod" "cos" "cuod" "cuos"
    "csgel" "csgew" "csgtl" "csgtw"
    "cslel" "cslew" "csltl" "csltw"
    "cugel" "cugew" "cugtl" "cugtw"
    "culel" "culew" "cultl" "cultw"
    "dtosi" "dtoui" "stosi" "stoui"
    "exts" "extsb" "extsh" "extsw"
    "extub" "extuh" "extuw"
    "sltof" "ultof" "swtof" "uwtof"
    "truncd" "cast" "copy" "phi"
    "vastart" "vaarg"
    "call" "jmp" "jnz" "ret")
  "List of QBE IR instructions")

(defvar qbe-mode-font-lock-defaults
  `((("[sd]_-?[[:digit:]]+\\(\\.[[:digit:]]+\\)?"
      . 'font-lock-constant-face)
     ("#.*$" . 'font-lock-comment-face)
     ("\\(:[[:alnum:]]+\\|\\<[wlsdbh]\\>\\)"
      . 'font-lock-type-face)
     ("[%\\$][[:alnum:]]*"
      . 'font-lock-variable-name-face)
     (,(format "\\<%s\\>" (regexp-opt qbe-mode-opcodes))
      . 'font-lock-builtin-face)
     (,(format "\\<%s\\>" (regexp-opt qbe-mode-keywords))
      . 'font-lock-keyword-face)
     ("\\(@[[:alnum:]]+\\|-?[[:digit:]]+\\)"
      . 'font-lock-constant-face))))

;;;###autoload
(define-derived-mode qbe-mode fundamental-mode "QBE"
  "major mode for editing QBE IR"
  (setq-local font-lock-defaults qbe-mode-font-lock-defaults)
  (setq-local comment-start "# ")
  (setq-local comment-end ""))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.ssa" . qbe-mode))

(provide 'qbe-mode)
;;; qbe-mode.el ends here
