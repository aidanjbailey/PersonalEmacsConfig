;; Prepare Melpa library
(package-initialize)
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
;; Sets up use-package for easy package installation
(dolist (package '(use-package))
  (unless (package-installed-p package)
    (package-refresh-contents)
    (package-install package)))

;; Package Declaration
(defun use-package-always-ensure (form)
  (append form '(:ensure t))) (advice-add #'use-package :filter-args #'use-package-always-ensure)


;; Package Packages

(use-package try)
(use-package package-utils)
(use-package no-littering)
(use-package esup)
(use-package paradox
  :config
  (paradox-enable))

;; Theme/Appearance ++++++++++++++++++++++++++++++++++++++++

(use-package dashboard
  :config
  (dashboard-setup-startup-hook))
(use-package all-the-icons)
(use-package emojify)
(use-package rainbow-delimiters
  :config
  (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))
;(use-package linum-relative
;  :config
;  (add-hook 'prog-mode-hook #'linum-relative-mode))
;(use-package sublimity
  ;:config
  ;(require 'sublimity-scroll)
  ;(require 'sublimity-map)
  ;(require 'sublimity-attractive)
  ;(sublimity-mode 1)
;  )
(use-package highlight-indent-guides
  :init
    (setq highlight-indent-guides-method 'character)
  :config
    (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))
(use-package spaceline
  :config
  (spaceline-spacemacs-theme))
(use-package windresize)
(use-package centaur-tabs
  :init
  (setq centaur-tabs-set-bar 'over)
  (setq centaur-tabs-style "bar")
  (setq centaur-tabs-gray-out-icons 'buffer)
  (setq centaur-tabs-set-icons t)
  :config
  (centaur-tabs-mode)
  (centaur-tabs-headline-match)
  )
(use-package buffer-move)

;; Hotkeys ++++++++++++++++++++++++++++++++++++++++++++++++

(use-package general)
(use-package hydra)

;; Evil Packages +++++++++++++++++++++++++++++++++++++++++++

(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init))
(use-package evil-cleverparens
  :after evil)
(use-package evil-nerd-commenter
  :after evil)
(use-package evil-org
  :after evil)
;(use-package evil-magit)

;; Helm ++++++++++++++++++++++++++++++++++++++++++++++++++++++

(use-package helm
  :after helm-core)
(use-package helm-projectile
  :after projectile)
(use-package helm-descbinds
  :config
  (helm-descbinds-mode))
(use-package helm-swoop)
(use-package helm-org-rifle)
(use-package helm-make)
(use-package projectile
  :config
  (projectile-mode +1))

;; Syntax Checking +++++++++++++++++++++++++++++++++

(use-package flycheck)
;(use-package flycheck-inline
;  :config
;    (add-hook 'flycheck-mode-hook #'flycheck-inline-mode))
;(use-package flycheck-tip)
(use-package quick-peek)
(use-package format-all)

;; LSP Integration +++++++++++++++++++++++++++++++++++

(use-package lsp-mode
  :init
  (setq lsp-enable-snippet t)
  :config
  (add-hook 'prog-mode-hook #'lsp))
(use-package lsp-ui
  :init
  (setq lsp-peek-enable t))
(use-package lsp-treemacs
  :config
  (lsp-treemacs-sync-mode 1))
(use-package helm-lsp
  :after lsp-mode)

;; Version Control

;(use-package magit)
;(use-package forge)

;; Language Servers +++++++++++++++++++++++++++++++++++

(use-package ccls
  :init
  (setq ccls-executable "/usr/bin/ccls"))

;; COMPANY ++++++++++++++++++++++++++++++++++++++++++++

(use-package company-quickhelp
  :config
  (company-quickhelp-mode))
(use-package company-c-headers
  :config
  (add-to-list 'company-backends 'company-c-headers))
(use-package company-lsp
  :after lsp-mode
  :config
  (add-to-list 'company-backends #'company-lsp))
(use-package yasnippet
  :config
  (yas-global-mode 1))
(use-package auto-yasnippet
  :after yasnippet)
(use-package company-box
  :config
  (add-hook 'company-mode-hook 'company-box-mode))

;; Debugging ++++++++++++++++++++++++++++++++++++++++++

(use-package dap-mode)
(use-package realgud)

;; ORG MODE +++++++++++++++++++++++++++++++++++++++++++++++++

(use-package org-bullets
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1))))
(use-package org-download
  :config
  (add-hook 'dired-mode-hook 'org-download-enable))

;; NAVIGATION +++++++++++++++++++++++++++++++++++++++++++++++

;(use-package neotree)
(use-package treemacs
  )
(use-package treemacs-evil)
(use-package project-explorer)
(use-package switch-window)
(use-package ace-jump-mode)
(use-package ace-link
  :config
  (ace-link-setup-default))

;; Misc Tools ++++++++++++++++++++++++++++++++++++++++++++++++

(use-package undo-tree)
(use-package smartparens
  :config
  (add-hook 'prog-mode-hook #'smartparens-mode))

;; Help Packages +++++++++++++++++++++++++++++++++++++++++++++


(use-package powerthesaurus)
(use-package imenu-anywhere)
(use-package pdf-tools
  :config
  (add-to-list 'auto-mode-alist '("\\.pdf\\'" . pdf-view-mode)))
(use-package helpful)
(use-package which-key
  :config
  (which-key-mode))
(use-package cheatsheet)
(use-package origami
  :config
  (add-hook 'prog-mode-hook
	    (lambda ()
	      (setq-local origami-fold-style 'triple-braces)
	      (origami-mode)
	      (origami-close-all-nodes (current-buffer)))))
