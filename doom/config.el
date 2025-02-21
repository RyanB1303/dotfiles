;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")
(setq user-full-name "RyanB1303"
      user-mail-address "ryan.brilliant.nirwana@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-palenight
      doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 15)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 16)
      nerd-icons-font-names '("SymbolsNerdFontMono-Regular.ttf"))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

(setq fancy-splash-image (file-name-concat doom-user-dir "splash.png"))
;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Projects/org/")

;; projectile dir
(setq projectile-project-search-path '(("~/Projects/" . 3) ("~/Exercism/" . 3)))

;; projectile find elm dir
(after! projectile
  (projectile-register-project-type 'elm '("elm.json")
                                    :project-file "elm.json"))
;;; :editor evil
(setq doom-modeline-modal nil)
;; Focus new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; org todo set done time
(after! org
  (setq org-log-done 'time))

;; which-key scroll
(setq which-key-use-C-h-commands 't)

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
;; fix default identation
(after! web-mode
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-markup-indent-offset 2))

(after! js2-mode
  (setq js-indent-level 2)
  (setq indent-tabs-mode nil))

(after! rjsx-mode
  (setq js-indent-level 2)
  (setq indent-tabs-mode nil))

(after! typescript-mode
  (setq typescript-indent-level 2)
  (setq indent-tabs-mode nil))

(after! typescript-ts-mode
  (setq typescript-indent-level 2)
  (setq indent-tabs-mode nil))

(after! typescript-tsx-mode
  (setq typescript-indent-level 2)
  (setq indent-tabs-mode nil))

(after! scala-mode
  (setq indent-tabs-mode nil)
  (setq tab-width 4))
;; mise
;; enable globally
(setq global-mise-mode 't)
;; Indent Whole File
(defun indent-whole-buffer ()
  "INDENT WHOLE BUFFER."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))
(map! :desc "Indent File" :leader "-" #'indent-whole-buffer)

;; remove non-ascii character
(defun clean-non-ascii-characters (&optional start end)
  "Remove non-ASCII characters from the buffer or the selected region.
If a region is active, operate only on that region.
Otherwise, operate on the entire buffer."
  (interactive
   (if (use-region-p)
       (list (region-beginning) (region-end))
     (list (point-min) (point-max))))
  (save-excursion
    (goto-char start)
    (while (re-search-forward "[^\x00-\x7F]" end t)
      (replace-match ""))))

;; Bind the function to SPC-\
(map! :desc "Clean non-ASCII characters" :leader "\\" #'clean-non-ascii-characters)

;; open epub file
(use-package! nov
  :mode ("\\.epub\\'" . nov-mode)
  :config
  (setq nov-save-place-file (concat doom-cache-dir "nov-places")))

;; clojure
;; set 'clojure the essential reference' book
;; as clojure documentation
(after! cider-mode
  (setq clojure-essential-ref-nov-epub-path "/Users/ry/Projects/clojure-the-essential-references/Clojure_The_Essential_Reference_v31.epub"))

;; haskell formatter config
(after! lsp-haskell
  (setq lsp-haskell-formatting-provider "ormolu"))

(add-hook! 'haskell-mode-hook
  (add-hook 'before-save-hook 'lsp-format-buffer nil t))
;;; :tools lsp
;; Disable invasive lsp-mode features
(after! lsp-mode
  (setq lsp-enable-symbol-highlighting nil
        ;; If an LSP server isn't present when I start a prog-mode buffer, you
        ;; don't need to tell me. I know. On some machines I don't care to have
        ;; a whole development environment for some ecosystems.
        lsp-enable-suggest-server-download nil
        ))
(after! lsp-ui
  (setq lsp-ui-sideline-enable nil  ; no more useful than flycheck
        lsp-ui-doc-enable nil))     ; redundant with K
;; corfu
(after! corfu
  (setq corfu-auto nil))

(after! lsp-ui
  (setq lsp-ui-sideline-enable nil  ; no more useful than flycheck
        lsp-ui-doc-enable nil))     ; redundant with K
;; elixir
;; elixir setup lsp
(add-hook! 'elixir-mode-hook #'lsp!)
(add-to-list 'exec-path "~/.local/share/elixir-ls")
(after! lsp-mode
  (setq lsp-elixir-dialyzer-enabled nil))
;; heex
(define-derived-mode heex-mode web-mode "HEEx" "Major mode for editing HEEx files")
(add-to-list 'auto-mode-alist '("\\.heex?\\'" . heex-mode))

(add-hook! 'heex-mode-hook #'tree-sitter-hl-mode)
(add-hook! 'heex-mode-hook
  (lambda()
    (add-hook 'before-save-hook 'elixir-format nil t)))
;; ruby
(setq-hook! 'ruby-mode-hook
  +format-inhibit t
  +format-with-lsp t)
(add-hook! 'ruby-mode-hook
  (add-hook 'before-save-hook 'lsp-format-buffer nil t))
;; php
(after! php-mode
  (setq intelephense-key (getenv "INTELEPHENSE_KEY"))
  (setq lsp-intelephense-licence-key intelephense-key))

;; ess plot -> view ess (R) plot inside emacs
(use-package! ess-plot :defer t)
;; menu-bar on top
;; (setq menu-bar-mode 0)
(menu-bar-mode 0)
