;; quail-conv.el
;; Convert text in various legacy encodings to utf-8

;; Author: Peter Heslin <p.j.heslin@dur.ac.uk>
;; Copyright (C) 2006 by P. J. Heslin
;; 
;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2, or (at your option)
;; any later version.
;; 
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;; 
;; You should have received a copy of the GNU General Public License
;; along with GNU Emacs; see the file COPYING.  If not, write to
;; the Free Software Foundation, 675 Massachusettes Ave,
;; Cambridge, MA 02139, USA.

;;; Commentary:
;;
;; Emacs comes with a large number of input methods that allow the
;; user conveniently to type text that can appear in your document as
;; Unicode.  Many of these quail input methods correspond exactly to
;; various 7-bit and 8-bit legacy encodings.  This package takes
;; advantage of that correspondence to translate text in these
;; encodings to utf-8.

;;; Nota Bene
;;
;; quail-conv.el does not support conversion via complex input methods
;; in which a series of input characters does not map to a single
;; output character but requires the user to choose interactively
;; between a selection of possible translations.

(require 'quail)
(require 'cl)

(defvar quail-conv-offset 0 "Number of chars of current lookahead
in input.")
(defvar quail-conv-trans "" "Current best translation.")
(defvar quail-conv-trans-offset 0 "How many lookahead chars
correspond to the current best translation.")

(defun quail-conv-file (input-method in-file &optional out-file)
  "Translate contents of IN-FILE, using INPUT-METHOD.  If
OUT-FILE is not specified, append .conv to the name of IN-FILE"
  (unless (assoc input-method input-method-alist)
    (error "Unknown input method"))
  (let ((old-input-method current-input-method)
        (coding-system-for-write 'utf-8))
    (with-current-buffer (find-file-noselect in-file nil t)
      (activate-input-method input-method)
      (quail-conv-region (point-min) (point-max)))
    (with-current-buffer "*quail conversion output*"
      (write-file (or out-file
                      (concat in-file ".conv")))
      (kill-buffer-and-window))
    (activate-input-method old-input-method)))

(defun quail-conv-region (beg end)
  "Convert the selected region using the current input method"
  (interactive "r")
  (save-excursion
    (let ((full-map (quail-map))
          output)
      (goto-char beg)
      (while (< (point) end)
        ;; Get info for initial char
        (setf quail-conv-offset 0)
        (multiple-value-bind (trans map)
            (quail-conv-get-trans-and-map full-map)
          ;; Default to passing through original char
          (setf quail-conv-trans (char-to-string (char-after)))
          (when trans
            ;; Simple (non-compound) translation
            (setf quail-conv-trans trans))
          (setf quail-conv-trans-offset 1)
          (when map
            ;; Need to peek ahead
            (quail-conv-get-compound-char trans map))
          (setf output (concat output quail-conv-trans))
          (forward-char quail-conv-trans-offset)))
      (with-output-to-temp-buffer "*quail conversion output*"
        (princ output)))))

(defun quail-conv-get-compound-char (trans map)
  ;; Get info for the next char
  (incf quail-conv-offset)
  (multiple-value-bind (next-trans next-map)
      (quail-conv-get-trans-and-map map)
    ;; If there is a trans here, it's the best so far
    (when next-trans
      (setf quail-conv-trans next-trans
            quail-conv-trans-offset (1+ quail-conv-offset)))
    (when next-map
      ;; We need to peek farther ahead
      (quail-conv-get-compound-char next-trans next-map))))


(defun quail-conv-get-trans-and-map (alist)
  (let* ((ch (char-after (+ quail-conv-offset (point))))
         (map (cdr (assq ch alist)))
         (trans (and map (quail-get-translation
                          (car map) (char-to-string ch) 1))))
    (when (consp trans)
      (if (> (length (cdr trans)) 1)
          (error "quail-conv does not support complex interactive input methods")
        (setq trans (aref (cdr trans) 0))))
    ;; Can trans be of any other type?
    (values (etypecase trans
              (string
               trans)
              (integer
               (char-to-string trans))
              (null
               nil))
            (cdr map))))
