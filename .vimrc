" This is Elena Washington's .vimrc file
" Yes, it's skimp. I'm just now coming to the darkside. Thanks for the cookies ;)

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'christianrondeau/vim-base64'

call vundle#end()            " required
filetype plugin indent on    " required

" Autoreload ~/.vimrc
augroup reload_vimrc " {
autocmd!
	autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Automatically refresh any unchanged files
:set autoread

set ai " Auto indent
set si " Smart indent
set nu " Show line numbers
set wrap " Wrap lines
set ruler " Show current position

" Syntax on
syntax on

" Don't use a cursorline in the Explorer
set nocursorline

" Map arrow keys to do nothing
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Set swap file directories with alternatives
set directory=~/.tmp,/var/tmp,/tmp

" Don't record
map q <Nop>

" End of line alias
map ' $<esc>

" Remap semicolon to colon
nnoremap ; :

" Quickly leave edit mode and back to visual mode
imap jj <Esc>

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

" Use space bar to insert a space at the cursor
map <space> i<space><esc>

" Press Enter to insert a blank line below current
map <Enter> o<ESC>

" Press Shift + Enter to insert a blank line below current
map <S-Enter> O<ESC>

" Highlight search results
" set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Opens a new window below the current one for horizontal splits
set splitbelow

" Opens a new window to the right of the current one for vertical splits
set splitright

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Enable syntax highlighting and the desert theme
syntax enable

try
   colorscheme desert
catch
endtry

" Start NERDtree automatically when vim starts up
" autocmd vimenter * NERDTree
set nocp
execute pathogen#infect()
if exists("loaded_nerd_tree")
    autocmd VimEnter * NERDTree
endif
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" RSpec.vim mappings
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" Expand tab
set et

" No cursorline
set nocursorline

""""""""""""""
" copy/pasta "
""""""""""""""

set clipboard=unnamed

""""""""""""""
" whitespace "
""""""""""""""

" Highlight extra whitespace
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen

" Show trailing whitespace spaces before a tab, and tabs that are not at the start of a line:
match ExtraWhitespace /\s\+$\| \+\ze\t\|[^\t]\zs\t\+/
set list listchars=tab:»·,trail:·,nbsp:·

""""""""""""""
"    tabs    "
""""""""""""""

fu! MyTabLabel(n)
let buflist = tabpagebuflist(a:n)
let winnr = tabpagewinnr(a:n)
let string = fnamemodify(bufname(buflist[winnr - 1]), ':t')
return empty(string) ? '[unnamed]' : string
endfu

fu! MyTabLine()
let s = ''
for i in range(tabpagenr('$'))
" select the highlighting
    if i + 1 == tabpagenr()
    let s .= '%#TabLineSel#%m'
    else
    let s .= '%#TabLine#'
    endif

    " set the tab page number (for mouse clicks)
    "let s .= '%' . (i + 1) . 'T'
    " display tabnumber (for use with <count>gt, etc)
    let s .= ' '. (i+1) . ' '

    " the label is made by MyTabLabel()
    let s .= ' %{MyTabLabel(' . (i + 1) . ')} '

    if i+1 < tabpagenr('$')
        let s .= ' |'
    endif
endfor
return s
endfu
set tabline=%!MyTabLine()

"""""""""""""""""
" CtrlP support "
"""""""""""""""""
set runtimepath^=~/.vim/bundle/ctrlp.vim

" Use this option to change the mapping to invoke CtrlP in |Normal| mode: >
let g:ctrlp_map = '<c-p>'


" Set the default opening command to use when pressing the above mapping: >
 let g:ctrlp_cmd = 'CtrlP'


" Set this to 1 to set searching by filename (as opposed to full path) as the
" default: >
  let g:ctrlp_by_filename = 0


" Set this to 1 to set regexp search as the default: >
  let g:ctrlp_regexp = 0
" Can be toggled on/off by pressing <c-r> inside the prompt.


" Where to put the new tab page when opening one: >
  let g:ctrlp_tabpage_position = 'ac'
"<
"  a - after.
"  b - before.
"  c - the current tab page.
"  l - the last tab page.
"  f - the first tab page.


" When starting up, CtrlP sets its local working directory according to this
"variable: >
  let g:ctrlp_working_path_mode = 'ra'
"<
"  c - the directory of the current file.
"  a - the directory of the current file, unless it is a subdirectory of the cwd
"  r - the nearest ancestor of the current file that contains one of these
"      directories or files:
"      .git .hg .svn .bzr _darcs
"  w - modifier to "r": start search from the cwd instead of the current file's
"      directory
