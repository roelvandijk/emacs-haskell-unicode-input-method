# Emacs Haskell Unicode input method

This package provides **haskell-unicode-input-method**, an input
method which allows you to easily type a number of Unicode symbols
that are useful when writing Haskell code.

To automically load in haskell-mode put the following code in your
.emacs file:

    (require 'haskell-unicode-input-method)
    (add-hook 'haskell-mode-hook 
      (lambda () (set-input-method "haskell-unicode")))

Make sure the directory containing the .el file is in your load-path,
for example:

    (add-to-list 'load-path "~/.elisp/emacs-haskell-unicode-input-method")

To manually enable use **M-x set-input-method** or **C-x RET C-\\**
with **haskell-unicode**. Note that the elisp file must be evaluated
for this to work.

Now you can simply type `->` and it is immediately replaced with
`→`. Use **C-\\** to toggle the input method. To see a table of all
key sequences use** M-x describe-input-method haskell-unicode**. A
sequence like `<=` is ambiguous and can mean either `⇐` or `≤`. Typing
it presents you with a choice. Type 1 or 2 to select an option or keep
typing to use the default option.

If you don't like the highlighting of partially matching tokens you
can turn it off:

    (setq input-method-highlight-flag nil)
