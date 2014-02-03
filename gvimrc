" Syntax Highlighting -------------------------- {{{
" Enable syntax highlighting
" NOTE: For some reason this needs to be defined in .gvimrc
" to make syntax highlighting start by default
syntax on
" }}}
" Graphical Settings --------------------------- {{{
" Enable Solarized background
set background=dark
colorscheme solarized
" Set default width & height
set lines=32
set columns=177
" Use Inconsolata font
set guifont=Inconsolata:h15
" Disabled scrollbars and unnecessary menu
set guioptions-=T
set guioptions-=L
set guioptions-=r
" }}}
" Mouse Settings ------------------------------- {{{
" Enable focus follows mouse
set mouse=a
set mousefocus
" }}}
" NERDTree Settings ---------------------------- {{{
" Start NERDTree on startup
let g:nerdtree_tabs_open_on_gui_startup=1
" Start NERDTree on new tab
let g:nerdtree_tabs_open_on_new_tab=1
" Synchronize view of all NERDTree windows in all tabs
let g:nerdtree_tabs_synchronize_view=1
autocmd vimenter * if !argc() | NERDTree | endif
" }}}
