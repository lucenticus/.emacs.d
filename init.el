;;;
(global-set-key (kbd "C-z") 'undo) ; 【Ctrl+z】
;; Mac style redo
(global-set-key (kbd "C-Z") 'redo) ; 【Ctrl+Shift+z】

(global-set-key (kbd "<f2>") 'xah-cut-line-or-region)
(global-set-key (kbd "<f3>") 'xah-copy-line-or-region)
(global-set-key (kbd "<f4>") 'yank)       ; paste
(global-set-key (kbd "<C-f4>") 'yank-pop) ; paste previous
(global-set-key (kbd "<f5>") 'undo)
(global-set-key (kbd "<C-f5>") 'redo)

(global-set-key (kbd "<f7>") 'compile)
(global-set-key (kbd "M-`") 'other-frame)

;; make cursor movement keys under right hand's home-row.
(global-set-key (kbd "s-i") 'previous-line)
(global-set-key (kbd "s-j") 'backward-char)
(global-set-key (kbd "s-k") 'next-line)
(global-set-key (kbd "s-l") 'forward-char)

(global-set-key (kbd "s-u") 'backward-word)
(global-set-key (kbd "s-o") 'forward-word)

(global-set-key (kbd "C-@") 'set-mark-command)
(scroll-bar-mode   -1)
(setq redisplay-dont-pause t)
(setq compilation-scroll-output t)


;; Buffer Selection and ibuffer settings
(require 'bs)
(require 'ibuffer)
(defalias 'list-buffers 'ibuffer)
(global-set-key (kbd "<f2>") 'bs-show)

(setq x-select-enable-clipboard t)

;; Dired
(require 'dired)
(setq dired-recursive-deletes 'top)

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(show-paren-mode 1)
;;(add-to-list 'load-path "~/.emacs.d/")
;;(add-to-list 'load-path "~/.emacs.d/ecb")
(setq ecb-version-check nil)
(defun iwb ()
  "indent whole buffer"
  (interactive)
  ;;(delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))

(add-hook 'c-mode-common-hook '(lambda ()
  (local-set-key (kbd "RET") 'newline-and-indent)))

(load-theme 'wombat)

(require 'dired-x)
(setq dired-omit-files "^\\...+$")
(add-hook 'dired-mode-hook (lambda () (dired-omit-mode 1)))
(put 'dired-find-alternate-file 'disabled nil)

(setq tab-width 2)
(setq-default c-basic-offset 2)
(setq tab-stop-list '(4 8 12 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))
(setq indent-tabs-mode nil)
(setq require-final-newline nil)
(setq indent-line-function 'insert-tab)

(setq python-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))
(setq shell-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))
(setq c-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))
(setq objc-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))
(setq c++-mode-hook
    (function (lambda ()
                (setq indent-tabs-mode nil)
                (setq c-indent-level 4))))


(add-hook 'w3-parse-hooks 'w3-tidy-page)

(setq backup-directory-alist '(("." . "~/.emacs.d/backup"))
  backup-by-copying t    ; Don't delink hardlinks
  version-control t      ; Use version numbers on backups
  delete-old-versions t  ; Automatically delete excess backups
  kept-new-versions 20   ; how many of the newest versions to keep
  kept-old-versions 5    ; and how many of the old
  )



(require 'package)

(add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
(add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/"))
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/")))


(package-initialize)

(global-ede-mode 1)

(ede-cpp-root-project "LLVM"
		      :name "LLVM project"
		      :file "~/Git/ML/llvm/CMakeLists.txt"
 		      :include-path '("/include"
 				      "/tools/clang/include"
 				      "/tools/clang/lib/StaticAnalyzer")
)


(put 'dired-find-alternate-file 'disabled nil)


;;; activate ecb
(require 'ecb)

(setq ecb-layout-name "left15")
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-compile-window-height 8)
(eq show-trailing-whitespace nil)

;;; activate and deactivate ecb
(global-set-key (kbd "C-x C-;") 'ecb-activate)
(global-set-key (kbd "C-x C-'") 'ecb-deactivate)
;;; show/hide ecb window
(global-set-key (kbd "C-;") 'ecb-show-ecb-windows)
(global-set-key (kbd "C-'") 'ecb-hide-ecb-windows)
;;; quick navigation between ecb windows
(global-set-key (kbd "C-)") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-!") 'ecb-goto-window-directories)
(global-set-key (kbd "C-@") 'ecb-goto-window-sources)
(global-set-key (kbd "C-#") 'ecb-goto-window-methods)
(global-set-key (kbd "C-$") 'ecb-goto-window-compilation)

 (setq stack-trace-on-error t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-layout-window-sizes
   (quote
    (("left15"
      (ecb-directories-buffer-name 0.1943127962085308 . 0.49056603773584906)
      (ecb-methods-buffer-name 0.1943127962085308 . 0.5094339622641509))
     ("left8"
      (ecb-directories-buffer-name 0.1848341232227488 . 0.2830188679245283)
      (ecb-sources-buffer-name 0.1848341232227488 . 0.24528301886792453)
      (ecb-methods-buffer-name 0.1848341232227488 . 0.3018867924528302)
      (ecb-history-buffer-name 0.1848341232227488 . 0.1509433962264151)))))
 '(ecb-options-version "2.40")
 '(ecb-source-path (quote ("~/Git/clang-gerrit/")))
 '(inhibit-startup-screen t))

(require 'git)

(require 'fill-column-indicator)
(fci-mode nil)
(setq fci-rule-width 1)
(setq fci-rule-use-dashes 1)
(setq fci-rule-column 80)
(setq fci-rule-color "darkred")
(add-hook 'c-mode-hook 'fci-mode)
(add-hook 'c++-mode-hook 'fci-mode)

(add-hook 'prog-mode-hook 'linum-mode)

(load "~/.emacs.d/clang-format.el")

(global-set-key [C-M-tab] 'clang-format-region)

(require 'autopair)
(autopair-global-mode 1)
(setq autopair-autowrap t)

(add-hook 'c-mode-common-hook
        (lambda ()
                (define-key c-mode-map [(ctrl tab)] 'complete-tag)))

;; (add-hook 'c-mode-common-hook
;;           (lambda ()
;;             (when (derived-mode-p 'c-mode 'c++-mode 'java-mode)
;;               (ggtags-mode 1))))

(add-hook 'after-init-hook #'global-flycheck-mode)

;;(require 'irony)
;;(add-hook 'c++-mode-hook 'irony-mode)
;;(add-hook 'c-mode-hook 'irony-mode)
;;(add-hook 'objc-mode-hook 'irony-mode)


;; replace the `completion-at-point' and `complete-symbol' bindings in
;; irony-mode's buffers by irony-mode's function
;; (defun my-irony-mode-hook ()
;;   (define-key irony-mode-map [remap completion-at-point]
;;     'irony-completion-at-point-async)
;;   (define-key irony-mode-map [remap complete-symbol]
;;     'irony-completion-at-point-async))
;; (add-hook 'irony-mode-hook 'my-irony-mode-hook)
;; (add-hook 'irony-mode-hook 'irony-cdb-autosetup-compile-options)

;;(eval-after-load 'company
;;  '(add-to-list 'company-backends 'company-irony))

(eval-after-load 'company
  '(add-to-list 'company-backends 'company-omnisharp))
(add-hook 'csharp-mode-hook 'omnisharp-mode)
(setq omnisharp-server-executable-path "~/Git/omnisharp-server/OmniSharp/bin/Debug/OmniSharp.exe")
(setq omnisharp-curl-executable-path "/usr/bin/curl")
(projectile-global-mode)
(setq projectile-enable-caching t)
(setq projectile-completion-system 'helm)
(helm-projectile-on)


(require 'company)
(add-hook 'after-init-hook 'global-company-mode)


(require 'cc-mode)
(require 'semantic)

(global-semanticdb-minor-mode 1)
(global-semantic-idle-scheduler-mode 1)

(add-to-list 'company-backends 'company-c-headers)

(defun ede-object-system-include-path ()
  "Return the system include path for the current buffer."
  (when ede-object
    (ede-system-include-path ede-object)))

(setq company-c-headers-path-system 'ede-object-system-include-path)

(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)
(add-to-list 'company-backends 'company-c-headers)
(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/")
(add-to-list 'company-c-headers-path-system "/usr/include/x86_64-linux-gnu/c++/4.8")
(add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/backward")
(add-to-list 'company-c-headers-path-system "/usr/local/include")
(add-to-list 'company-c-headers-path-system "/usr/include")

(semantic-mode 1)

(require 'function-args)
(fa-config-default)
(define-key c-mode-map  [(control tab)] 'moo-complete)
(define-key c++-mode-map  [(control tab)] 'moo-complete)
(define-key c-mode-map (kbd "M-o")  'fa-show)
(define-key c++-mode-map (kbd "M-o")  'fa-show)


(windmove-default-keybindings 'meta)


(global-set-key (kbd "C-s-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-s-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-s-<down>") 'shrink-window)
(global-set-key (kbd "C-s-<up>") 'enlarge-window)

(require 'smex)
(smex-initialize)

(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'smex-major-mode-commands)
;; This is your old M-x.
(global-set-key (kbd "C-c C-c M-x") 'execute-extended-command)

(require 'helm)
(global-set-key (kbd "M-x") 'helm-M-x)
(require 'helm-config)

;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
(global-set-key (kbd "C-c h") 'helm-command-prefix)
(global-unset-key (kbd "C-x c"))

(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
(define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
(define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z

(when (executable-find "curl")
  (setq helm-google-suggest-use-curl-p t))

(setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t)

(helm-mode 1)


(require 'ido)
(ido-mode t)

(google-this-mode 1)
(global-set-key (kbd "C-x g") 'google-this-word)

(require 'srefactor)

(define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
(global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
(global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
(global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
(global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer)

(require 'ws-trim)
(global-ws-trim-mode t)

(require 'iedit)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ecb-options-version "2.40"))

(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'compilation-mode-hook 'ansi-color-for-comint-mode-on)

(setq
 ;; use gdb-many-windows by default
 gdb-many-windows t

 ;; Non-nil means display source file containing the main routine at startup
 gdb-show-main t
 )

(load-file "~/.emacs.d/rtags/src/rtags.el")


(require 'rtags)
(defun use-rtags (&optional useFileManager)
  (and (rtags-executable-find "rc")
       (cond ((not (gtags-get-rootpath)) t)
             ((and (not (eq major-mode 'c++-mode))
                   (not (eq major-mode 'c-mode))) (rtags-has-filemanager))
             (useFileManager (rtags-has-filemanager))
             (t (rtags-is-indexed)))))

(defun tags-find-symbol-at-point (&optional prefix)
  (interactive "P")
  (if (and (not (rtags-find-symbol-at-point prefix)) rtags-last-request-not-indexed)
      (gtags-find-tag)))
(defun tags-find-references-at-point (&optional prefix)
  (interactive "P")
  (if (and (not (rtags-find-references-at-point prefix)) rtags-last-request-not-indexed)
      (gtags-find-rtag)))
(defun tags-find-symbol ()
  (interactive)
  (call-interactively (if (use-rtags) 'rtags-find-symbol 'gtags-find-symbol)))
(defun tags-find-references ()
  (interactive)
  (call-interactively (if (use-rtags) 'rtags-find-references 'gtags-find-rtag)))
(defun tags-find-file ()
  (interactive)
  (call-interactively (if (use-rtags t) 'rtags-find-file 'gtags-find-file)))
(defun tags-imenu ()
  (interactive)
  (call-interactively (if (use-rtags t) 'rtags-imenu 'idomenu)))

(define-key c-mode-base-map (kbd "M-.") (function tags-find-symbol-at-point))
(define-key c-mode-base-map (kbd "M-,") (function tags-find-references-at-point))
(define-key c-mode-base-map (kbd "M-;") (function tags-find-file))
(define-key c-mode-base-map (kbd "C-.") (function tags-find-symbol))
(define-key c-mode-base-map (kbd "C-,") (function tags-find-references))
(define-key c-mode-base-map (kbd "C-<") (function rtags-find-virtuals-at-point))
(define-key c-mode-base-map (kbd "M-i") (function tags-imenu))

(define-key global-map (kbd "M-.") (function tags-find-symbol-at-point))
(define-key global-map (kbd "M-,") (function tags-find-references-at-point))
(define-key global-map (kbd "M-;") (function tags-find-file))
(define-key global-map (kbd "C-.") (function tags-find-symbol))
(define-key global-map (kbd "C-,") (function tags-find-references))
(define-key global-map (kbd "C-<") (function rtags-find-virtuals-at-point))
(define-key global-map (kbd "M-i") (function tags-imenu))

(setq rtags-autostart-diagnostics t)
(push 'company-rtags company-backends)
(setq rtags-completions-enabled t)
