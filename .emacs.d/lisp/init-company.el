;;; init-company.el -- company configuration

;;; Commentary:
;; autocompletion things

;;; Code:



(use-package company
  :ensure t
  :config
  (use-package company-jedi
    :ensure t
    :config
    (add-to-list 'company-backends 'company-jedi)
    (global-company-mode)
    (global-set-key (kbd "C-SPC") 'company-complete)
    (define-key company-active-map (kbd "TAB") 'company-select-next)
    (define-key company-active-map [tab] 'company-select-next))
    (define-key company-active-map (kbd "<backtab>") 'company-select-previous)
)

(provide 'init-company)
;;; init-company.el ends here
