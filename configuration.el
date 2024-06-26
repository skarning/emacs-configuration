(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(require 'helm)
(helm-mode 1)
(global-set-key (kbd "M-x") 'helm-M-x)

'(org-agenda-files '("~/tmp/workbook.org" "~/org/schedule.org"))

(use-package magit
 :bind (("C-x g" . magit)))


;: Enable visual-line-mode by default
(visual-line-mode)

;: Disabling menu-bar
(menu-bar-mode -1)

;: Disabling scroll-bar
(toggle-scroll-bar -1)

;: Disable tool-bar
(tool-bar-mode -1)

;: Automatically enable fullscreen
(run-with-idle-timer 0.1 nil 'toggle-frame-fullscreen)

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

(setq org-todo-keywords
      '((sequence "TODO"  "|" "IN PROGRESS" "CODE-REVIEW"  "|" "DONE")))

(setq org-default-notes-file (concat org-directory "/quick-notes.org"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files '("~/org/schedule.org"))
 '(package-selected-packages
   '(helm wfnames use-package smart-tabs-mode popup plantuml-mode magit async)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package yaml-mode
  :ensure t)
