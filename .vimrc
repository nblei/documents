" To open and close folds, use 'za'
" Search Highlihgting
set hlsearch incsearch
" Set Line Numbers
set number
set numberwidth=3
" Line wrapping and indendting
set tabstop=4
set softtabstop=4
set noexpandtab
set wrap
set shiftwidth=4
set autoindent
set smartindent
set cindent
set pastetoggle=<f5>
set colorcolumn=80
highlight ColorColumn ctermbg=darkgray
" Currsor ------------------ {{{
augroup cursor_display
	autocmd!
	autocmd InsertEnter,InsertLeave * set cul!	
augroup END 
" }}}
" Statusline --------------- {{{
set noruler
set laststatus=2
set statusline=Current:\ %4l\ Total:\ %4L 
" }}}
" Mappings ---------------- {{{
let mapleader = "," " set mapleader to comma
let localleader = "\\" " set localleader to \
noremap <leader><space> viw
noremap <leader><c-d> dd<esc>
" Ctr-d
noremap <leader>- Vdp
    " shifts line of cursor down 1 line.  doesn't work at end of file
noremap <leader>_ VdkP
nnoremap <leader>\ dd
" Normal Mode Mappings ---------------- {{{
    " Replace searching with 'magic' searching
nnoremap / /\v
nnoremap ? ?\v
    " Removes search highlighting
nnoremap <leader>/ :nohlsearch<cr>
nnoremap <leader>? :nohlsearch<cr>
    " Highlight trailing whitespace
nnoremap <leader>w :match Error /\v\s+$/<cr>
nnoremap <leader>W :match Error //<cr>
    " Add semicolon to end of line;
nnoremap <expr> <leader>; getline('.') =~ ';$' ? '' : "mqA;\<esc>`q"
    " Opens previous buffer in window to right
noremap <leader>ol :execute "rightbelow vsplit " . bufname("#")<cr>
    " Make line upper case
nnoremap <leader><c-u> VU
    " Open vimrc in a vertical split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
    " reset vimrc after editing
nnoremap <leader>sv :source $MYVIMRC<cr>
    " Encloses word in ", ', (, {, etc
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
    " Move to (Beginning) / End of Line
nnoremap H <home>
nnoremap L <end>
    " Yank word
nnoremap <leader>y mkevby`k
	" Cut word
nnoremap <leader>c mkevbc<esc>'k
    " Split Window Navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" }}}
" Visual Mode Mappings ------------------ {{{
vnoremap <leader>\ U
vnoremap <leader>" c""<esc>P
vnoremap <leader>( c()<esc>P
vnoremap <leader>{ c{}<esc>P
vnoremap <leader>' c''<esc>P
vnoremap jk <esc>
" }}}
" Insert Mode Mappings ------------------ {{{
inoremap <leader><c-d> <esc>ddi
inoremap <leader>\ <esc>ddi
inoremap <leader><c-u> <esc>VU<esc>$i<right>
inoremap jk <esc>
    " Disable arrow navigation in insert mode
inoremap <esc> <nop>
inoremap <Up> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Down> <nop>
" }}}
" Operator Maps ------------------------- {{{
	" Operate on parameters
onoremap p i(
onoremap <leader>p i{
	" Operate in next ()
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
	" Operate in last ()
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
" }}}
" }}}
" Abbrevation typo corrections ------------ {{{
iabbrev adn and
iabbrev waht what
iabbrev tehn then
iabbrev uin8_t uint8_t
iabbrev uin_8 uint8_t
iabbrev uint_8 uint8_t
iabbrev @@ nbleier3@illinois.edu
iabbrev ccopy Copywright 2017 Nathaniel Bleier, all rights reserved.
iabbrev ssig -- <cr>Nathaniel Bleier<cr>nbleier3@illinois.edu
" }}}
" Vimscript file settings ---------------------- {{{
augroup filetype_vim
	autocmd!
	autocmd FileType vim setlocal foldmethod=marker
	autocmd Filetype vim setlocal foldlevelstart=0
augroup END
" }}}
" Javascript file settings --------------------- {{{
augroup filetype_javascript
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
	autocmd FileType javascript :iabbrev <buffer> if if (<left>
	autocmd FileType javascript :iabbrev <buffer> while while (<left>
	autocmd FileType javascript :iabbrev <buffer> function function(<left>
augroup END 
" }}}

" Python file settings ---------------------- {{{
augroup filetype_python
	autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    " autocmd FileType python :iabbrev <buffer> if if:<left>
augroup END
" }}}

" C file settings --------------------------{{{{
augroup filetype_c
	autocmd!
	autocmd BufRead,BufNewFile *.c set filetype=c.doxygen
augroup END
" }}}
" C++ file settings --------------------------------------{
augroup filetype_cpp
	autocmd!
	autocmd BufNewFile *.cpp 0r ~/.vim/skeleton.cpp
	autocmd BufNewFile *.cpp set filetype=cpp.doxygen
	autocmd BufNewFile *.h 0r ~/.vim/skeleton.h
augroup END
" }}}
" Add On Stuff -----------------------------{{{
" Pathogen _--------------------------------{{{
execute pathogen#infect()
" }}}
" YouCompeteMe ----------------------------{{{
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" }}}
" }}}
" Set Secure
set exrc
set secure
