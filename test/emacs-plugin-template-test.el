;;; emacs-plugin-template-test.el --- Emacs Plugin Template Test -*- lexical-binding: t -*-



;; Author: Ioannis Canellos

;; Version: 0.0.1

;; Package-Requires: ((emacs "27.2"))

;;; Commentary:

;;; Code:

(require 'test-helper)
(require 'emacs-plugin-template (f-expand "emacs-plugin-template.el" root-code-path))

(ert-deftest test/greeting ()
  (should (equal "Hello World" (greeting))))


(provide 'emacs-plugin-template-test)
;;; emacs-plugin-template-test.el ends here
