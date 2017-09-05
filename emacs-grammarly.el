;;; emacs-grammarly.el --- a simple plugin to sent text to Grammarly
;;; Commentary:
;;   URL: http://example.com/jrhacker/superfrobnicate
;;; Code:

(defvar grammarly-file nil
  "The temporary file for storing things sent to Grammarly.")

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
  (let ((file (or grammarly-file
                  (setq grammarly-file
                        (make-temp-file "grammarly" nil ".txt")))))
    (write-region (region-beginning) (region-end) file)
    (call-process-shell-command
     (concat grammarly-cmd " " file ";" grammarly-reload-cmd))))

(provide 'emacs-grammarly)
;;; emacs-grammarly.el ends here
