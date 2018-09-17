;;; gitlab-mr-check --- Check MR you are assigned to

;; Copyright (C) 2018- blue0513

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation; either version 2 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program; if not, write to the Free Software
;; Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA

;; Author: blue0513
;; URL: https://github.com/blue0513
;; Version: 0.0.1
;; Package-Requires: ((shackle "1.0.1"))

;; Load this script
;;
;;   (require 'gitlab-mr-check)
;;
;; and then, you should modify `shell-path' to load gitlab-mr-check.sh
;; You may need to install package `shackle' to show the result window.

;;; Code:

(require 'shackle)
(setq shackle-rules
      '(("GitLabMR" :align below :ratio 0.2 :select t)))
(shackle-mode 1)

;; You need to edit this path
(defvar shell-path "path/to/gitlab-mr-check.sh")

(defun gitlab-mr-check()
  "Check MR you are assigned to."
  (interactive)
  (display-buffer (get-buffer-create "GitLabMR"))
  (let* ((my-buf (set-buffer (get-buffer-create "GitLabMR"))))
    (switch-to-buffer my-buf)
    (erase-buffer)
    (call-process-shell-command
     shell-path
     nil t)))

;; * provide

(provide 'gitlab-mr-check)

;;; gitlab-mr-check.el ends here
