(require 'package) ;; package.el
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;: Enable visual-line-mode by default

(visual-line-mode)

;: Disabling menu-bar
(menu-bar-mode -1)

;: Disabling scroll-bar
(toggle-scroll-bar -1)

;: Disable tool-bar
(tool-bar-mode -1)

;: Emacs theme
(load-theme 'spacemacs-light t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(initial-buffer-choice nil)
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(org-agenda-files
   (quote
    ("~/Dropbox/org/skole.org" "~/Dropbox/org/privat.org")))
 '(package-selected-packages
   (quote
    (gnu-elpa-keyring-update magit solarized-theme ac-ispell snazzy-theme plantuml-mode elpy drag-stuff auctex))))

;: Sets shortcut for opening the org-agenda
(global-set-key (kbd "C-c a") 'org-agenda)

;: Setting up date archiving in emacs
(setq org-archive-location (concat "archive/archive-"
                                   (format-time-string "%Y%m" (current-time))
                                   ".org_archive::"))

(setq org-roam-directory (file-truename "C:/Users/sivert.skarning/Dropbox/org/org-roam"))



;: Configuration of the drag-stuff package
(add-to-list 'load-path "/path/to/drag-stuff")
(require 'drag-stuff)
(drag-stuff-global-mode 1)
(drag-stuff-define-keys)

;: Loads auctex configuration
(add-to-list 'load-path "~/.emacs.d/auctex")
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;: Magit key-bindings
(global-set-key (kbd "C-x g") 'magit-status)

;: Automatically enable fullscreen
(run-with-idle-timer 0.1 nil 'toggle-frame-fullscreen)

(setq ring-bell-function 'ignore)
(setq visible-bell t)
