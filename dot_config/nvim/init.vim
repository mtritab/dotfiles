call plug#begin('~/.vim/plugged')

" Plug 'morhetz/gruvbox'
" Plug 'tpope/vim-surround'
" Plug 'tpope/vim-fugitive'
Plug 'AndrewRadev/andrews_nerdtree.vim'
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'itchyny/lightline.vim'
Plug 'fatih/vim-go'
Plug 'sheerun/vim-polyglot'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chrisbra/vim-autosave'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/indentLine'
Plug 'dhruvasagar/vim-zoom'
Plug 'preservim/tagbar'


call plug#end()

" -------------------------------------------------------------------------------------------------
" coc.nvim default settings
" -------------------------------------------------------------------------------------------------

" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=no

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" status line support, for integration with other plugin, checkout `:h coc-status`
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}%F
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}%F
" set statusline+=%{zoom#statusline()}


" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

 inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() 
 \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

set termguicolors

set expandtab "insert space when tab key is pressed
set tabstop=2 "number of spaces inserted when tab is pressed
set softtabstop=2 
set shiftwidth=2 "number of spaces to use for each auto indent

set number

let NVIM_TUI_ENABLE_TRUE_COLOR=1
"
" colorscheme gruvbox
"

hi Pmenu guifg=#c0c0c0 guibg=#404080
hi PmenuSel guifg=#c0c0c0 guibg=#2050d0
hi PmenuSbar guifg=blue guibg=darkgray
hi PmenuThumb guifg=#c0c0c0

map <leader>n :NERDTreeToggle<CR>

" inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
" inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"

 set autowrite
 autocmd FileType go nmap <leader>b  <Plug>(go-build)
 autocmd FileType go nmap <leader>r  <Plug>(go-run)
 autocmd FileType go nmap <leader>q  <Plug>(go-test)

" edit init file
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" source init file
nnoremap <leader>sv :source $MYVIMRC<cr>

inoremap jk <esc>


 " open new split panes to right and below
set splitright
set splitbelow

" turn terminal to normal mode with KEY
tnoremap <leader>t <C-\><C-n>

" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif

" open terminal on leader t
function! OpenTerminal()
  split term://zsh
  set nonumber
  resize 10
endfunction
nnoremap <silent> <leader>t :call OpenTerminal()<CR>

:tnoremap <A-h> <C-\><C-N><C-w>h
:tnoremap <A-j> <C-\><C-N><C-w>j
:tnoremap <A-k> <C-\><C-N><C-w>k
:tnoremap <A-l> <C-\><C-N><C-w>l
:inoremap <A-h> <C-\><C-N><C-w>h
:inoremap <A-j> <C-\><C-N><C-w>j
:inoremap <A-k> <C-\><C-N><C-w>k
:inoremap <A-l> <C-\><C-N><C-w>l
:nnoremap <A-h> <C-w>h
:nnoremap <A-j> <C-w>j
:nnoremap <A-k> <C-w>k
:nnoremap <A-l> <C-w>l

augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver20
augroup end
"
let g:autosave_backup     = '~/.vim/backup' " directory where to save backup files
let g:autosave_timer      = 60*1*1000  " number of milliseconds to trigger (by default every 5 minutes)
let g:autosave_extensions = '.backup'  " extension used for saving modified files



map <leader>2 :set nonumber<CR>
map <leader>3 :set nu<CR>
map <leader>4 :IndentLinesToggle<CR>
map <leader>5 :TagbarToggle<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"set mouse=nv
"
"
function NERDTreeMouse()
    if (&ft ==? "nerdtree")
        set mouse=a
    else
        set mouse=n
    endif
endfunction

au FileType * :call NERDTreeMouse()
au WinEnter * :call NERDTreeMouse()
au WinLeave * :call NERDTreeMouse()

let g:NERDTreeMouseMode=2

let NERDTreeMapActivateNode='go'
let NERDTreeMapPreview='o'

autocmd BufWinEnter * NERDTreeMirror

"----------------------------- INDENT ----------------------------------------
let g:indentLine_enabled = 1
let g:indentLine_setColors = 1
" let g:indentLine_char = '┊'
let g:indentLine_char = '│'
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_leadingSpaceChar = '·'
" disable for JSON so it doesnt eat ""
let g:vim_json_syntax_conceal = 0
" dont display in the file explorer window
let g:indentLine_fileTypeExclude = ['coc-explorer', 'startify', 'help', 'man']



""""" AndrewRadev nerdtree plugin
let g:andrews_nerdtree_buffer_fs_menu     = 1
let g:andrews_nerdtree_diff               = 1
let g:andrews_nerdtree_external_open      = 1
let g:andrews_nerdtree_interactive_edit   = 1
let g:andrews_nerdtree_startshell_mapping = 1
let g:andrews_nerdtree_git_filter         = 1



set mmp=5000

let g:tagbar_type_yaml = {
    \ 'ctagstype' : 'yaml',
    \ 'kinds' : [
        \ 'a:anchors',
        \ 's:section',
        \ 'e:entry'
    \ ],
  \ 'sro' : '.',
    \ 'scope2kind': {
      \ 'section': 's',
      \ 'entry': 'e'
    \ },
    \ 'kind2scope': {
      \ 's': 'section',
      \ 'e': 'entry'
    \ },
    \ 'sort' : 0
    \ }
