set nocompatible

let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif
set noshowmode
let g:lightline = {
      \  'colorscheme': 'dracula',
      \   'inactive': {
      \     'left': [['filename'], ['modified']],
      \     'right': [['lineinfo'], ['percent']]
      \   }
      \ }

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.es6 set filetype=javascript

  " Enable spellchecking for Markdown
  autocmd FileType markdown setlocal spell

  " Automatically wrap at 100 characters for Markdown
  autocmd BufRead,BufNewFile *.md setlocal textwidth=100

  " Allow stylesheets to autocomplete hyphenated words
  autocmd FileType css,scss,sass setlocal iskeyword+=-
augroup END

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set listchars=tab:»\ ,nbsp:·,trail:·

" FZF instead of ctrlp
map <C-p> :FZF<CR>

highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Make it obvious where 100 characters is
"
set textwidth=100
set colorcolumn=+1

autocmd BufRead,BufNewFile *.slim setlocal textwidth&

" Numbers
set number
set numberwidth=5

set wildmode=list:longest,list:full

" Exclude Javascript files in :Rtags via rails.vim due to warnings when parsing
let g:Tlist_Ctags_Cmd="ctags --exclude='*.js'"

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=1
let g:syntastic_html_tidy_ignore_errors=[" proprietary attribute \"ng-"]

source $HOME/.vim/shortcuts.vim

highlight NonText guibg=#060606
highlight Folded  guibg=#0A0A0A guifg=#9090D0

" Persisted undo
silent !mkdir ~/.vim/backups > /dev/null 2>&1
set undodir=~/.vim/backups
set undofile

if has('mac')
  set clipboard=unnamed
else
  set clipboard=unnamedplus
endif

set scrolloff=5

" Show the 100 char column
autocmd BufWinEnter,WinEnter * setlocal colorcolumn=100
autocmd BufWinLeave,WinLeave * setlocal colorcolumn=0

" Some large files won't handle syntax highlighting
" without a longer redraw time: https://github.com/vim/vim/issues/2790
set redrawtime=10000

"turbux
let g:no_turbux_mappings = 1
map <leader>a <Plug>SendTestToTmux
map <leader>l <Plug>SendFocusedTestToTmux

"SuperTab
let g:SuperTabNoCompleteAfter = ['^', ',', '\s']

let g:syntastic_filetype_map = { 'html.handlebars': 'handlebars' }
" let g:syntastic_handlebars_checkers=['']

au BufNewFile,BufRead *.slim set filetype=slim
au BufNewFile,BufRead *.ex* set filetype=elixir
au BufNewFile,BufRead *.eex* set filetype=elixir

" Format elixir files on save
let g:mix_format_on_save = 0

" Shorten the escaping
inoremap jj <Esc>

let g:ale_fixers = {
\   'javascript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'typescript': ['prettier'],
\   'css': ['prettier'],
\}
let g:ale_fix_on_save = 1

source ~/.vim/airline.vim
source ~/.vim/tests.vim
set showmatch
set nofoldenable

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

let g:dracula_italic = 0
colorscheme dracula
highlight Normal ctermbg=None

"Increment example
":let i = 1 | %s/value="\d"/\='value="'. Inc().'"'/g
function Inc(...)
  let result = g:i
  let g:i += a:0 > 0 ? a:1 : 1
  return result
endfunction

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.9 } }
