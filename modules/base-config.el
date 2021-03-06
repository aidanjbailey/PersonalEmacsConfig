;; Modes
(global-hl-line-mode +1)
(blink-cursor-mode 0)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(setq evil-want-keybinding nil)
(setq inhibit-startup-screen t)
(setq scroll-step 1)
(setq scroll-margin 1)
(fringe-mode '(16 . 0))

;; Function Calls
(display-time)
(load-theme 'afterglow t)


;; Attributes
(set-face-attribute 'default nil
                    :family "Source Code Pro"
                    :height 100
                    :weight 'demibold
                    :width 'normal)
(set-face-attribute 'fringe nil :background "#2e2e2e" :foreground "#2e2e2e")

;; Hooks
(add-hook 'prog-mode-hook #'company-mode)
(add-hook 'prog-mode-hook #'linum-mode)

;; Variables
(setq frame-title-format '(buffer-file-name "Emacs: %b (%f)" "Emacs: %b"))
(setq display-time-day-and-date t)

;; Org Mode
(setq org-hide-emphasis-markers t)
(font-lock-add-keywords 'org-mode
                        '(("^ *\\([-]\\) "
                           (0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•"))))))
(setq org-ellipsis " ▼")
