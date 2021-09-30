(require 'org)
(org-babel-load-file
 (expand-file-name "settings.org"
                   "~/.emacs.d"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-buffer-choice nil)
 '(initial-frame-alist '((fullscreen . maximized)))
 '(org-agenda-files
   '("c:/Users/sivert.skarning/Dropbox/org/work.org" "c:/Users/sivert.skarning/Dropbox/org/personal.org"))
 '(package-selected-packages
   '(org-roam org-roam-bibtex emacsql-sqlite emacsql-sqlite3 spacemacs-theme gnu-elpa-keyring-update magit solarized-theme ac-ispell snazzy-theme plantuml-mode elpy drag-stuff auctex)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
