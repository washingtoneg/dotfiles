" This is Elena Washington's .vimrc file

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
nmap <C-x> :!pbcopy<CR>
nmap <C-c> :w !pbcopy<CR><CR>
nmap <C-v> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>

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
  if exists("g:mytablabels")
    if exists("g:mytablabels[a:n]") && g:mytablabels[a:n] !=? ''
      let string .= ' (' . g:mytablabels[a:n] . ')'
    endif
  endif

  return empty(string) ? '[unnamed]' : string
endfu

fu! MyTabLine()
  let s = ''
  for i in range(tabpagenr('$'))
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

" Add the ability to rename tabs
fu! AddTabNameToList(name)
  if !exists("g:mytablabels")
    let g:mytablabels = { tabpagenr(): a:name }
  else
    let g:mytablabels[tabpagenr()] = a:name
  endif
endfu

command! -nargs=* Renametab call AddTabNameToList('<args>')

" Make netrw work for me
let g:netrw_banner = 0
let g:netrw_browse_split = 3
let g:netrw_cursorline = 0
let g:netrw_liststyle = 3
let g:netrw_winsize = 20


" open file vertically to the right
augroup netrw_mappings
    autocmd!
    autocmd filetype netrw call Netrw_mappings()
augroup END
function! OpenToRight()
  :rightbelow vnew
  :wincmd p
  :normal P
endfunction
function! Netrw_mappings()
    noremap V :call OpenToRight()<cr>
endfunction

" Command mode helpers
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <S-Left>
cnoremap <M-f> <S-Right>
