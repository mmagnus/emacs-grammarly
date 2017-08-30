;;; emacs-grammarly.el --- a simple plugin to sent text to Grammarly
;;; Commentary:
;;   URL: http://example.com/jrhacker/superfrobnicate
;;; Code:

(defvar grammarly-tempfile "/home/magnus/Desktop/Grammarly.txt")
(defvar grammarly-cmd "open -a Grammarly")

(defun grammarly-save-region-and-run ()
  "Save region to a tempfile and run Grammarly on it."
  (interactive)
  (write-region (region-beginning) (region-end) grammarly-tempfile)
  (call-process-shell-command (concat grammarly-cmd " " grammarly-tempfile))
  ;(kill-region (region-beginning) (region-end))
  ;(insert "<<here>>\n")
  ;(insert-file-contents tempfile)
  )

(global-set-key (kbd "C-c C-g") 'grammarly-save-region-and-run)


(provide 'emacs-grammarly)
;;; emacs-grammarly.el ends here
