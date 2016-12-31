" Set Line Numbers
set number
set numberwidth=3
" Line wrapping and indendting
set wrap
set shiftwidth=4
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
" Normal Mode Mappings
nnoremap <leader>\ dd
nnoremap <leader><c-u> VU
	" Open vimrc in a vertical split window
nnoremap <leader>ev :vsplit $MYVIMRC<cr>
	" reset vimrc after editing
nnoremap <leader>sv :source $MYVIMRC<cr>
nnoremap <leader>" viw<esc>a"<esc>hbi"<esc>lel
nnoremap <leader>' viw<esc>a'<esc>hbi'<esc>lel
nnoremap <leader>( viw<esc>a)<esc>hbi(<esc>lel
nnoremap <leader>{ viw<esc>a}<esc>hbi{<esc>lel
nnoremap H <home>
nnoremap L <end>
	" Split Window Navigation
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Visual Mode Mappings
vnoremap <leader>\ U
vnoremap <leader>" c""<esc>P
vnoremap <leader>( c()<esc>P
vnoremap <leader>{ c{}<esc>P
vnoremap <leader>' c''<esc>P
" Insert Mode Mappings
inoremap <leader><c-d> <esc>ddi
inoremap <leader>\ <esc>ddi
inoremap <leader><c-u> <esc>VU<esc>$i<right>
inoremap jk <esc>
inoremap <esc> <nop>
inoremap <Up> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Down> <nop>
" Operator Maps
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
" Abbrevation typo corrections ------------ {{{
iabbrev adn and
iabbrev waht what
iabbrev tehn then
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
augroup END 
" }}}

" Python file settings ---------------------- {{{
augroup filetype_python
	autocmd!
    autocmd FileType python nnoremap <buffer> <localleader>c I#<esc>
    autocmd FileType python :iabbrev <buffer> iff if:<left>
augroup END
" }}}

