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
so $HOME/.gvim_dim
" Use Inconsolata font
if has('macunix')
  set guifont=Inconsolata\ LGC:h14
else
  set guifont=Inconsolata\ LGC\ 12
endif
" Disabled scrollbars and unnecessary menu
set guioptions-=T
set guioptions-=L
set guioptions-=r
" }}}
" Mouse Settings ------------------------------- {{{
" Enable focus follows mouse
" let &mouse=a
let &mousefocus=1
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
