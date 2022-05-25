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
(load-theme 'spacemacs-dark t)

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

(projectile-mode +1)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

(use-package tide :ensure t)
(use-package company :ensure t)
(use-package flycheck :ensure t)

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

  (require 'web-mode)

(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "ts" (file-name-extension buffer-file-name))
              (setup-tide-mode))))
;; enable typescript - tslint checker
(flycheck-add-mode 'typescript-tslint 'web-mode)

(require 'package)
;; load packages ourselves
;; press C-h v on the variable for more documentation
;;(setq package-enable-at-startup nil)
;; Add MELPA to package-archives
;;(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
;; load packages now
;;(package-initialize)

;; Emacs adds `custom' settings in the init file by default. Run this file
;; without this segment to see what that means.
;; Put those away in "custom.el".
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file :noerror)

;; update local database then install use-package if it's not installed
(unless (package-installed-p 'use-package)
 (package-refresh-contents)
 (package-install 'use-package))

(require 'use-package)
;; tell use-package to install a package if it's not already installed
(setq use-package-always-ensure t)

(use-package magit
 :bind (("C-x g" . magit)))
