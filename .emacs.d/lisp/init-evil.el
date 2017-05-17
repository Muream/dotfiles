;; evil mode
(use-package evil
  :ensure t
  :config
  (evil-mode 1)
  (use-package evil-escape
    :ensure t
    :config
    (evil-escape-mode 1)
    (setq-default evil-escape-key-sequence "jk")
    (setq-default evil-escape-delay 0.2))
  (use-package evil-leader
    :ensure t
    :config
    (global-evil-leader-mode))
  (use-package evil-surround
    :ensure t
    :config
    (global-evil-surround-mode))
)

(provide 'init-evil)
