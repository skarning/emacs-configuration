(require 'package)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

;; Bootstrap use-package (install it if not present)
(unless (package-installed-p 'use-package)
  (package-refresh-contents) ;; Update package list
  (package-install 'use-package))
(require 'use-package)
(setq use-package-always-ensure t) ;; Ensure packages are installed by default

;; Helm setup
(use-package helm
  :config
  (helm-mode 1)
  :bind (("M-x" . helm-M-x)))


;; Magit setup
(use-package magit
  :bind (("C-x g" . magit-status)))

  (use-package doom-themes
  :ensure t
  :config
  (load-theme 'doom-solarized-dark t))


(use-package terraform-mode
  :ensure t
  :custom
  (terraform-indent-level 2) ;; Set indentation to 2 spaces
  (terraform-format-on-save t) ;; Auto-format with `terraform fmt` on save
  :hook (terraform-mode . outline-minor-mode)) ;; Enable block folding

(use-package company
  :ensure t
  :config (global-company-mode t))

(use-package company-terraform
  :ensure t
  :after (terraform-mode company)
  :hook (terraform-mode . company-terraform-init))

(use-package lsp-mode
  :ensure t
  :hook (terraform-mode . lsp-deferred)
  :commands lsp)

(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)

;; UI tweaks
(add-to-list 'default-frame-alist '(fullscreen . fullboth))
(visual-line-mode 1)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)
(run-with-idle-timer 0.1 nil 'toggle-frame-maximized)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(lsp-ui lsp-mode terraform-doc company-terraform company terraform-mode doom-themes magit helm)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
