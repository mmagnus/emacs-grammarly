;;; emacs-grammarly.el --- a simple plugin to sent text to Grammarly
;;; Commentary:
;;   URL: http://example.com/jrhacker/superfrobnicate
;;; Code:

(defvar grammarly-default-file nil
  "If non-nil, `grammarly-save-region-and-run' always writes to this file.")

(defvar-local grammarly-buffer-file nil
  "The temporary file associated with the current buffer.")

(defvar grammarly-cmd "open -a Grammarly")
(defvar grammarly-reload-cmd "osascript <<END
tell application \"Grammarly\" to activate
tell application \"System Events\"
	keystroke \"r\" using command down
end tell
END")

(defun grammarly-save-region-and-run ()
  "Save region to a tempfile and run Grammarly on it."
  (interactive)
  (let ((file (or grammarly-default-file grammarly-buffer-file
                  (setq grammarly-buffer-file
                        (make-temp-file (buffer-name) nil ".txt")))))
    (write-region (region-beginning) (region-end) file)
    (call-process-shell-command
     (concat grammarly-cmd " " file ";" grammarly-reload-cmd))))

(provide 'emacs-grammarly)
;;; emacs-grammarly.el ends here
