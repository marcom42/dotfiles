;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

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
;;(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
;(setq display-line-numbers-type t)
(setq display-line-numbers-type 'relative)


;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")


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

;; -------- CUSTOM ---------

;;;;;;;;;;; THEME ;;;;;;;;;;;
;(setq doom-theme 'doom-monokai-classic)
(use-package doom-themes
  :ensure t
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-monokai-classic t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
; Select theme by C-h v neo-theme - avoid next line
;  (Doom-themes-neotree-config)
  ;; or for treemacs users
;  (setq doom-themes-treemacs-theme "doom-atom") ; use "doom-colors" for less minimal icon theme
;  (doom-themes-treemacs-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))


;; Default Emacs splash image
(setq fancy-splash-image "~/.config/images/emacs/emacs-gnu-logo.png")

;; Fonts
;; Use Ubuntu Mono on Ubuntu, Menlo on Mac
(setq doom-font (font-spec :family "Ubuntu Mono" :size 22 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "Ubuntu Mono" :size 23))



;;;;;;;;;; PACKAGES ;;;;;;;;;;;;

;; ORG-ROAM
(use-package org-roam
  :ensure t
  :custom
  (org-roam-directory "~/org")
  :bind (("C-c n l" . org-roam-buffer-toggle)
         ("C-c n f" . org-roam-node-find) ; Start a session to find or create a node
         ("C-c n i" . org-roam-node-insert))
  :config
  (org-roam-db-autosync-mode))


;; DEFT
(when (require 'deft nil 'noerror)
  (setq
   deft-use-filename-as-title t
     deft-extensions '("txt" "tex" "org")
     deft-directory "~/org/"
     deft-text-mode 'org-mode))

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '((php . nil)))


;;;;;;;;;; PROJECTS ;;;;;;;;;;;;

;; Projectile

(projectile-add-known-project "/projects/drupal/myITAS")
(projectile-add-known-project "~/.config/doom")

;; Neotree

; Select theme by C-h v neo-theme
