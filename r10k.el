;;; r10k.el --- Run r10k commands                    -*- lexical-binding: t; -*-

;; Copyright (C) 2016  Romanos Skiadas

;; Author: Romanos Skiadas <rom.skiad@gmail.com>
;; Keywords: tools
;; Version: 0.0.1
;; Url: https://github.com/rski/r10k.el
;; Created: 26 September 2016

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

;;; Commentary:

;; This plugin lets you execute r10k commands from within Emacs.
;;

;;; Code:

(defgroup r10k nil
  "Customization group for `r10k.el'"
  :group 'tools)

(defcustom r10k-control-repo-path ""
  :group 'r10k
  :type 'string)

(defcustom r10k-flags "--verbose"
  :group 'r10k
  :type 'string)

(defun r10k-command (cmd)
  "Execute an r10k command"
  (if (boundp 'r10k-control-repo-path)
      (async-shell-command (concat "cd " r10k-control-repo-path " && r10k " cmd r10k-flags))
    (message "`r10k-control-repo-path' not set, skipping r10k command execution.")))

(defun r10k-install ()
  "Run r10k puppetfile install"
  (interactive)
  (r10k-command "puppetfile install"))

(defun r10k-purge ()
  "Run r10k puppetfile purge"
  (interactive)
  (r10k-command "puppetfile purge"))

(provide 'r10k)
;;; r10k.el ends here
