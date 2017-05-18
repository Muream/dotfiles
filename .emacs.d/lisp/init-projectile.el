;; project manager
(use-package projectile
  :ensure t
  :config
  (projectile-global-mode)
  (setq projectile-enable-caching t))

(provide 'init-projectile)
