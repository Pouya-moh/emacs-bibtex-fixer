;; it is better to save the whole entry in a string so later I can get more out of it...
(defun my-bibtex-wget-pages ()  
  (substring
   (shell-command-to-string
    (concat "wget -q -O - " (bibtex-url nil 1) " | grep -o -P '(?<=startPage=).*(?=\&proceedingName)' | tr -s '&endPage=' '-'")) 0 -1))


(defun my-bibtex-add-pages ()
  "TODO: check if they are already existing"
  (interactive)
  (setq pages (wget-pages))
  (bibtex-make-field "pages" t t nil)
  (insert pages)
  )
