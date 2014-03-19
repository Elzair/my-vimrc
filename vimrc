" Basic Settings ------------------- {{{
" Disable vi compatibility
set nocompatible
" Vundle ---------------- {{{
" Install vundle
filetype off
set rtp+=~/.vim/bundle/vundle
call vundle#rc()
" Let Vundle manage Vundle
Bundle 'gmarik/vundle'
" List other bundles here
Bundle 'vim-scripts/LanguageTool'
Bundle 'Valloric/MatchTagAlways'
Bundle 'scrooloose/nerdtree'
Bundle 'puppetlabs/puppet-syntax-vim'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'tpope/vim-bundler'
Bundle 'kchmck/vim-coffee-script'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'hiukkanen/vim-hamlc'
Bundle 'digitaltoad/vim-jade'
Bundle 'jakar/vim-json'
Bundle 'lunaru/vim-less'
Bundle 'Elzair/vim-line-numbers'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'ahayman/vim-nodejs-complete'
Bundle 'tpope/vim-rails'
Bundle 'vim-ruby/vim-ruby'
Bundle 'wavded/vim-stylus'
Bundle 'sjl/vitality.vim'
Bundle 'mattn/emmet-vim'
Bundle 'ekalinin/Dockerfile.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'kien/ctrlp.vim'
Bundle 'moll/vim-node'
Bundle 'jelera/vim-javascript-syntax'
Bundle 'marijnh/tern_for_vim'
Bundle 'Valloric/YouCompleteMe'
" }}}
" Enable filetype detection
if has("autocmd")
  filetype plugin indent on
endif
" Set grammar rules
let g:languagetool_jar='/usr/local/Cellar/languagetool/2.3/libexec/languagetool-commandline.jar'
" Set default tab behavior
set expandtab
set shiftwidth=2
set softtabstop=2
" Set default directory for vim swap files
set dir=~/.vim/swp
" Unknown (?)
set ex
set secure
" }}}
" GUI Settings ----------------- {{{
" See gvimrc
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
" Add binding to swap current line with next
noremap <leader>- dd p
" Add binding to swap current line with previous
noremap <leader>_ dd P
" Add binding to swap current character with next
noremap <leader>= xp 
" Add binding to go to end of line in insert mode
inoremap <D-e> <esc>$a
" Add binding to go right one character in insert mode
inoremap <D-r> <esc>la
" Add bindings to convert selected word to uppercase
noremap <c-u> bviwU<esc>e
inoremap <c-u> <esc>bviwU<esc>ea
" Add bindings to easily edit and save .vimrc & .gvimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
nnoremap <leader>gv :vsplit $MYGVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>:source $MYGVIMRC<cr>:!cd $HOME/.vim/my-vimrc && cp -f $MYVIMRC vimrc && cp -f $MYGVIMRC gvimrc && git commit -a -m 'Modified .vimrc and/or .gvimrc' && git push<cr>
" Add binding to quickly get remote changes to .vimrc and .gvimrc
nnoremap <leader>pv !cd $HOME/.vim/my-vimrc && git pull && cp -f vimrc $MYVIMRC && cp -f gvimrc $MYGVIMRC<cr>:source $MYVIMRC<cr>:source $MYGVIMRC
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
  autocmd FileType javascript inoremap <buffer> eelse else {<cr>}<esc>O
  autocmd FileType javascript inoremap <buffer> ffor for () {<cr>}<esc>k$2hi
  autocmd FileType javascript inoremap <buffer> wwhile while () {<cr>}<esc>k$2hi
  autocmd FileType javascript inoremap <buffer> trca try {<cr>}<cr>catch (e) {<cr>}<esc>2kO
  autocmd FileType javascript inoremap <buffer> afun function() {<cr>}<esc>k$2hi
  autocmd FileType javascript inoremap <buffer> agfun function *() {<cr>}<esc>k$2hi
  autocmd FileType javascript inoremap <buffer> nfun function() {<cr>}<esc>k$3hi
  autocmd FileType javascript inoremap <buffer> ngfun function *() {<cr>}<esc>k$3hi
  autocmd FileType javascript inoremap <buffer> vfun var = function() {<cr>};<esc>k$14hi
  autocmd FileType javascript inoremap <buffer> efun exports. = function() {<cr>};<esc>k$14hi
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
  autocmd FileType php nnoremap <buffer> <localleader>c ^I//<esc>
  autocmd FileType php vnoremap <buffer> <localleader>c <esc>`<i/*<esc>`>a*/<esc>
  autocmd FileType php inoremap <buffer> iff if () {<cr>}<esc>k$2hi
  autocmd FileType php inoremap <buffer> elif else if () {<cr>}<esc>k$2hi
  autocmd FileType php inoremap <buffer> ifelif if () {<cr>}<cr>else if () {<cr>}<esc>3k$2hi
  autocmd FileType php inoremap <buffer> ifelse if () {<cr>}<cr>else {<cr>}<esc>3k$2hi
  autocmd FileType php inoremap <buffer> ifeiel if () {<cr>}<cr>else if () {<cr>}<cr>else {<cr>}<esc>5k$2hi
  autocmd FileType php inoremap <buffer> eelse else {<cr>}<esc>O
  autocmd FileType php inoremap <buffer> ffor for () {<cr>}<esc>k$2hi
  autocmd FileType php inoremap <buffer> wwhile while () {<cr>}<esc>k$2hi
  autocmd FileType php inoremap <buffer> cclass class  {<cr>}<esc>k$2hi
  " Add support for automatically adding brackets
  autocmd FileType javascript inoremap <buffer> ( ()<esc>i
  autocmd FileType javascript inoremap <buffer> { {}<esc>i
  autocmd FileType javascript inoremap <buffer> [ []<esc>i
  autocmd FileType javascript inoremap <buffer> ' ''<esc>i
  autocmd FileType javascript inoremap <buffer> " ""<esc>i
augroup END  
" }}}
" Ruby -------------------------- {{{
  autocmd!
  " autocmd FileType ruby,eruby set omnifunc=ruby,erubycomplete#CompleteRuby
  autocmd FileType ruby,eruby setlocal expandtab
  autocmd FileType ruby,eruby setlocal shiftwidth=2
  autocmd FileType ruby,eruby setlocal softtabstop=2
  autocmd FileType ruby,eruby setlocal number
  autocmd FileType ruby,eruby setlocal ruler
  autocmd FileType ruby,eruby nnoremap <buffer> <localleader>c ^I//<esc>
  autocmd FileType ruby,eruby vnoremap <buffer> <localleader>c <esc>`<i/*<esc>`>a*/<esc>
  autocmd FileType ruby,eruby inoremap <buffer> iff if <cr>end<esc>k$a
  autocmd FileType ruby,eruby inoremap <buffer> elif elsif <cr>end<esc>k$2hi
  autocmd FileType ruby,eruby inoremap <buffer> ifelif if <cr>elsif <cr>end<esc>2k$a
  autocmd FileType ruby,eruby inoremap <buffer> ifelse if <cr>else <cr>end<esc>2k$a
  autocmd FileType ruby,eruby inoremap <buffer> ifeiel if <cr>elsif <cr>else <cr>end<esc>3k$a
  autocmd FileType ruby,eruby inoremap <buffer> eelse else <cr><Tab>
  autocmd FileType ruby,eruby inoremap <buffer> ffor for  in <cr>end<esc>k$3hi
  autocmd FileType ruby,eruby inoremap <buffer> wwhile while <cr>end<esc>k$a
  autocmd FileType ruby,eruby inoremap <buffer> uunles unless <cr>end<esc>k$a
  autocmd FileType ruby,eruby inoremap <buffer> cclass class <cr>end<esc>k$a
  autocmd FileType ruby,eruby inoremap <buffer> cfun def <cr>end<esc>k$a
  autocmd FileType ruby,eruby inoremap <buffer> mmod module <cr>end<esc>k$a
  " Add support for automatically adding brackets
  autocmd FileType ruby,eruby inoremap <buffer> ( ()<esc>i
  autocmd FileType ruby,eruby inoremap <buffer> { {}<esc>i
  autocmd FileType ruby,eruby inoremap <buffer> [ []<esc>i
  autocmd FileType ruby,eruby inoremap <buffer> ' ''<esc>i
  autocmd FileType ruby,eruby inoremap <buffer> " ""<esc>i
  " Autocompletion options
  autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1 
  autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
  autocmd FileType ruby,eruby let g:rubycomplete_rails = 1

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
  autocmd Filetype markdown let g:vim_markdown_initial_foldlevel=1
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
function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction
:inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>
let g:easytags_cmd = '/usr/local/bin/ctags'
let g:easytags_file = '~/.vimtags'
" }}}
" Add friendly ASCII-art cat
" echom ">^.^<"
