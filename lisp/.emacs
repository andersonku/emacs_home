;C-u 0 M-x byte-recompile-directory
(add-to-list 'load-path (expand-file-name "~/newlisp"))

(windmove-default-keybindings 'meta)
													   
; auto-install
(require 'auto-install)
(setq auto-install-directory "~/newlisp/")

; auto-complete: complete from words in current file
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/newlisp/ac-dict")
(ac-config-default)

; anything: replaces M-x
(require 'anything-startup)

; perl-completion
(require 'idle-highlight-mode)
(require 'perl-completion)
(add-hook 'cperl-mode-hook
          (lambda()
            (require 'perl-completion)
				(flymake-mode-on)
				(idle-highlight-mode t)
            (perl-completion-mode t)))

;YASnippet
(add-to-list 'load-path "~/newlisp/yasnippet")
    (require 'yasnippet) ;; not yasnippet-bundle
    (yas/initialize)
    (yas/load-directory "~/newlisp/yasnippet/snippets")

(setq-default tab-width 3)
;cperl mode setup
(defalias 'perl-mode 'cperl-mode)
(setq cperl-auto-newline t
		cperl-brace-offset 0
      cperl-close-paren-offset -3
		cperl-continued-brace-offset -3
      cperl-continued-statement-offset 3
		cperl-extra-newline-before-brace t
		cperl-extra-newline-before-brace-multiline t
		cperl-indent-level 3
      cperl-indent-parens-as-block t
      cperl-label-offset -3
      cperl-comment-column 40
      cperl-highlight-variables-indiscriminately t
      cperl-tab-always-indent nil
		cperl-merge-else nil
      cperl-font-lock t)

(add-to-list 'load-path "~/newlisp/color-theme")
(add-to-list 'load-path "~/newlisp/color-theme/themes")
(require 'color-theme)
(eval-after-load "color-theme"
  '(progn
     (color-theme-initialize)
     (color-theme-blue-mood)))

(pc-selection-mode t)
(setq mouse-drag-copy-region nil)
(global-linum-mode t)

;; cperl-brace-offset
;; My own key bindings

(cua-mode 1)
(setq cua-enable-cua-keys t)
(setq cua-keep-region-after-copy t) ;; Standard MS-Windows behaviour
(global-set-key "\C-o" 'find-file)
(global-set-key "\C-a" 'mark-whole-buffer)
(global-set-key "\C-f" 'isearch-forward)
(define-key isearch-mode-map "\C-f" 'isearch-repeat-forward)
(define-key isearch-mode-map "\C-g" 'isearch-repeat-backward)
(define-key isearch-mode-map (kbd "C-o")
  (lambda ()
    (interactive)
    (let ((case-fold-search isearch-case-fold-search))
      (occur (if isearch-regexp isearch-string
               (regexp-quote isearch-string))))))
(global-set-key "\C-r" 'query-replace)

(global-set-key "\C-s" 'save-buffer)
(define-key global-map (kbd "RET") 'newline-and-indent) ; For programming language modes

; isearch-backward
(global-set-key "\C-w" 'close-window)
(global-set-key "\C-b" 'move-beginning-of-line)

(global-set-key [(\C /)] 'comment-or-uncomment-region-or-line)
(global-set-key [(f2)] 'occur)
(global-set-key [(f5)] 'recompile)
(global-set-key [C-f5] 'compile)
(global-set-key [(f7)] 'recentf-open-files)

(global-set-key [(f6)] 'plcmp-cmd-complete-variables)
(global-set-key [M-f11] 'recentf-open-files)
(global-set-key [(\A /)] 'comment-or-uncomment-region-or-line)

(defmacro bind (key fn)
  "shortcut for global-set-key"
  `(global-set-key (kbd ,key)
                   ;; handle unquoted function names and lambdas
                   ,(if (listp fn)
                        fn 
                      `',fn)))
;(bind "<C-f5>" compile)


;get Consola for windows
;http://www.microsoft.com/download/en/details.aspx?displaylang=en&id=17879
