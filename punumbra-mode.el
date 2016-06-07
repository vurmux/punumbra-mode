;; punumbra-mode.el -- highlight punctuation, numbers and brackets
;;
;; Copyright (C) 2016 Andrey Voronov
;;
;; Author: Andrey Voronov
;; Version: 1.0.1
;; Keywords: faces
;;
;; This file is NOT part of GNU Emacs.
;;
;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License
;; as published by the Free Software Foundation; either version 2
;; of the License, or (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.
;;
;;; Commentary:
;;
;; This mode highlights punctuation, numbers and brackets:
;; Punctuatuion  - font-lock-negation-char-face
;; Numbers       - font-lock-constant-face
;; Brackets      - font-lock-function-name-face
;;
;;; Code:

(require 'faces)

(defgroup punumbra nil
    "Highlight punctuation, numbers and brackets"
    :group 'faces)

(make-variable-buffer-local
  (defvar punumbra-keywords
      '(
        ("0[xXbB]\\([0-9a-fA-F]+\\)" 1 font-lock-constant-face)
        ("[^a-zA-Z_]\\(\\-?[0-9]+\\)" 1 font-lock-constant-face)
        ("[\\\\(\\\\)\\{\\}]" . font-lock-function-name-face)
        ("\\[" . font-lock-function-name-face)
        ("\\]" . font-lock-function-name-face)
        ("[\\+\\=\\*\\/\\!\\>\\<\\,\\:\\;]" . font-lock-negation-char-face)
        ("\\-" . font-lock-negation-char-face)
        )
      )
  )

(define-minor-mode punumbra-mode
    "Highlight punctuation, numbers and brackets"
    :lighter PNB
    :group 'punumbra
    (font-lock-add-keywords nil punumbra-keywords)
    (with-no-warnings (font-lock-fontify-buffer))
    (font-lock-mode 1)
    )

(provide 'punumbra-mode)

;;; punumbra-mode.el ends here
