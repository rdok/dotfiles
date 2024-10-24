" Common shortcuts for quitting and saving
nnoremap <Leader>q :q!<cr>
nnoremap <Leader>w :w<cr>
nnoremap <Leader>wq :wq<cr>

" Set temp directories for backups, swaps, and undos, handling Windows and Linux paths
if has('win32') || has('win64')
    let temp_dir = $HOME . '\\vimfiles\\temp'
else
    let temp_dir = $HOME . '/.vim/temp'
endif

" Check and create directories if they don't exist
if !isdirectory(temp_dir)
    try
        call mkdir(temp_dir, "p")  " Create directory, "p" ensures parents are created if needed
    catch
        echo "Unable to create temp directory: " . temp_dir
    endtry
endif

" Set backup, swap, and undo directories to the temp directory
set backupdir^=temp_dir
set directory^=temp_dir
set undodir^=temp_dir

" Basic settings for Vim
set hlsearch   
set is
filetype on                  

set nocompatible              
set undofile
set noerrorbells visualbell t_vb=

" Set leader key
let mapleader = ' '

" AutoSave settings (core Vim settings only)
let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_in_insert_mode = 0  " do not save while in insert mode

" Syntax and UI settings
syntax on                       
set relativenumber
hi vertsplit guifg=bg guibg=bg
set showcmd 
set laststatus=2
set encoding=utf-8 
set colorcolumn=81

" Specific settings for file types
autocmd FileType html,markdown,json highlight OverLength ctermbg=NONE ctermfg=NONE
autocmd FileType html,markdown,json set colorcolumn=

" Clipboard handling for Linux and Windows
if has('clipboard') == 0
    echo '================================================================================'
    echo 'WARNING: Vim is not compiled with the `+clipboard` feature.'
    echo '================================================================================'
    echo "You won't be able to copy/paste to system clipboard."
    if has('unix')
        echo 'Install vim-gtk or vim-gtk3'
    else
        echo 'Make sure Vim is compiled with clipboard support on Windows.'
    endif
endif
