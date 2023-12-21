
;;;;;;;;;;;;;;;;
;;; packages ;;;
;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(defvar myPackages
  '(better-defaults                 
    dracula-theme
    elpy
    flycheck))

(defun refresh-packages ()
  (package-refresh-contents)
  (mapc #'package-install myPackages))

;; evaluer la ligne ci-dessous de temps à autre
;;(refresh-packages)


(elpy-enable)
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))




;;;;;;;;;;;;;;;;
;;; theme    ;;;
;;;;;;;;;;;;;;;;

;; choix du thème


(load-theme 'dracula t)

(global-hl-line-mode 1)
(set-face-background 'hl-line "#151515")
(set-face-foreground 'hl-line "#AAAAAA")
;;(set-background-color "#151515")


;; taille des fonts et choix de la police
(set-face-attribute 'default nil :font "DejaVu Sans Mono-14")

;; virer les barres
(menu-bar-mode -1)
(tool-bar-mode -1)

;; naviguer entre les fenêtres
(windmove-default-keybindings)

;; virer le bip
(setq ring-bell-function 'ignore)

;; afficher les numéros de lignes
(global-display-line-numbers-mode nil)

;; changer le keybinding pour déposer la marque
(keymap-global-set "C-x m" 'set-mark-command)
