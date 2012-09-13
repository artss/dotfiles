"filetype off
"call pathogen#runtime_append_all_bundles()
filetype plugin on
filetype indent on
syntax on

"set nocompatible

set modelines=0

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest

set noerrorbells
set novisualbell
autocmd GUIEnter * set novisualbell t_vb=

set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number

set ignorecase
set smartcase
set gdefault
set incsearch
"set noshowmatch
"set nohlsearch

set nowrap

set scrolljump=5
set scrolloff=5
set sidescroll=5
set sidescrolloff=5
set sidescroll=4
set sidescrolloff=10

set guioptions-=T
set guioptions-=m

set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

set guioptions+=c

set list
set listchars=tab:▸\ ",eol:¬

nnoremap ; :

if has('gui')
    "winsize 212 84
    colorscheme molokai
    if has('win32')
        "set guifont=Lucida_Console:h10:cRUSSIAN::
        set guifont=terminus-cp1251
    else
        set guifont=Terminus\ 9
    endif
endif

set nobackup
set noswapfile

""" autosave on focuslost
au FocusLost * :wa

""" highlight trailing spaces
highlight Trailing ctermbg=darkgray guibg=gray8
au BufNewFile,BufRead,WinEnter * let b:mtrailingws=matchadd('Trailing', '\s\+$', -1)

""" hightlight long lines
"highlight LongLine ctermbg=darkred guibg=darkred
"au BufNewFile,BufRead,WinEnter * let b:mlonglines=matchadd('LongLine', '\%>79v.\+', -1)
hi ColorColumn guibg=#181a1b
au BufNewFile,BufRead,WinEnter * set colorcolumn=80

""" autocomplete
function! InsertTabWrapper()
let col = col('.') - 1
if !col || getline('.')[col - 1] !~ '\k'
return "\<tab>"
else
return "\<c-p>"
endif
endfunction
imap <tab> <c-r>=InsertTabWrapper()<cr>

set complete=""
set complete+=.
set complete+=b

set completeopt-=preview
set completeopt+=longest

""" selection
set clipboard+=unnamed
set virtualedit=all
set go+=a

""" folding
set foldcolumn=2
set foldmethod=indent

let NERDTreeIgnore=['.*\.pyc$', 'System Volume Information', '\$RECYCLE.BIN', 'desktop.ini']



""" keymaps

" More suitable mapping
function! SMap(key, action, ...)
    let modes = " vi"
    if (a:0 > 0)
        let modes = a:{1}
    endif
    if (match(modes, '\Ii') != -1)
        execute 'imap ' . a:key . ' <Esc>' . a:action
    endif
    if (match(modes, '\Nn') != -1)
        execute 'nmap ' . a:key . ' <Esc>' . a:action
    endif
    if (match(modes, ' ') != -1)
        execute 'map ' . a:key . ' <Esc>' . a:action
    endif
    if (match(modes, '\Vv') != -1)
        execute 'vmap ' . a:key . ' <Esc>' . a:action
    endif
endfunction


" disable F1
call SMap("<F1>", ":<ESC>")

" save on F2
call SMap("<F2>", ":w<cr>")

" toggle nerdtree
call SMap("<F4>", ":NERDTreeToggle<cr>")

" toggle bufexplorer
call SMap("<F5>", ":BufExplorerHorizontalSplit<cr>:resize 15<cr>")

" kill buffer
call SMap("<F10>", ":bd<cr>")
