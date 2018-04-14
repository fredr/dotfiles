scriptencoding utf-8
set encoding=utf-8
filetype off
set rtp+=~/.config/nvim/bundle/Vundle.vim
call vundle#begin("~/.config/nvim/bundle")

Plugin 'tpope/vim-fireplace'
Plugin 'fatih/vim-go'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'pangloss/vim-javascript'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
Plugin 'elixir-lang/vim-elixir'
Plugin 'mileszs/ack.vim'
Plugin 'dylanaraps/crayon'
Plugin 'mxw/vim-jsx'

call vundle#end()
filetype plugin indent on

syntax enable
set termguicolors
set background=dark
colorscheme crayon

set noerrorbells                " No beeps
set number                      " Show line numbers
set backspace=indent,eol,start  " Makes backspace key more powerful.
set showcmd                     " Show me what I'm typing
set showmode                    " Show current mode.
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set backupdir=~/.config/nvim/backup
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set autowrite                   " Automatically save before :next, :make etc.
set autoread                    " Automatically reread changed files without asking me anything
set laststatus=2
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set hlsearch                    " Highlight found searches
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not when search pattern contains upper case characters
set autoindent                  " Indent code automatically
set smartindent
set smarttab                    " Tab according to sourrounding code
set tabstop=2
set shiftwidth=2
set expandtab


" Fix cursor settings, aka disable guicursor
set guicursor=

" Enable mouse
set mouse=a

" Highlight trailing white space
highlight ExtraWhitespace ctermbg=darkred guibg=darkred
" Highlight UTF-8 chars that are out of range
match Error /[\x7f-\xff]/
set listchars=tab:»·,trail:·
set list

" highlight current line number
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
set cursorline
syntax sync minlines=256
set re=1

" highlight matching parent with color
highlight MatchParen cterm=bold ctermbg=none ctermfg=gray

let mapleader = ","
let g:mapleader = ","

" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

map <F1> :tabp<CR>
map <F2> :w<CR>
map <F3> :tabn<CR>
map <F4> :%s/\s\+$//<CR>
map <F10> :q<CR>

" Make ending space on files glow red
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$\| \+\ze\t/

" Center the screen
nnoremap <space> zz

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't move on *
nnoremap <silent> * :let stay_star_view = winsaveview()<cr>*:call winrestview(stay_star_view)<cr>

" Resize splits when the window is resized
au VimResized * :wincmd =

"visual search mappings
function! s:VSetSearch()
    let temp = @@
    norm! gvy
    let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
    let @@ = temp
endfunction
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" File type settings
au BufNewFile,BufRead *.go setlocal noet ts=4 sw=4 sts=4
au BufNewFile,BufRead *.vim setlocal noet ts=2 sw=2 sts=2
au BufNewFile,BufRead *.txt setlocal noet ts=4 sw=4 
au BufNewFile,BufRead *.md setlocal noet ts=4 sw=4 

" =================== Vim-jsx ===================
let g:jsx_ext_required = 0

" ==================== Vim-go ====================
let g:go_fmt_command = "goimports"
let g:go_fmt_autosave = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1

let g:syntastic_auto_loc_list = 1
let g:syntastic_go_checkers = ['go', 'govet', 'errcheck']

au FileType go nmap gd <Plug>(go-def)
au FileType go nmap <Leader>s <Plug>(go-def-split)
au FileType go nmap <Leader>v <Plug>(go-def-vertical)
au FileType go nmap <Leader>t <Plug>(go-def-tab)

au FileType go nmap <Leader>i <Plug>(go-info)

au FileType go nmap  <leader>r  <Plug>(go-run)
au FileType go nmap  <leader>b  <Plug>(go-build)

au FileType go nmap <Leader>d <Plug>(go-doc)

" ==================== NerdTree ====================
" Open nerdtree in current dir, write our own custom function because
" NerdTreeToggle just sucks and doesn't work for buffers
function! g:NerdTreeFindToggle()
    if nerdtree#isTreeOpen()
        exec 'NERDTreeClose'
    else
        exec 'NERDTreeFind'
    endif
endfunction

" For toggling
noremap <Leader>n :<C-u>call g:NerdTreeFindToggle()<cr> 

" For refreshing current file and showing current dir
noremap <Leader>j :NERDTreeFind<cr>

" Remap :W to :w
command WQ wq
command Wq wq
command W w
command Q q
command Qall qall

" Remap :E to :e
command E e

"Ctrl - k, jump to tag in new tab
"nmap <C-k> <C-w><C-]><C-w>T
