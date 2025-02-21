;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
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
;; fav theme: doom-moonlight leuven
(setq doom-theme 'leuven
      doom-font (font-spec :family "JetBrainsMono Nerd Font" :size 15)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 16)
      nerd-icons-font-names '("SymbolsNerdFontMono-Regular.ttf"))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type nil)

;; Prevents some cases of Emacs flickering.
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))
;; fullscreen at start - repot
;; (add-to-list 'initial-frame-alist '(fullscreen . maximized))

;;; :ui doom-dashboard
(setq fancy-splash-image (file-name-concat doom-user-dir "splash.png"))

;; projectile dir
(setq projectile-project-search-path '(("~/Projects/" . 3) ("~/Exercism/" . 3)))

;;; :ui modeline
;; An evil mode indicator is redundant with cursor shape
(setq doom-modeline-modal nil)

;;; :editor evil
;; Focus new window after splitting
(setq evil-split-window-below t
      evil-vsplit-window-right t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Projects/org/"
      deft-directory "~/Projects/org/")

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

;;; :completion company
;; IMO, modern editors have trained a bad habit into us all: a burning need for
;; completion all the time -- as we type, as we breathe, as we pray to the
;; ancient ones -- but how often do you *really* need that information? I say
;; rarely. So opt for manual completion:
(after! company
  (setq company-idle-delay nil))

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

;; prodigy
(map! :leader
      :desc "Open prodigy"
      "o p" #'prodigy)

(prodigy-define-tag
  :name 'phoenix
  :ready-message "[info] Access SurveyWeb.Endpoint at http://localhost:4000")

(prodigy-define-service
  :name "Suvery-Server"
  :command "mix"
  :args '("phx.server")
  :cwd "~/Projects/bappeda_dev_team/survey"
  :env '(("DATABASE_URL" "ecto://postgres:postgres@localhost:54322/survey_dev")
         ("DATABASE_TEST_URL" "ecto://postgres:postgres@localhost:54322/survey_test")
         ("PORT" "4000"))
  :port 4000
  :tags '(phoenix)
  :stop-signal 'sigterm
  )

;; mise
;; enable globally
(add-hook 'after-init-hook #'global-mise-mode)

;; Indent Whole File
(defun indent-whole-buffer ()
  "INDENT WHOLE BUFFER."
  (interactive)
  (delete-trailing-whitespace)
  (indent-region (point-min) (point-max) nil)
  (untabify (point-min) (point-max)))
(map! :desc "Indent File" :leader "-" #'indent-whole-buffer)

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

;; projectile find elm dir
(after! projectile
  (projectile-register-project-type 'elm '("elm.json")
                                    :project-file "elm.json"))

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

;; elixir
;; elixir setup lsp
(add-hook 'elixir-mode-hook #'lsp!)
(add-to-list 'exec-path "~/.local/share/elixir-ls")
(after! lsp-mode
  (setq lsp-elixir-dialyzer-enabled nil))
;; heex
(define-derived-mode heex-mode web-mode "HEEx" "Major mode for editing HEEx files")
(add-to-list 'auto-mode-alist '("\\.heex?\\'" . heex-mode))

(add-hook 'heex-mode-hook #'tree-sitter-hl-mode)
(add-hook 'heex-mode-hook
          (lambda()
            (add-hook 'before-save-hook 'elixir-format nil t)))
;; elixir repl
(map! :after elixir-mode
      :localleader
      :map elixir-mode-map
      :prefix ("i" . "inf-elixir")
      "i" 'inf-elixir
      "p" 'inf-elixir-project
      "l" 'inf-elixir-send-line
      "r" 'inf-elixir-send-region
      "b" 'inf-elixir-send-buffer
      "R" 'inf-elixir-reload-module)
;; ruby
(setq-hook! 'ruby-mode-hook
  +format-inhibit t
  +format-with-lsp t)
(add-hook! 'ruby-mode-hook
  (add-hook 'before-save-hook 'lsp-format-buffer nil t))

;; webmode
(setq-hook! 'web-mode-hook
  apheleia-inhibit t
  +format-with nil)
(add-hook! 'web-mode-hook
  (lambda()
    (add-hook 'before-save-hook #'+format/buffer nil t)))
;; A set of Doom Emacs mappings for manipulating parentheses and sexps
;; Wrap sexp in round parentheses
;; `SPC` - `c` -`p` - `(`
;; Wrap sexp in square parentheses
;; `SPC` - `c` -`p` - `[`
;; Wrap sexp in curly parentheses
;; `SPC` - `c` -`p` - `{`
;; Copy sexp
;; `SPC` - `c` -`p` - `y`
;; Kill sexp
;; `SPC` - `c` -`p` - `d`
;; Raise sexp
;; `SPC` - `c` -`p` - `r`
;; Push parenthesis to the right
;; `SPC` - `c` -`p` - `>` - `)`
;; Push parenthesis to the left
;; `SPC` - `c` -`p` - `<` - `(`
;; Pull parenthesis from the right
;; `SPC` - `c` -`p` - `<` - `)`
;; Pull parenthesis from the left
;; `SPC` - `c` -`p` - `>` - `(`
(use-package! doom-parents)
;; evil cleverparens
(add-hook 'lisp-mode-hook #'evil-cleverparens-mode)

;;(use-package! ess-plot :defer t)
;; gptel
(setq gptel-model "gpt-4o-mini")
(menu-bar-mode 0)
(use-package! openapi-preview :commands 'openapi-preview)

;; mermaid ob
(setq ob-mermaid-cli-path "/Users/ry/.local/share/mise/installs/node/20/bin/mmdc")
