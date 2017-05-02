;; Setting Rust-mode through Racer package.
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/")t )
(package-initialize)
(add-hook 'rust-mode-hook #'racer-mode)
(add-hook 'racer-mode-hook #'eldoc-mode)

;; For SLIME
(setq inferior-lisp-program "/usr/local/bin/sbcl")
(setq slime-contribs '(slime-fancy))

;; For Racer Company Mode
(add-hook 'racer-mode-hook #'company-mode)
(global-set-key (kbd "TAB") #'company-indent-or-complete-common) ;
(setq company-tooltip-align-annotations t)

;; Setting K&R style
(setq c-default-style "k&r" c-basic-offset 4)

;; For Swift Mode
;;(add-to-list 'flycheck-checkers 'swift)
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

;; For Flycheck:
;;(use-package flycheck
;;	     :ensure t
;;	     :init (global-flycheck-mode))

;; Setting Multi-web-mode
;;(add-to-list 'load-path' "~/.emacs.d/lisp/")
;;(require 'multi-web-mode')
;;(setq mweb-default-major-mode 'html-mode)
;;(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
;;                  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
;;                  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
;;(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
;;(multi-web-global-mode 1)
