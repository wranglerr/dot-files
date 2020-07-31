set nocompatible
filetype off

""""""""""""""""""""""""""""VUNDLE""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.local/share/nvim/plugged')

Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'lervag/vimtex'
Plug 'chriskempson/base16-vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'dense-analysis/ale'
Plug 'robertmeta/nofrils'
Plug 'janko/vim-test'
Plug 'benmills/vimux'
Plug 'owickstrom/vim-colors-paramount'
Plug 'ternjs/tern_for_vim', { 'do': 'npm install && npm install -g tern' }
Plug 'carlitux/deoplete-ternjs'
Plug 'pangloss/vim-javascript'
Plug 'MaxMEllon/vim-jsx-pretty'


call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

filetype plugin indent on

"" Custom Keybinds
"autocmd InsertEnter * :set number
"autocmd InsertLeave * :set relativenumber
"better leader than [
let mapleader=","
let g:mapleader=","

"opens a shell inside vim <C-d> while in that shell to exit back to vim
noremap <C-d> :sh<cr>

"fast exit from insert mode
imap jk <Esc>

"big ol' leader
map <Space> <leader>

"better long line moving
map j gj
map k gk

"save like Word
map <c-s> :w<CR>
imap <c-s> <Esc><c-s>
map <leader>w <c-s>

map <F4> :make all<CR>
map <F5> :make run<CR>

nnoremap ,case :-1read $HOME/.vim/.case.py<CR>3jwf>a

"always show status line
set laststatus=2

" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

"let loaded_matchparen = 1
set path+=**
set tags+=.git/tags,tags;/

set showmatch
set so=999                          "scrolloff (keeps cursor in middle of screen)
set nu                              "enable line numbers
set wildmenu
set wildignore=*.o,*~,*.pyc
set wildignore+=*.swp,*.zip,*.exe,*/tmp/*
set ruler
set cmdheight=2
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set clipboard=unnamedplus

""colors/fonts
syntax enable
let t_Co = 256
set encoding=utf8
set ffs=unix,dos,mac

""misc
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set lbr
set tw=500
set ai
set si
set wrap

"no highlight searching
nmap <silent> ,/ :nohlsearch@<CR>

" Copy to system clipboard
" (typically use  <leader>cc)
map <leader>cc :w !xsel -i -b<CR>
map <leader>cp :w !xsel -i -p<CR>
map <leader>cs :w !xsel -i -s<CR>
" Paste from system clipboard
" (typically use <leader>pp)
map <leader>pp :r!xsel -p<CR>
map <leader>ps :r!xsel -s<CR>
map <leader>pb :r!xsel -b<CR>

""NERDTree Config"
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\.vim$', '\~$', '\.pyc$', '\.swp$']
let NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$',  '\~$']
let g:NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1
map <leader>nn :NERDTreeToggle<CR>
"pydocstring maptting
nmap <silent> <F3> <Plug>(pydocstring)

"let g:airline_theme='dracula'
"Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

" Buffer management
"This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
" <space> is mapped to <leader> in this config
nmap <leader>T :enew<cr>

" Move to the next buffer
nmap <leader>l :bnext<CR>

" Move to the previous buffer
nmap <leader>h :bprevious<CR>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

let g:pymode_rope = 0
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 0
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 0

" Support virtualenv
let g:pymode_virtualenv = 0

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" Don't autofold code
let g:pymode_folding = 0

set foldlevel=1

" automatically remove trailing WS on save for python files
autocmd BufWritePre *.py :%s/\s\+$//e

" automatically wrap git commits to 72 charactrs
autocmd Filetype gitcommit setlocal spell textwidth=72

:set colorcolumn=80  " highlight three columns after 'textwidth'
:highlight ColorColumn ctermbg=16 guibg=#000000

let g:vimtex_latexmk_options='-pdf -pdflatex="xelatex -synctex=1 \%S \%O" -verbose -file-line-error -interaction=nonstopmode'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:vimtex_view_general_options_latexmk = '--unique'

let g:python3_host_prog=expand('~/venv/bin/python3')
let g:python_host_prog=expand('~/venv/bin/python3')
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#max_abbr_width = 0
let g:deoplete#max_menu_width = 0
let g:tern_request_timeout = 1
let g:tern_request_timeout = 6000
let g:tern#command = ["tern"]
let g:tern#arguments = [" — persistent"]
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:SuperTabDefaultCompletionType = "<c-n>"
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"<Paste>

" Automatically open quick fix window after running make
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

autocmd BufNewFile,BufRead *.post set syntax=yaml

"if filereadable(expand("~/.vimrc_background"))
"  let base16colorspace=256
"  source ~/.vimrc_background
"endif
colorscheme paramount

autocmd Filetype html setlocal ts=2 sw=2 expandtab
autocmd Filetype htmldango setlocal ts=2 sw=2 expandtab
autocmd Filetype yaml setlocal ts=2 sw=2 expandtab
autocmd Filetype markdown setlocal ts=2 sw=2 expandtab
autocmd Filetype ruby setlocal ts=2 sw=2 expandtab
autocmd Filetype dart setlocal ts=2 sw=2 expandtab
autocmd Filetype sql setlocal ts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=2 sw=2 expandtab

nnoremap <C-p> :Files<Cr>
nnoremap <C-g> :Rg<Cr>


let g:ale_python_flake8_executable = 'python'
let g:ale_linters = {'python': ['flake8']}
let g:ale_fixers = ['black', 'isort']
let g:ale_fix_on_save = 0
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'

let g:nofrils_heavycomments=1

set t_ZH=^[[3m
set t_ZR=^[[23m

autocmd BufWritePre *.py %s/\s\+$//e


function! s:goyo_enter()
  "if executable('tmux') && strlen($TMUX)
  "  silent !tmux set status off
  "  silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  "endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
  Limelight
  hi comment ctermfg=141
  " ...
endfunction

function! s:goyo_leave()
 " if executable('tmux') && strlen($TMUX)
  "  silent !tmux set status on
  "  silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  "endif
  set showmode
  set showcmd
  set scrolloff=5
  Limelight!
  hi comment ctermfg=141
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

nmap <Leader>g <Plug>(Goyo)
xmap <Leader>g <Plug>(Goyo)

" these "Ctrl mappings" work well when Caps Lock is mapped to Ctrl
nmap <silent> t<C-n> :TestNearest<CR>
nmap <silent> t<C-f> :TestFile<CR>
nmap <silent> t<C-s> :TestSuite<CR>
nmap <silent> t<C-l> :TestLast<CR>
nmap <silent> t<C-g> :TestVisit<CR>
let test#strategy = "vimux"
let test#python#runner = 'pytest'


command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview({'options': '--delimiter : --nth 4..'}, 'right:50%'), <bang>0)

let g:ackprg = 'rg --vimgrep --type-not sql --smart-case'

" Auto close the Quickfix list after pressing '<enter>' on a list item
let g:ack_autoclose = 1

" Any empty ack search will search for the work the cursor is on
let g:ack_use_cword_for_empty_search = 1

" Don't jump to first match
cnoreabbrev Ack Ack!

" Maps <leader>/ so we're ready to type the search keyword
nnoremap <Leader>/ :Ack!<Space>
