;; Copyright (C) Duncan Bayne 2009
;;
;; This program is free software: you can redistribute it and/or modify
;; it under the terms of the GNU Lesser General Public License as published
;; by the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <http://www.gnu.org/licenses/>.

(defun duncans_emacs:kill-unmodified-buffers()
  "Kill any unmodifier buffers that are inspecting files."
  (interactive)
  (mapcar 
    '(lambda (buf)
      (if (and (buffer-file-name buf) (not (buffer-modified-p buf)))
        (kill-buffer buf)))
    (buffer-list)))

(provide 'duncans_emacs)