" This is Elena Washington's .vimrc file
" Yes, it's skimp. I'm just now coming to the darkside. Thanks for the cookies ;)

" Always show current position
set ruler

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

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines

" Highlight search results
set hlsearch

" Makes search act like search in modern browsers
set incsearch

" Opens a new window below the current one for horizontal splits
set splitbelow

" Opens a new window to the right of the current one for vertical splits
set splitright

