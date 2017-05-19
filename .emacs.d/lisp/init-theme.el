;;; init-theme -- theme configuration

;;; Commentary:
;; everything visual

;;; Code:



;; set a default font
(set-frame-font "Consolas 11" nil t)

;; colorscheme
(use-package atom-one-dark-theme
  :ensure t
  :config
  (load-theme 'atom-one-dark t))

;; relative line numbering!
(use-package linum-relative
  :ensure t
  :config
  (linum-relative-on)
  (global-linum-mode))
(use-package highlight-indent-guides
  :ensure t
  :config
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
  (setq highlight-indent-guides-method 'character))

(show-paren-mode t)

;; hide all the interface stuff
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(provide 'init-theme)
;;; init-theme.el ends here
