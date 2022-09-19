call plug#begin()

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File explorer
Plug 'preservim/nerdtree'
"
" For text highlighting 
Plug 'joshdick/onedark.vim'
" Git 
Plug 'tpope/vim-fugitive'

" Python
Plug 'heavenshell/vim-pydocstring' 
" Markdown Preview
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
" Neovim
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'neovim/nvim-lspconfig'
call plug#end()

syntax on
set laststatus=2

" Set number and relative number
set number relativenumber
" Set highlightsearch auto
set hlsearch

lua << EOF
servers = {
    'pyright',
    'terraformls',
    'gopls'
    --'tsserver', -- uncomment for typescript. See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md for other language servers
}
require('treesitter-config')
require('lsp-config')
EOF

" To start nerd tree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Remap navigation for splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Remap NerdTree
nmap <C-n> :NERDTreeToggle<CR>

" lightline
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }
" theme
colorscheme onedark

"fzf 
set rtp+=/usr/local/opt/fzf
nnoremap <C-P> :GFiles<Cr>
nnoremap <C-m> :Files<Cr>
nnoremap <C-g> :Rg<Cr>
nnoremap <leader><tab> :Buffers<Cr>

" Markdown highlighting
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'javascript', 'sql', 'json', 'go']

" Pydocstring
let g:pydocstring_doq_path = '/Users/keat/.local/pipx/venvs/doq'
let g:pydocstring_formatter = 'numpy'
nmap <silent> <leader>o <Plug>(pydocstring)


