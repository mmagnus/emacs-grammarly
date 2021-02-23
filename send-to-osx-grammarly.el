;;; emacs-grammarly.el --- a simple plugin to sent text to Grammarly
;;; Commentary:
;;   URL: https://github.com/mmagnus/emacs-grammarly
;;; Code:
(defun grammarly-push ()
  "Save region to a tempfile and run Grammarly on it."
  (interactive)
  (kill-region (region-beginning) (region-end))
  ;;(insert "<<here>>")
  (call-process-shell-command "osascript ~/.emacs.d/plugins/emacs-grammarly/push.scpt")
  )

(defun grammarly-pull()
  "Save region to a tempfile and run Grammarly on it."
  (interactive)
  (call-process-shell-command "osascript ~/.emacs.d/plugins/emacs-grammarly/pull.scpt")
  (yank)
  )

(global-set-key (kbd "C-c C-g h") 'grammarly-push)
(global-set-key (kbd "C-c C-g l") 'grammarly-pull)

(provide 'emacs-grammarly)
;;; emacs-grammarly.el ends here
