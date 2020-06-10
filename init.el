(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives
'("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
(package-refresh-contents)
(package-install 'use-package))

(org-babel-load-file (expand-file-name "~/.emacs.d/settings.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-buffer-choice nil)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/jobb.org" "~/Dropbox/org/skole.org" "~/Dropbox/org/privat.org")))
 '(package-selected-packages
   (quote
    (gnu-elpa-keyring-update use-package solarized-theme snazzy-theme plantuml-mode magit ess-smart-underscore ess-smart-equals elpy drag-stuff auctex ac-ispell))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
