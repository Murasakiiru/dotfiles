" mode non compatible avec vi
set nocompatible

" On active la coloration syntaxique
syntax on

" Force le support de 256 couleurs
set t_Co=256

" Theme
colorscheme wombat256
"colorscheme evening

" Enregistre le fichier en tant que root avec :wr
cab wr w !sudo tee %

" Raccourcis clavier
map <F2> <ESC>:w<CR>
map <F3> <ESC>:set nu!<CR>
map <F4> <ESC>:set paste!<CR>
map <F10> <ESC>:wr<CR>

" Encodage par défaut
set encoding=utf-8

" Fonts par defaut pour gvim
if has('gui_running')
    set guifont=Monaco\ Bold\ 10
endif

" Replis
"set fdc=2
"set fdm=indent

" On vérifie automatiquement les parenthèses
set sm!

" Numérotation des lignes
set nu!

" Utilisation de la souris

" Active le mode sélection
"set selectmode+=mouse

" Autoindentation
set cindent
set autoindent

" La touche TAB est remplacée par 4 espaces (good for Python programming :) )
set tabstop=4
set shiftwidth=4
set expandtab

" Permet d'utiliser la touche backspace pour effacer du texte
set bs=2
