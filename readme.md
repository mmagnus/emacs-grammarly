emacs-grammarly.el --- simple plugin to send a text to Grammarly  
-------------------------------------------------------------------------------

![](docs/demo.gif)

From Grammarly then you can copy-paste your text wherever you want.

Install Grammarly App (OSX version in this case) https://www.grammarly.com/native/mac 

Install:

    # load el file in your .emacs, e.g. 
    (load-file "~/.emacs.d/plugins/emacs-grammarly/emacs-grammarly.el")

Configuration (in the `emacs-grammarly.el` file):

    (defvar grammarly-tempfile "/home/magnus/Desktop/Grammarly.txt")
    (defvar grammarly-cmd "open -a Grammarly")

Change to your tempfile and change a way how you would run Grammarly from the terminal (this way works of OSX).
