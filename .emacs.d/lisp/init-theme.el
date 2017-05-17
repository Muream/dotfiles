(use-package powerline
  :ensure t
  :config
  (powerline-default-theme))

(use-package powerline-evil
  :ensure t)

(use-package atom-one-dark-theme
  :ensure t)
(menu-bar-mode -1)
(toggle-scroll-bar -1)
(tool-bar-mode -1)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Monaco" :foundry "outline" :slant normal :weight normal :height 98 :width normal)))))

(provide 'init-theme)
