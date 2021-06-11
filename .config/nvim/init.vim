" set runtimepath^=~/.vim runtimepath+=~/.vim/after
" let &packpath = &runtimepath
" source ~/.vim/vimrc

call plug#begin(stdpath('data') . '/plugged')
Plug 'axvr/org.vim'
Plug 'fatih/vim-go'
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'jrozner/vim-antlr'
Plug 'junegunn/goyo.vim'
Plug 'leafgarland/typescript-vim'
Plug 'lervag/vimtex'
Plug 'majutsushi/tagbar'
Plug 'mxw/vim-jsx'
Plug 'neovim/nvim-lspconfig'
Plug 'neovimhaskell/haskell-vim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'nvim-treesitter/playground'
Plug 'psf/black'
Plug 'rktjmp/lush.nvim' | Plug 'npxbr/gruvbox.nvim'
" Plug 'romgrk/nvim-treesitter-context'
Plug 'rust-lang/rust.vim'
Plug 'stsewd/isort.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
call plug#end()
let mapleader=" "
" Preliminaries
set nocompatible
syntax on
set encoding=utf-8
set number
set relativenumber
" set cursorline
set showmatch
set tildeop
set nohlsearch
filetype plugin indent on
" Default to all folds open
set foldlevel=20
set shada+=n$HOME/.cache/shada
" Colorscheme
let g:airline_theme='base16_gruvbox_dark_hard'
" let g:airline_base16_gruvbox_dark_hard_old = 1
set termguicolors
set background=dark
colorscheme gruvbox
" Give backspace default functionality
set backspace=
" Write errors in linenumber column
set signcolumn=number
" vim-go
let g:go_fmt_command = "goimports"
" Indents
set autoindent
set smartindent
" Command-mode autocompletion
set wildmode=longest,list,full
" Git commands
" nnoremap gb <cmd>Git blame<CR>
function ToggleGBlame()
  let gblame = matchstr(@%, '\/tmp\/.*fugitiveblame')
  if empty(gblame)
    execute 'Git blame'
  else
    execute 'q'
  endif
endfunction
nnoremap gb <cmd>call ToggleGBlame()<CR>
" Guideline
highlight ColorColumn ctermbg=16
nnoremap <leader>y :execute "set colorcolumn=" . (&colorcolumn == "" ? "80" : "")<CR>
" Goyo for prose
map <leader>f :Goyo \| set linebreak<CR>
" Spellcheck
map <leader>o :setlocal spell! spelllang=en_ca<CR>
" Tagbar
map <leader>t :Tagbar<CR>
" Replace all with S
nnoremap S :%s//g<Left><Left>
" Make Y behave like D
map Y y$
" Compile document
map <leader>c :w! \| !compiler <c-r>%<CR><CR>

" Clean tex build files
autocmd VimLeave *.tex !texclear %
" Apply Xresources changes
autocmd VimLeave ~/.Xresources !xrdb %
" Recursively look for tags file in `./[../]*.git/tags` or `./[../]*tags`.
" Generate tags files from in .git directory with `ctags -R ..` or from  in
" the base project directory with `ctags -R .`.
set tags=TAGS;/,.git/TAGS;/,tags;/,.git/tags;/
" Shorter movement commands
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
" Tab movement commands
map <C-n> :tabn<CR>
map <C-p> :tabp<CR>

" Language servers
lua << EOF
require'lspconfig'.pyright.setup{}
EOF

" LSP binds
nnoremap <silent> [g <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> ]g <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>

" Treesitter textobjects
lua <<EOF
require'nvim-treesitter.configs'.setup {
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",

        -- Or you can define your own textobjects like this
        ["iF"] = {
          python = "(function_definition) @function",
        },
      },
    },
    -- TODO: Really cool, but I can't find a good keybind for this!
    -- lsp_interop = {
    --   enable = true,
    --   peek_definition_code = {
    --     [--df--] = --@function.outer--,
    --     [--dF--] = --@class.outer--,
    --   },
    -- }
  },
  highlight = {
    enable = true,
  },
  indent = {
    enable = true,
  }
}
EOF

" Automatically set folds
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

" Telescope
nnoremap <C-\> <cmd>lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>\ <cmd>lua require('telescope.builtin').live_grep()<CR>
nnoremap z= <cmd>lua require('telescope.builtin').spell_suggest()<CR>

" Compe
set completeopt=menuone,noselect
lua << EOF
require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    vsnip = true;
    ultisnips = true;
  };
}
EOF
inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

" vimwiki config
let personal = {}
let personal.path = "~/notes/wikis/personal"
" I don't know if Go requires special set up or not, and haven't tested it
let personal.nested_syntaxes = {'go': 'go', 'python': 'python'}
let g:vimwiki_list = [personal]
" Thin cursor when in insert mode
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
" Fix vim cursor in tmux
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>[6 q\<Esc>\\"
  let &t_SR = "\<Esc>Ptmux;\<Esc>\<Esc>[4 q\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>[2 q\<Esc>\\"
endif
" Fix graphical lag when entering normal mode (note: does not work in tmux)
" (note note: I think it does now?)
set ttimeout
set ttimeoutlen=1
set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
set ttyfast
