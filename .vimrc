" To open and close folds, use 'za'
" Vundle ---------------------------------- {{{
set nocompatible         " be iMproved, required
filetype off             " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'Valloric/YouCompleteMe'
" Plugin 'L9'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Bundle "myusuf3/numbers.vim"

call vundle#end()
filetype plugin indent on
" }}}
" Pathogen Replaced by Vundle-------------- {{{
" execute pathogen#infect()

" filetype plugin indent on
" syntax on
" }}}
" Settings ---------------------------------- {{{
" Set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
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
set colorcolumn=120
highlight ColorColumn ctermbg=darkgray
" }}}
" Currsor ------------------ {{{
augroup cursor_display
	autocmd!
	autocmd InsertEnter,InsertLeave * set cul!
augroup END 
" }}}
" Statusline --------------- {{{
set noruler
set laststatus=2
"set statusline=Current:\ %4l\ Total:\ %4L 
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
" }}}
" Mappings ---------------- {{{
let mapleader = "," " set mapleader to comma
let localleader = "\\" " set localleader to \
noremap <leader><space> viw
noremap <leader><c-d> dd<esc>
" Toggle paste mode on and off
noremap <leader>pp :setlocal paste!<cr>
" Ctr-d
noremap <leader>- Vdp
    " shifts line of cursor down 1 line.  doesn't work at end of file
noremap <leader>_ VdkP
nnoremap <leader>\ dd
" Normal Mode Mappings ---------------- {{{
	" Numbers toggling
nnoremap <localleader>c I//
	" Doxygen Mappings
nnoremap <F6> :Dox<CR>
	" YCM Mappings
nnoremap <leader>F :YcmCompleter FixIt<cr>
nnoremap <leader>gi :YcmCompleter GoToInclude<CR>
nnoremap <leader>gd :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gD :YcmCompleter GoToDefinition<CR>
nnoremap <leader>gg :YcmCompleter GoTo<CR>
nnoremap <leader>gt :YcmCompleter GetType<CR>
nnoremap <leader>GD :YcmCompleter GetDoc<CR>
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
nnoremap <leader>< viw<esc>a><esc>hbi<<esc>lel
    " Move to (Beginning) / End of Line
nnoremap H <home>
nnoremap L <end>
    " Yank word
nnoremap <leader>y mkevby`k
	" Cut word
nnoremap <leader>c bevbc
nnoremap <leader>d bevbd
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
vnoremap <leader>jk <esc>
" }}}
" Insert Mode Mappings ------------------ {{{
inoremap <leader><c-d> <esc>ddi
inoremap <leader>\ <esc>ddi
inoremap <leader><c-u> <esc>VU<esc>$i<right>
inoremap jk <esc>
inoremap JK <esc>
inoremap <leader>b <CR>{<CR><CR>}<esc>ki<tab>
inoremap <leader>B <CR>{<CR><CR>};<esc>ki<tab>
inoremap <leader>p <esc>pA
inoremap <leader>P <esc>PA
    " Disable arrow navigation in insert mode
inoremap <esc> <nop>
inoremap <Up> <esc>i
inoremap <Left> <nop>
inoremap <Right> <nop>
inoremap <Down> <nop>
	" Common Makefile stuff
inoremap <leader>m $? -o $@
inoremap <leader>M $(CX) $(CXXFLAGS) $? -o $@
" }}}
" Operator Maps ------------------------- {{{
	" Operate on parameters
onoremap p i(
onoremap <leader>p i{
	" Operate in next ()
onoremap in( :<c-u>normal! f(vi(<cr>
onoremap in{ :<c-u>normal! f{vi{<cr>
onoremap in< :execute <c-u>normal! f<vi<<cr>
onoremap in" :execute <c-u>normal! f"vi"<cr>
	" Operate in last ()
onoremap il( :<c-u>normal! F)vi(<cr>
onoremap il{ :<c-u>normal! F}vi{<cr>
onoremap il< :execute <c-u>normal! F>vi<<cr>
onoremap il" :execute <c-u>normal! F"vi"<cr>
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
	autocmd FileType javascript :iabbrev <buffer> if if (<left> " )
	autocmd FileType javascript :iabbrev <buffer> while while (<left> " )
	autocmd FileType javascript :iabbrev <buffer> function function(<left> " )
augroup END 
" }}}
" C file settings --------------------------{{{{
augroup filetype_c
	autocmd!
	autocmd BufRead,BufNewFile *.c set filetype=c.doxygen
augroup END
" }}}
" C++ file settings --------------------------------------{{{
augroup filetype_cpp
	autocmd!
	autocmd BufNewFile *.cpp 0r ~/.vim/skeleton.cpp
	autocmd BufNewFile *.cpp set filetype=cpp.doxygen
	autocmd BufNewFile *.h 0r ~/.vim/skeleton.h
	autocmd BufNewFile *.hpp 0r ~/.vim/skeleton.h
	autocmd BufWinEnter *.cpp iabbrev typedef using
	autocmd BufWinEnter *.cpp.doxygen iabbrev typedef using
	autocmd BufWinEnter *.cpp setlocal foldmethod=syntax
	autocmd BufWinLeave *.cpp mkview
	autocmd BufWinEnter *.cpp silent loadview
	autocmd BufWinLeave *.h mkview
	autocmd BufWinEnter *.h silent loadview
	autocmd BufWinEnter *.cpp nnoremap <leader>es :vsplit ~/.vim/UltiSnips/cpp.snippets<cr>
	autocmd BufWinEnter *.h nnoremap <leader>es :vsplit ~/.vim/UltiSnips/cpp.snippets<cr>
augroup END
" }}}
" LC3 file settings --------------------------------------{{{
augroup filetype_lc3
	autocmd!
	autocmd BufNewFile,BufRead *.asm set filetype=lc3
	autocmd BufNewFile,BufRead *.asm set tabstop=8
	autocmd BufNewFile,BufRead *.asm set softtabstop=8
	autocmd BufNewFile,BufRead *.asm nnoremap <leader>es :vsplit ~/.vim/UltiSnips/lc3.snippets<cr>
augroup END
" }}}
" Makefile settings -------------------------------------{{{
augroup filetype_makefile
	autocmd!
	autocmd BufNewFile Makefile 0r ~/.vim/skeleton.Make
	autocmd BufNewFile makefile :echoerr "makefiles must be named Makefile to receive credit!"
augroup END
" }}}
" Snippets file settings-------------------{{{
augroup filetype_snippet
	autocmd!
	autocmd BufNewFile *.snippet set syntax on
augroup END
" }}}
" Add On Stuff -----------------------------{{{
" Doxygen ----------------------------------{{{
let g:DoxygenToolkit_authorName = "Nathaniel Bleier <nbleier3@illinois.edu>"
" }}}
" YouCompleteMe ----------------------------{{{
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion=[]
let g:ycm_key_list_previous_completion=[]
" }}}
" UltiSnips --------------------------------{{{
" Track the plugin
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
" }}}
" Set Secure
set exrc
set secure
" }}}
" Helper Functions -----------{{{
" Returns true if paste mode is enabled
function! HasPaste()
	if &paste
		return 'PASTE MODE '
	en
	return ' '
endfunction
"}}}
