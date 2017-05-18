(use-package company
  :ensure t
  :config
  (use-package company-jedi
    :ensure t
    :config
    (add-to-list 'company-backends 'company-jedi))
  (global-company-mode)
  (global-set-key (kbd "C-SPC") 'company-complete)
  (define-key company-active-map (kbd "TAB") 'company-complete-common-or-cycle)
  ;; (define-key company-active-map (kbd "S-TAB") 'company-select-next)
  
)


(provide 'init-company)
