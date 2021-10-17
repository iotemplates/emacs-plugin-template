;;; test-helper.el --- Test helper -*- lexical-binding: t -*-



;; Author: Ioannis Canellos

;; Version: 0.0.1

;; Package-Requires: ((emacs "27.2"))

;;; Commentary:

;;; Code:
(require 'f)

(defvar root-test-path (f-dirname (f-this-file)) "The path where the tests are located.")
(defvar root-code-path (f-parent root-test-path) "The path where teh code is located.")
(defvar root-sandbox-path (make-temp-file "emacs-plugin-template-sandbox" t) "The temporary path / sandbox.")

(defmacro with-sandbox (&rest body)
  "Evaluate BODY in an empty temporary directory."
  `(let ((default-directory root-sandbox-path))
     (when (f-dir? root-sandbox-path)
       (f-delete root-sandbox-path :force))
     (f-mkdir root-sandbox-path)
     ,@body))


(provide 'test-helper)
;;; test-helper.el ends here
