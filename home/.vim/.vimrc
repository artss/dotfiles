set nocompatible
filetype off

""" Vundle plugins

    " git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

    set rtp+=~/.vim/bundle/vundle/

    call vundle#rc()

    " github repos
    Bundle 'scrooloose/nerdtree'
    Bundle 'jlanzarotta/bufexplorer'
    Bundle 'bling/vim-airline'
    Bundle 'altercation/vim-colors-solarized'
    Bundle 'mattn/emmet-vim'
    Bundle 'scrooloose/syntastic'
    Bundle 'heavenshell/vim-jsdoc'
    Bundle 'maksimr/vim-jsbeautify'
    Bundle 'ervandew/supertab'
    Bundle 'SirVer/ultisnips'
    Bundle 'honza/vim-snippets'
    Bundle 'scrooloose/nerdcommenter'
    Bundle 'Raimondi/delimitMate'
    "Bundle 'wavded/vim-stylus'
    "Bundle 'evidens/vim-twig'
    Bundle 'krisajenkins/vim-pipe'
    Bundle 'vim-misc'
    Bundle 'xolox/vim-session'
    "Bundle 'pangloss/vim-javascript'
    "Bundle 'peitalin/vim-jsx-typescript'

    " vim/scripts repos
    "Bundle 'L9'
    "Bundle 'FuzzyFinder'
    "Bundle 'rails.vim'

    "git repos (not github)
    "Bundle 'git://git.wincent.com/command-t.git'

filetype plugin indent on
syntax enable

set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

set encoding=utf-8
set autoindent
set smartindent
set showmode
set showcmd
set hidden

set wildmenu
set wildmode=list:longest,full
set wildignore+=.hg,.git,.svn
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg

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

set nobackup
set noswapfile

""" autosave on focuslost
au FocusLost * :wa

nnoremap ; :

set history=64
set undolevels=128
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

set nowrap
set list
set listchars=tab:┊\ ,trail:·,extends:→,precedes:←

set t_Co=256
colorscheme solarized
set background=dark
let g:solarized_contrast = 1
let g:solarized_underline = 0

if has('gui')
    "winsize 212 84
    colorscheme solarized
    if has('win32')
        "set guifont=Lucida_Console:h10:cRUSSIAN::
        set guifont=terminus-cp1251
    elseif has('gui_macvim')
        set guifont=Terminus\ (TTF):h12
        set noantialias
    else
        set guifont=Terminus\ 9
    endif
endif

""" highlight trailing spaces
highlight Trailing ctermbg=darkgray guibg=#00242f
au BufNewFile,BufRead,WinEnter * let b:mtrailingws=matchadd('Trailing', '\s\+$', -1)

""" remove trailing spaces
au BufWritePre * %s/\s\+$//e

""" hightlight long lines
highlight ColorColumn guibg=#00242f
au BufNewFile,BufRead,WinEnter * set colorcolumn=100

""" selection
set clipboard+=unnamed
set virtualedit=all
set go+=a

""" folding
set foldcolumn=2
set foldmethod=indent

""" indentation
vnoremap < <gv

vnoremap > >gv

""" Keymaps
    " More suitable mapping
    function! SMap(key, action, ...)
        let modes = ' vi'
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
    call SMap('<F1>', ':<ESC>')

    " save on F2
    call SMap('<F2>', ':w<cr>')

    " toggle nerdtree
    call SMap('<F4>', ':NERDTreeToggle<cr>')

    " toggle bufexplorer
    call SMap('<F5>', ':BufExplorerHorizontalSplit<cr>:resize 15<cr>')

    " toggle tagbar
    "call SMap('<F7>', ':TagbarToggle<cr>')

    " kill buffer
    call SMap('<F10>', ':bd<cr>')

    " alt + number
    let i = 1
    while i <= 9
        call SMap('<a-' . i . '>', ':' . i . 'wincmd w<cr>')
        let i = i + 1
    endwhile

    " next buffer
    call SMap('<c-tab>', '<c-w>w')

    " resize current window
    call SMap('<a-down>', '<C-W>-')
    call SMap('<a-up>', '<C-W>+')
    call SMap('<a-left>', '<C-W><')
    call SMap('<a-right>', '<C-W>>')

""" Syntastic
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0

    let g:syntastic_python_python_exec = '/usr/bin/python'

    let g:syntastic_python_checkers = ['pyflakes']
    let g:syntastic_javascript_checkers = ['eslint']

    " next error
    call SMap('<a-n>', ':lnext<cr>')

    " previous error
    call SMap('<a-p>', ':lprevious<cr>')

""" NERDTree
    let g:NERDTreeWinSize=50
    let NERDTreeIgnore=['.*\.pyc$', 'System Volume Information', '\$RECYCLE.BIN', 'desktop.ini']

""" Emmet
    let g:user_emmet_install_global = 0
    autocmd FileType html,html.twig,css EmmetInstall
    let g:user_emmet_leader_key='<C-Z>'
    let g:user_emmet_settings = {
    \    'javascript' : {
    \        'extends' : 'jsx',
    \    }
    \}

" set filetypes as typescript.jsx
"autocmd BufNewFile,BufRead *.tsx set filetype=typescript.jsx

""" JsDoc
    let g:jsdoc_allow_input_prompt = 1
    let g:jsdoc_input_description = 1
    let g:jsdoc_additional_descriptions = 1
    let g:jsdoc_return = 1
    let g:jsdoc_return_type = 1
    let g:jsdoc_return_description = 1
    let g:jsdoc_access_descriptions = 1
    let g:jsdoc_underscore_private = 1

    call SMap('<c-j>', ':JsDoc<cr>')

""" JsBeautify
    autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
    autocmd FileType jsx noremap <buffer> <c-f> :call JsxBeautify()<cr>
    autocmd FileType json noremap <buffer> <c-f> :call JsonBeautify()<cr>
    autocmd FileType html noremap <buffer> <c-f> :call HtmlBeautify()<cr>
    autocmd FileType html.twig noremap <buffer> <c-f> :call HtmlBeautify()<cr>
    autocmd FileType css noremap <buffer> <c-f> :call CSSBeautify()<cr>

    autocmd FileType javascript vnoremap <buffer> <c-f> :call RangeJsBeautify()<cr>
    autocmd FileType jsx vnoremap <buffer> <c-f> :call RangeJsxBeautify()<cr>
    autocmd FileType json vnoremap <buffer> <c-f> :call RangeJsonBeautify()<cr>
    autocmd FileType html vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
    autocmd FileType html.twig vnoremap <buffer> <c-f> :call RangeHtmlBeautify()<cr>
    autocmd FileType css vnoremap <buffer> <c-f> :call RangeCSSBeautify()<cr>

""" Airline
    let g:airline_powerline_fonts = 1
    let g:airline_left_sep = ''
    let g:airline_right_sep = ''
    let g:airline_space = ' '
    let g:airline_linenr = '|'

""" UltiSnips
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
    let g:UltiSnipsListSnippets = '<c-l>'
    let g:UltiSnipsEditSplit = 'vertical'

""" nerdcommenter
    let g:NERDSpaceDelims = 1
    call SMap('<c-c>', '<leader>c<space>')

""" startify
    "let g:startify_files_number = 3

""" vim-session

let g:session_directory = '~/.vim/.sessions'
let g:session_autoload = 'no'
let g:session_autosave = 'yes'
let g:session_command_aliases = 1

nnoremap <leader>so :OpenSession
nnoremap <leader>ss :SaveSession
nnoremap <leader>sd :DeleteSession<cr>
nnoremap <leader>sc :CloseSession<cr>

""" Project specific settings
    if !exists('*ProjectEnv')
        function! ProjectEnv()
            if filereadable(glob('./.vimrc'))
                source ./.vimrc
            endif
        endfunction
        autocmd! BufReadPost,BufNewFile * call ProjectEnv()
    endif
    "set exrc

