source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


"add the numbers gutter
:set number
:set ruler
"disable word wrapping
:set nowrap
" makes the yank also be taken to the OS lipboard
:set clipboard=unnamed

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" this defines the leader key of vim to be the comma key
"let mapleader=","
let mapleader="\<space>"

"adds the syntax hightlighteing show
:syntax on

" Just to beginning and end of lines easier. From http://vimbits.com/bits/16
nnoremap <leader>H H
nnoremap <leader>L L
vnoremap <leader>H H
vnoremap <leader>L L
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $
map J 10j
map K 10k

" paste from the last yanked thing avoiding the last deleted thing for example
:map <leader><leader> "0p
:map <leader>' viwdi"<esc>pa"
 

nnoremap Y y$
" :vmap y y']
" :vmap Y Y']
":vmap p p']
":vmap P P']

" These are the lines that are needed for Vundle
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" Plugin 'scrooloose/nerdtree'
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'flazz/vim-colorschemes'
" Plugin 'ctrlpvim/ctrlp.vim'
" Plugin 'vim-airline/vim-airline'
" Plugin 'maksimr/vim-jsbeautify'
" Plugin 'marcelbeumer/javascript-syntax.vim'
" Plugin 'easymotion/vim-easymotion'
" Plugin 'leafgarland/typescript-vim'
" call vundle#end()

"opens a close NERDTree with Ctrl+n
:map <C-n> :NERDTreeToggle<CR>
"show also all the hidden files in NERDTree
let NERDTreeShowHidden=1

" my selected color scheme in vim from flazz/vim-colorschemes
" colorscheme Benokai
"colorscheme jellybeans
"colorscheme jelleybeans


" hightlight the current line where the cursor is the position of this is critical it has to be after the setting of the genral theme
:set cursorline
" changes the hightlight of the corsor line ctermbg is what actually did it
:hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#282828 gui=NONE

" makes indentation work depanding on plugins and the type of the file
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" and keybinding for auto indentation pressting Ctrl+f on normal mode on top
autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

vnoremap <leader><leader>" di""<esc>P 
vnoremap <leader><leader>' di''<esc>Pl

" ignore the caseing on searches
set ignorecase 

colorscheme darkblue
set guifont=Ubuntu_Mono:h12:b:cANSI:qDRAFT
set lines=40
set columns=120
set nobackup
set noundofile


