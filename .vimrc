" Set line number and relative line numbers
set number relativenumber

" shows the line number and the column that the cursor is at
set ruler

" Disable word wrapping
set nowrap

" Makes the yank also be taken to the OS's clipboard
set clipboard=unnamed

" disable the bell sound
set belloff=all

" ignore the caseing on searches
set ignorecase

" disable all folding (mosting on vimdiff)
set nofoldenable

" this was added mainly for the $ sign so that when pressing w or e or * or $ these
" chars listed here will be included as part of the word
" (so the cursor will not select till the $ and without it)
set iskeyword=@,48-57,_,192-255,$

" ensures all of the search results are highlighted.
set hlsearch

" Set the cursor char on each state right
if $TERM == 'cygwin'
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
else
    let &t_ti="\e[1 q"
    let &t_SI="\e[5 q"
    let &t_EI="\e[1 q"
    let &t_te="\e[0 q"
endif

" Defines the leader key of vim to be the space key
let mapleader="\<space>"

" Adds the syntax hightlighteing show
syntax on

" Map H and L to from their default to be the beginning and the end of the
" line.. and map their original functionality to the leader-key combination
" From http://vimbits.com/bits/16
nnoremap <leader>H H
nnoremap <leader>L L
vnoremap <leader>H H
vnoremap <leader>L L
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" go to last buffer (like ctrl+tab)
nnoremap <leader>f :b#<CR>

" this will remove the search highlight (activated in hlsearch) when pressing // (double slash)
nnoremap <leader>/ :noh<CR>
highlight Search guibg=#444444 guifg=white

" pressing shift+j and shift+k resulting J causes thecursor to jump 10 lines forward this
" simulate a situation like pressing the gas when moving forward in the file. toggle the
" ressshift on shift as you are pressing j or k
map J 10j
map K 10k

" Jump to the last place that was edited using the last mark
map <leader>u `.

" Jump to the last place that was edited
nnoremap <leader>g g;

" make x command not fill the buffer
nnoremap x "_x

" Y will yank all the way from the cursor to the end of the row
nnoremap Y y$

" map leader followed by s to run the macro that was recorded into a
nmap <leader>s 1@a

" Map control+h and control+l to % which will jump to the corresponding closing bracket (its just easier and more responsive)
map <c-h> [{
map <c-l> %

" Paste from the last yanked thing (avoiding the last deleted thing for example)
nnoremap <leader>p "0p
vnoremap <leader>p "0p

" Surround the current word (with big W) where the cursor is on with " or '
" without using the surround with plugin.
nnoremap <leader>' viW<esc>a'<esc>Bi'<esc>lEl
nnoremap <leader>" viW<esc>a"<esc>Bi"<esc>lEl

" NOTE to exit and save the current buffer use the build-in ZZ
" exit without saving using ZX from current buffer
nnoremap ZX :q!<enter>
" exit without saving using ZQ from all buffers
nnoremap ZQ :qa!<enter>

" combinations with the alt-key on macOS and other operating system
if system('uname -s') == "Darwin\n" " This is a mac machine (macOS)
  " move the line that you are at one line to the top or one line to the bottom using alt+j or alt+k
  nnoremap ∆ :m .+1<CR>==
  nnoremap ˚ :m .-2<CR>==
  inoremap ∆ <Esc>:m .+1<CR>==gi
  inoremap ˚ <Esc>:m .-2<CR>==gi
  vnoremap ∆ :m '>+1<CR>gv=gv
  vnoremap ˚ :m '<-2<CR>gv=gv
  " Alt+l will move to the next capital letter on the same line or above
  vnoremap ¬ /\u<CR>
  vnoremap ˙ ?\u<CR>
  nnoremap ¬ /\u<CR>
  nnoremap ˙ ?\u<CR>
else " This is not a mac machine
  " move the line that you are at one line to the top or one line to the bottom using alt+j or alt+k
  nnoremap <A-j> :m .+1<CR>==
  nnoremap <A-k> :m .-2<CR>==
  inoremap <A-j> <Esc>:m .+1<CR>==gi
  inoremap <A-k> <Esc>:m .-2<CR>==gi
  vnoremap <A-j> :m '>+1<CR>gv=gv
  vnoremap <A-k> :m '<-2<CR>gv=gv
  " Alt+l and Alt+h willmove to the next capital letter on the same line or above
  map <A-l> /\u<CR>
  map <A-h> ?\u<CR>
endif

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if !empty(glob(data_dir . '/autoload/plug.vim'))
  " vim-plug plugin manage
  " Check this on how to isntall https://github.com/junegunn/vim-plug
  " (need to download the file plug.vim and place it under ~/.vim/autoload)
  call plug#begin('~/vim-plugins/plugged')
  Plug 'tpope/vim-surround'
  Plug 'leafgarland/typescript-vim'
  "Plug 'posva/vim-vue'
  "Plug 'tomtom/tcomment_vim'
  "Plug 'tmhedberg/matchit'
  "Plug 'freeo/vim-kalisi'
  Plug 'scrooloose/nerdtree'
  ""plugin on GitHub repo
  "Plug 'tpope/vim-fugitive'
  "Plug 'christoomey/vim-tmux-navigator'
  "Plug 'SirVer/ultisnips'
  "Plug 'honza/vim-snippets'
  "Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'}
  "Plug 'junegunn/fzf.vim'
  ""youcompleteme
  "Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  ""pair completion
  "Plug 'raimondi/delimitmate'
  "let delimitMate_expand_cr = 1
  ""tab completion
  "Plug 'ervandew/supertab'
  "colorscheme
  "Plug 'dracula/vim'
  "Plug 'crusoexia/vim-monokai'
  "Plug 'dracula/vim'
  "Plug 'mhartington/oceanic-next'
  " Plug 'kadekillary/subtle_dark'
  call plug#end()
endif

" NERDTree specific settings
" show also all the hidden files in NERDTree
let NERDTreeShowHidden=1

" Open NERDTree in the directory of the current file (or /home if no file is open) this is a better alternative to :NERDTreeToggle
nmap <C-n> :call NERDTreeToggleInCurDir()<cr>
function! NERDTreeToggleInCurDir()
  " If NERDTree is open in the current buffer
  if (exists("t:NERDTreeBufName") && bufwinnr(t:NERDTreeBufName) != -1)
    exe ":NERDTreeClose"
  else
      if bufname('%') == ""
        exe ":NERDTreeToggle"
    else
        exe ":NERDTreeFind"
    endif
  endif
endfunction

" map alt+1 to jump to the nerd tree tab
" nnoremap <A-1> :NERDTreeFocus<CR>
nnoremap <A-1> :ehco %:p<CR>

" CtrlP specific settings START
" Use this function to prevent CtrlP opening files inside non-writeable buffers, e.g. NERDTree
function! SwitchToWriteableBufferAndExec(command)
    let c = 0
    let wincount = winnr('$')
    " Don't open it here if current buffer is not writable (e.g. NERDTree)
    while !empty(getbufvar(+expand("<abuf>"), "&buftype")) && c < wincount
        exec 'wincmd w'
        let c = c + 1
    endwhile
    exec a:command
endfunction

let g:ctrlp_map = '' " Disable default mapping since we are overriding it with our command
"nnoremap <C-p> :call SwitchToWriteableBufferAndExec('CtrlP')<CR>
"nnoremap <C-l> :call SwitchToWriteableBufferAndExec('CtrlPMRUFiles')<CR>
"nnoremap <C-e> :call SwitchToWriteableBufferAndExec('CtrlPBuffer')<CR>
let g:ctrlp_show_hidden = 1
" CtrlP specific settings END

" my selected color scheme in vim from flazz/vim-colorschemes
"colorscheme Benokai
"colorscheme jellybeans
"colorscheme jelleybeans

" hightlight the current line where the cursor is the position of this is critical it has to be after the setting of the genral theme
" set cursorline
" changes the hightlight of the corsor line ctermbg is what actually did it
" hi CursorLine ctermfg=NONE ctermbg=235 cterm=NONE guifg=NONE guibg=#282828 gui=NONE

" makes indentation work depanding on plugins and the type of the file
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=2
" On pressing tab, insert 4 spaces
set expandtab

" returns true iff is NERDTree open/active
function! IsNTOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! IsNTIsTheCurrentBuffer()
    return bufwinnr(@%) == bufwinnr(t:NERDTreeBufName)
endfunction

" calls NERDTreeFind iff NERDTree is active, current window contains a modifiable file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNTOpen() && !IsNTIsTheCurrentBuffer()  && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

augroup myvimrc
    autocmd!
    " open the quickfix buffer right after a vimgrep command
    autocmd QuickFixCmdPost [^l]* cwindow
    autocmd QuickFixCmdPost l*    lwindow

    " and keybinding for auto indentation pressting Ctrl+f on normal mode on top
    autocmd FileType javascript vnoremap <buffer>  <c-f> :call RangeJsBeautify()<cr>
    autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
    autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
    autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
    autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

    " maps .ts and tsx fils to have the typescript syntax highlighting
    autocmd BufNewFile,BufRead *.ts,*.tsx set filetype=typescript

    " make NERDTree sync it line to show the file we currently entering
    " utocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
    autocmd BufEnter * call SyncTree()
    " close vim if NERDTree is the only buffer left
    " autocmd bufenter * if (winnr("$") == 1 && exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)) | q | endif
augroup END

" map the a" so it will not select any preceeding white spaces
vnoremap a" 2i"
onoremap a" 2i"
vnoremap a' 2i'
onoremap a' 2i'

" Lowercase letter mappings
nnoremap ma mA
nnoremap 'a `Azz
vnoremap 'a `Azz

nnoremap mb mB
nnoremap 'b `Bzz
vnoremap 'b `Bzz

nnoremap mc mC
nnoremap 'c `Czz
vnoremap 'c `Czz

nnoremap md mD
nnoremap 'd `Dzz
vnoremap 'd `Dzz

nnoremap me mE
nnoremap 'e `Ezz
vnoremap 'e `Ezz

nnoremap mf mF
nnoremap 'f `Fzz
vnoremap 'f `Fzz

nnoremap mg mG
nnoremap 'g `Gzz
vnoremap 'g `Gzz

nnoremap mh mH
nnoremap 'h `Hzz
vnoremap 'h `Hzz

nnoremap mi mI
nnoremap 'i `Izz
vnoremap 'i `Izz

nnoremap mj mJ
nnoremap 'j `Jzz
vnoremap 'j `Jzz

nnoremap mk mK
nnoremap 'k `Kzz
vnoremap 'k `Kzz

nnoremap ml mL
nnoremap 'l `Lzz
vnoremap 'l `Lzz

nnoremap mm mM
nnoremap 'm `Mzz
vnoremap 'm `Mzz

nnoremap mn mN
nnoremap 'n `Nzz
vnoremap 'n `Nzz

nnoremap mo mO
nnoremap 'o `Ozz
vnoremap 'o `Ozz

nnoremap mp mP
nnoremap 'p `Pzz
vnoremap 'p `Pzz

nnoremap mq mQ
nnoremap 'q `Qzz
vnoremap 'q `Qzz

nnoremap mr mR
nnoremap 'r `Rzz
vnoremap 'r `Rzz

nnoremap ms mS
nnoremap 's `Szz
vnoremap 's `Szz

nnoremap mt mT
nnoremap 't `Tzz
vnoremap 't `Tzz

nnoremap mu mU
nnoremap 'u `Uzz
vnoremap 'u `Uzz

nnoremap mv mV
nnoremap 'v `Vzz
vnoremap 'v `Vzz

nnoremap mw mW
nnoremap 'w `Wzz
vnoremap 'w `Wzz

nnoremap mx mX
nnoremap 'x `Xzz
vnoremap 'x `Xzz

nnoremap my mY
nnoremap 'y `Yzz
vnoremap 'y `Yzz

nnoremap mz mZ
nnoremap 'z `Zzz
vnoremap 'z `Zzz
