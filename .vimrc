"add the numbers gutter
set number
set ruler

"disable word wrapping
set nowrap
" makes the yank also be taken to the OS lipboard
" set clipboard=unnamed
set clipboard=unnamedplus

let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" this defines the leader key of vim to be the comma key
"let mapleader=","
let mapleader="\<space>"

"adds the syntax hightlighteing show
syntax on

" Just to beginning and end of lines easier. From http://vimbits.com/bits/16
nnoremap <leader>H H
nnoremap <leader>L L
vnoremap <leader>H H
vnoremap <leader>L L
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" paste from the last yanked thing avoiding the last deleted thing for example
:map <leader><leader> "0p
:map <leader>' viwdi"<esc>pa"
 

nnoremap Y y$
" These are the lines that are needed for Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'scrooloose/nerdtree'
Plugin 'Townk/vim-autoclose'
Plugin 'vim-syntastic/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'jakedouglas/exuberant-ctags'
Plugin 'majutsushi/tagbar'
Plugin 'vim-airline/vim-airline'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'marcelbeumer/javascript-syntax.vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'leafgarland/typescript-vim'
call vundle#end()

" sets the default directories where ctags will look for it's database
set tags=./tags;~/Projects
nmap <F8> :TagbarToggle<CR>
let g:tagbar_type_typescript = {                                                  
  \ 'ctagsbin' : 'tstags',                                                        
  \ 'ctagsargs' : '-f-',                                                           
  \ 'kinds': [                                                                     
    \ 'e:enums:0:1',                                                               
    \ 'f:function:0:1',                                                            
    \ 't:typealias:0:1',                                                           
    \ 'M:Module:0:1',                                                              
    \ 'I:import:0:1',                                                              
    \ 'i:interface:0:1',                                                           
    \ 'C:class:0:1',                                                               
    \ 'm:method:0:1',                                                              
    \ 'p:property:0:1',                                                            
    \ 'v:variable:0:1',                                                            
    \ 'c:const:0:1',                                                              
  \ ],                                                                            
  \ 'sort' : 0                                                                    
\ } 

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

"CtrlP specific settings
let g:ctrlp_map = '' " Disable default mapping since we are overriding it with our command
nnoremap <C-p> :call SwitchToWriteableBufferAndExec('CtrlP')<CR>
nnoremap <C-l> :call SwitchToWriteableBufferAndExec('CtrlPMRUFiles')<CR>
nnoremap <C-e> :call SwitchToWriteableBufferAndExec('CtrlPBuffer')<CR>
let g:ctrlp_show_hidden = 1

" my selected color scheme in vim from flazz/vim-colorschemes
"colorscheme Benokai
colorscheme jellybeans
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
    "autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
    autocmd BufEnter * call SyncTree() 
    " close vim if NERDTree is the only buffer left
    "autocmd bufenter * if (winnr("$") == 1 && exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)) | q | endif
augroup END

" ignore the caseing on searches
set ignorecase 
