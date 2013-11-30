" Basic settings ------------------- {{{
" Install Pathogen
execute pathogen#infect()
" Disable vi compatibility
set nocompatible
" Enable syntax highlighting
syntax on
" Enable filetype detection
if has("autocmd")
  filetype plugin indent on
endif
" Set grammar rules
let g:languagetool_jar='/usr/local/Cellar/languagetool/2.3/libexec/languagetool-commandline.jar'
" Unknown (?)
set ex
set secure
" }}}
" GUI Settings ----------------- {{{
" Enable Solarized background
set background=dark
colorscheme solarized
" Enable focus follows mouse
set mouse=a
" Start NERDTree on startup
autocmd vimenter * if !argc() | NERDTree | endif
" }}}
" General Mappings ------------- {{{
" Enable scroll wheel support
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
" Add mapping to exit Insert Mode that is easier
" on the fingers than <Esc>
imap ii <Esc>
" Set leader & local leader
let mapleader = "-"
let maplocalleader = "\\"
" Make - swap current line with next
noremap <leader>- dd p
" Make _ swap current line with previous
noremap <leader>_ dd P
" Add bindings to convert selected word to uppercase
noremap <c-u> bviwU<esc>e
inoremap <c-u> <esc>bviwU<esc>ea
" Add bindings to easily edit and save .vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>:!cd $HOME/.vim/my-vimrc && cp -f $MYVIMRC vimrc && git commit -a -m 'Modified .vimrc' && git push<CR>
" Abbreviations for email, copyright and signature
iabbrev @@ elzairthesorcerer@gmail.com
iabbrev ccopy Copyright 2013 Philip Woods, all rights reserved.
iabbrev ssig --<cr>Excelsior!
" Add mapping to put double & single quotes & brackets around current word in normal mode
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
nnoremap <leader>> viw<esc>a><esc>hbi<<esc>lel
" Add mapping to put quotes around selected text in visual mode
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
" Add mapping to go to beginning and end of current line
nnoremap <leader>h ^
nnoremap <leader>l $
" Add mapping to insert parentheses
inoremap <leader>; ();
" Add mapping to copy all text in a file
" nnoremap <leader>ca gg0VG$y
" Add mappings to copy all text in current buffer to clipboard
nnoremap <leader>ca gg"*yG
nnoremap <D-c> gg"*yG
" Add mappings to cut all text in current buffer to clipboard
nnoremap <leader>xa gg"*dG
nnoremap <D-x> gg"*dG
" Add mappings to paste contents of clipboard after cursor
nnoremap <leader>pa "*p
nnoremap <D-v> "*p
" Add mapping to paste contents of clipboard before cursor
nnoremap <leader>pb "*P
nnoremap <D-v> "*P
" Add mappings to delete all text in a buffer
nnoremap <leader>da gg0vG$d
" Add mapping to fold/unfold foldings with a double click
nnoremap <2-LeftMouse> za
" Add mapping to toggle spell check functionality
nnoremap <leader>sp :setlocal spell! spelllang=en_us<CR>
" Add mapping to call LanguageTool's grammar checker
nnoremap <leader>gr :LanguageToolCheck<CR>
" Disable Arrow Keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>
" inoremap <Up> <nop>
" inoremap <Down> <nop>
" inoremap <Left> <nop>
" inoremap <Right> <nop>
vnoremap <Up> <nop>
vnoremap <Down> <nop>
vnoremap <Left> <nop>
vnoremap <Right> <nop>
" }}}
" Settings for Specific Files {{{
" Javascript {{{
let g:syntastic_javascript_checkers=['jslint']
augroup filetype_js
  autocmd!
  autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript set expandtab
  autocmd FileType javascript set shiftwidth=2
  autocmd FileType javascript set softtabstop=2
  autocmd FileType javascript set number
  autocmd FileType javascript set ruler
  autocmd FileType javascript nnoremap <buffer> <localleader>c ^I//<esc>
  autocmd FileType javascript vnoremap <buffer> <localleader>c <esc>`<i/*<esc>`>a*/<esc>
  autocmd FileType javascript inoremap <buffer> iff if () {<cr>}<esc>k$2hi
  autocmd FileType javascript inoremap <buffer> elif else if () {<cr>}<esc>k$2hi
  autocmd FileType javascript inoremap <buffer> ifelif if () {<cr>}<cr>else if () {<cr>}<esc>3k$2hi
  autocmd FileType javascript inoremap <buffer> ifelse if () {<cr>}<cr>else {<cr>}<esc>3k$2hi
  autocmd FileType javascript inoremap <buffer> ifeiel if () {<cr>}<cr>else if () {<cr>}<cr>else {<cr>}<esc>5k$2hi
  autocmd FileType javascript inoremap  <buffer> eelse else {<cr>}<esc>O
  autocmd FileType javascript inoremap <buffer> ffor for () {<cr>}<esc>k$2hi
  autocmd FileType javascript inoremap <buffer> wwhile while () {<cr>}<esc>k$2hi
  autocmd FileType javascript inoremap <buffer> tc try {<cr>}<cr>catch (e) {<cr>}<esc>2kO
  autocmd FileType javascript inoremap <buffer> afun function() {<cr>}<esc>k$2hi
  autocmd FileType javascript inoremap <buffer> nfun function() {<cr>}<esc>k$3hi
  autocmd FileType javascript inoremap <buffer> vfun var = function() {<cr>};<esc>k$14hi
  autocmd FileType javascript inoremap <buffer> cfun function() {<cr>});<esc>k$2hi
  autocmd FileType javascript inoremap <buffer> funmod (function() {<cr>}());<esc>O<esc>0i<Space>
  autocmd FileType javascript inoremap <buffer> ddef define([], function() {<cr>});<esc>k$14hi
  autocmd FileType javascript iabbrev  <buffer> rret return;<esc>i
  " Add support for automatically adding brackets
  autocmd FileType javascript inoremap <buffer> ( ()<esc>i
  autocmd FileType javascript inoremap <buffer> { {}<esc>i
  autocmd FileType javascript inoremap <buffer> [ []<esc>i
  autocmd FileType javascript inoremap <buffer> ' ''<esc>i
  autocmd FileType javascript inoremap <buffer> " ""<esc>i
augroup END
" }}}
" HTML {{{
augroup filetype_html
  autocmd!
  autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html setlocal expandtab
  autocmd FileType html setlocal shiftwidth=2
  autocmd FileType html setlocal softtabstop=2
  autocmd FileType html setlocal number
  autocmd FileType html setlocal ruler
  autocmd FileType html nnoremap <buffer> <localleader>f Vatzf
augroup END
" }}}
" CSS {{{
augroup filetype_css
  autocmd!
  autocmd FileType css set omnifunc=csscomplete#CompleteCSS
  autocmd FileType css setlocal expandtab
  autocmd FileType css setlocal shiftwidth=2
  autocmd FileType css setlocal softtabstop=2
  autocmd FileType css setlocal number
  autocmd FileType css setlocal ruler
augroup END  
" }}}
" XML {{{
augroup filetype_xml
  autocmd!
  autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
  autocmd FileType xml setlocal expandtab
  autocmd FileType xml setlocal shiftwidth=2
  autocmd FileType xml setlocal softtabstop=2
  autocmd FileType xml setlocal number
  autocmd FileType xml setlocal ruler
augroup end
" }}}
" C {{{
augroup filetype_c
  autocmd!
  autocmd FileType c set omnifunc=ccomplete#Complete
  autocmd FileType c setlocal expandtab
  autocmd FileType c setlocal shiftwidth=2
  autocmd FileType c setlocal softtabstop=2
  autocmd FileType c setlocal number
  autocmd FileType c setlocal ruler
  autocmd FileType c nnoremap <buffer> <localleader>c ^I//<esc>
  autocmd FileType c vnoremap <buffer> <localleader>c <esc>`<i/*<esc>`>a*/<esc>
augroup END
" }}}
" Python {{{
augroup filetype_py
  autocmd!
  autocmd FileType python set omnifunc=pythoncomplete#Complete
  autocmd FileType python setlocal expandtab
  autocmd FileType python setlocal shiftwidth=2
  autocmd FileType python setlocal softtabstop=2
  autocmd FileType python setlocal number
  autocmd FileType python setlocal ruler
  autocmd FileType python iabbrev iff if :<esc>hi
  autocmd FileType python nnoremap <buffer> <localleader>c ^I#<esc>
augroup END
" }}}
" PHP {{{
augroup filetype_php
  autocmd!
  autocmd FileType php set omnifunc=phpcomplete#CompletePHP
  autocmd FileType php setlocal expandtab
  autocmd FileType php setlocal shiftwidth=2
  autocmd FileType php setlocal softtabstop=2
  autocmd FileType php setlocal number
  autocmd FileType php setlocal ruler
augroup END  
" }}}
" Markdown {{{
augroup filetype_md
  autocmd!
  autocmd FileType markdown setlocal expandtab
  autocmd FileType markdown setlocal shiftwidth=2
  autocmd FileType markdown setlocal softtabstop=2
  autocmd FileType markdown setlocal number
  autocmd FileType markdown setlocal ruler
  " Try to make operator-pending mappings
  autocmd BufNewFile,BufRead *.md,*.markdown onoremap ih :<c-u>execute "normal! ?^\\(==\\+\\\\|--\\+\\)$\r:nohlsearch\rkvg_"<cr>
  autocmd BufNewFile,BufRead *.md,*.markdown onoremap ah :<c-u>execute "normal! ?^\\(==\\+\\\\|--\\+\\)$\r:nohlsearch\rg_vk0"<cr>
augroup END
" }}}
" Vimscript file settings ------------------ {{{
augroup filetype_vim
  autocmd!
  autocmd FileType vim setlocal expandtab
  autocmd FileType vim setlocal shiftwidth=2
  autocmd FileType vim setlocal softtabstop=2
  autocmd FileType vim setlocal number
  autocmd FileType vim setlocal ruler
  " Enable code folding for vimscript files
  autocmd FileType vim setlocal foldmethod=marker 
augroup END
" }}}
" }}}
" Tab completion ------------------ {{{
let g:neocomplcache_enable_at_startup=1
map <C-F6> :ctags -R --exclude=bin --exclude=.git .<CR>
map <F8> :TagbarToggle<CR>
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'    
      return "\<Tab>"
  else
    if &omnifunc != ''
      return "\<C-X>\<C-O>"
    elseif &dictionary != ''
      return "\<C-N>"
    endif
  endif
endfunction
inoremap <Tab> <C-R>=SuperCleverTab()<cr>
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_file = '~/.vimtags'
" }}}
" Add friendly ASCII-art cat
" echom ">^.^<"
