if empty(glob('~/.vim/autoload/plug.vim'))
	silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs 
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

"autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
"	\| PlugInstall --sync | source $MYVIMRC
"	\| endif
call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'
Plug 'liuchengxu/vim-better-default'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html'] }
Plug 'ternjs/tern_for_vim', { 'do' : 'npm install' }

call plug#end()

"space leader
nnoremap <SPACE> <Nop>
let mapleader=" "

"autocomplete
filetype plugin on
set omnifunc=syntaxcomplete#Complete
set completeopt=longest,menuone
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
  \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
  \ 'C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

"2 space tabs
filetype plugin indent on
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

"search command
command -nargs=1 Sch noautocmd vimgrep /<args>/gj `git ls-files` | cw

"prettier shortcut
nnoremap <leader>p :Prettier<CR>

"visual block ctrl-v workaround
command VisualBlock normal <C-v>
nnoremap <leader>v :VisualBlock<CR>

"kill netrw file explorer buffer
autocmd FileType netrw nmap <silent> <buffer> <Esc> :bd<cr>

"prettier and write shortcut
nnoremap <leader>w :Prettier<CR>:w<CR>
