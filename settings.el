
;:Enables the use of melpa packages
(package-initialize)
(require 'package)
(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))
(package-initialize)
(elpy-enable)

;: Enable visual-line-mode by default
(visual-line-mode)

;: Disabling menu-bar
(menu-bar-mode -1)

;: Disabling scroll-bar
(toggle-scroll-bar -1)

;: Disable tool-bar
(tool-bar-mode -1)

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

;: Export from org files to html
(require 'ox-publish)
(setq org-publish-project-alist
      '(

        ;; Configuration
        ("org-notes"
         :base-directory "~/org/"
         :base-extension "org"
         :publishing-directory "~/public_html/"
         :recursive t
         :publishing-function org-html-publish-to-html
         :headline-levels 4             ; Just the default for this project.
         :auto-preamble t
         )

      ))

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

;: Emacs theme
;:(load-theme 'base16 t)
;:(load-theme 'base16 t)

(setq TeX-PDF-mode t)

(require 'ess-r-mode)

(add-to-list 'auto-mode-alist '("\\.R\\'" . r-mode))

    (require 'company)
    (setq tab-always-indent 'complete)
    (setq company-idle-delay 0.1)
    (global-company-mode)
    (ess-toggle-underscore nil)
    (with-eval-after-load 'ess
      (setq ess-use-company t))

;: Automatically enable fullscreen
(run-with-idle-timer 0.1 nil 'toggle-frame-fullscreen)

;:(use-package omnisharp
 ;: :after company
  ;::config
  ;:(add-hook 'csharp-mode-hook 'omnisharp-mode)
  ;:(add-to-list 'company-backends 'company-omnisharp))
