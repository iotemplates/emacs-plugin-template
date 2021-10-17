;;; emacs-plugin-template.el --- A simple template for emacs plugins -*- lexical-binding: t -*-



;; Author: Ioannis Canellos

;; Version: 0.0.1

;; Package-Requires: ((emacs "27.2"))

;;; Commentary:

;;; Code:

(defun greeting ()
  "Return the greeting message."
  "Hello World")

(defun greet ()
  "Print a greeting message in the message buffer."
  (message (greeting)))

(provide 'emacs-plugin-template)
;;; emacs-plugin-template.el ends here
