call plug#begin('~/.local/share/nvim/plugged')
Plug 'NLKNguyen/papercolor-theme'
Plug 'airblade/vim-gitgutter'
Plug 'bronson/vim-trailing-whitespace'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'vim-scripts/vim-auto-save'
call plug#end()

set number
set noswapfile
set hidden
set confirm
set ignorecase
set smartcase   " ignorecaseと合わせることで、小文字で検索した場合はcase insensitive, 大文字で検索した場合はcase sensitiveになる
set scrolloff=5 " 指定行数分の余裕を持たせて上下にスクロールさせる
set expandtab
set cindent
set smartindent
set wildchar=<tab>
set wildmode=list:longest,full
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
set nostartofline
set laststatus=2

colorscheme PaperColor

" change Leader key to <Space> (default: '\')
let mapleader = "\<Space>"

" key mapping for INSERT mode
inoremap <C-n> <Down>
inoremap <C-p> <Up>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-h> <BS>

" pressing the esc key twice disables highlithing
nnoremap <Esc><Esc> :nohlsearch<CR><ESC>

" customize keymap for switching tabs
nnoremap <silent> <leader>n gt
nnoremap <silent> <leader>p gT

" vim-auto-save
let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
nnoremap <silent> <leader>fw :FixWhitespace<CR>

" NERD Commenter
let NERDSpaceDelims = 1
nmap ,, <Plug>NERDCommenterToggle
vmap ,, <Plug>NERDCommenterToggle

" fzf.vim
" - use Enter key for opening file as new tab
" - type `;f` to search files
" - type `;r` to search file contents
" - customize ripgrep and fzf options
let g:fzf_action = { 'enter': 'tab split' }
nnoremap <silent> ;f :Files<CR>
nnoremap <silent> ;r :Rg<CR>
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>),
  \   1,
  \   fzf#vim#with_preview({'options': '--exact --reverse --delimiter : --nth 3..'}, 'right:50%:wrap'),
  \   <bang>0,
  \ )

" lightline.vim
let g:lightline = {
      \ 'active': {
      \   'left': [
      \     [ 'mode', 'paste' ],
      \     [ 'relativepath', 'modified', 'readonly', 'gitbranch' ],
      \   ],
      \   'right': [
      \     [ 'column', 'line_info' ],
      \     [ 'fileformat', 'fileencoding', 'filetype' ],
      \   ],
      \ },
      \ 'component': {
      \   'line_info' : '%l/%L',
      \ },
      \ 'component_function': {
      \   'gitbranch': 'gitbranch#name',
      \ },
      \ }
