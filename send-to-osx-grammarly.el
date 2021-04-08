;;; send-to-osx-grammarly.el --- A simple plugin to sent text to Grammarly  -*- lexical-binding: t; -*-

;; Copyright (C) 2017-2021  Marcin Magnus
;; Copyright (C) 2021  Shen, Jen-Chieh
;; Created date 2021-02-23 20:08:40

;; Author: Marcin Magnus <m.magnus@zoho.com>
;; Maintainer: Shen, Jen-Chieh <jcs090218@gmail.com>
;; Description: A simple plugin to sent text to Grammarly.
;; Keyword: osx grammarly
;; Version: 0.1.0
;; Package-Requires: ((emacs "24.3"))
;; URL: https://github.com/emacs-grammarly/send-to-osx-grammarly

;; This file is NOT part of GNU Emacs.

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:
;;
;; A simple plugin to sent text to Grammarly.
;;

;;; Code:

(defconst send-to-osx-grammarly-script-dir
  (concat (file-name-directory load-file-name) "scripts/")
  "Script path for package `send-to-osx-grammarly'.")

(defun send-to-osx-grammarly--call (script)
  "Call SCRIPT from script directory."
  (call-process-shell-command (format "osascript %s%s" send-to-osx-grammarly-script-dir script)))

;;;###autoload
(defun send-to-osx-grammarly-push ()
  "Save region to a tempfile and run Grammarly on it."
  (interactive)
  (kill-region (region-beginning) (region-end))
  (send-to-osx-grammarly--call "push.scpt"))

;;;###autoload
(defun send-to-osx-grammarly-pull()
  "Save region to a tempfile and run Grammarly on it."
  (interactive)
  (send-to-osx-grammarly--call "pull.scpt")
  (yank))

(provide 'send-to-osx-grammarly)
;;; send-to-osx-grammarly.el ends here
