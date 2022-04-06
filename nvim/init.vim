"--- Set the nvim configuration file as the vim ---
"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc
let mapleader = "\<Space>"
set nocompatible
set nocscopeverbose
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab
set ignorecase
filetype off
" =============================================================================
" # PLUGINS
" =============================================================================
call plug#begin()

"Plug 'file:///home/inaki/dev/myvimplugin'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'andymass/vim-matchup'

" Fuzzy finder
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Tmux navigation
Plug 'christoomey/vim-tmux-navigator'

" Code alignement
Plug 'godlygeek/tabular'
Plug 'tpope/vim-surround'

" Clipboard
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'roxma/vim-tmux-clipboard'

" Git
Plug 'tpope/vim-fugitive'
" See modified lines"
Plug 'airblade/vim-gitgutter'

" Easymotion
Plug 'easymotion/vim-easymotion'
""Plug 'vim-scripts/vim-svngutter'

" Split resize plugin
Plug 'talek/obvious-resize'

"Sudowrite
"Plug 'tpope/vim-eunuch'
Plug 'lambdalisue/suda.vim'

"Comments in C/C++
"Plug 'preservim/nerdcommenter'

call plug#end()

if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
    noremap <C-q> :confirm qall<CR>
end

" =============================================================================
" # GUI settings
" =============================================================================
" Colors
colorscheme monokai
" Italic commnets https://rsapkf.xyz/blog/enabling-italics-vim-tmux
highlight Comment cterm=italic
" TAB Hightlight "
"highlight ExtraWhitespace ctermfg=7 ctermbg=8 cterm=none guifg=#c0c0c0 guibg=#808080 gui=none
"":au BufEnter * match ExtraWhitespace /\t/
" Show trailing whitespace:
:au BufEnter * match ColorColumn /\t/
" END of Highlight"
:au BufEnter * set colorcolumn=80

:au BufEnter * set cursorline
:au WinEnter * set cursorline
:au WinLeave * set nocursorline

set number
set relativenumber
function! NumberToggle()
	if(&relativenumber == 1)
		set norelativenumber
	else
		set relativenumber
	endif
endfunc
nnoremap <silent> <leader>n :call NumberToggle()<CR>
set mouse=a " Enable mouse usage (all modes) in terminals
set showcmd " Show (partial) command in status line.

" Timeout 
set timeout
set timeoutlen=1000
"
" Split resize
nnoremap <silent> <C-right> :<C-U>ObviousResizeRight<CR>
nnoremap <silent> <C-left> :<C-U>ObviousResizeLeft<CR>
nnoremap <silent> <C-up> :<C-U>ObviousResizeUp<CR>
nnoremap <silent> <C-down> :<C-U>ObviousResizeDown<CR>
" =============================================================================
" # Navigation
" =============================================================================
"
"tmux navigation
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>
" ---- move tabs ---- "
nnoremap H gT
nnoremap L gt

"  y d p P   --  Quick copy paste into system clipboard
nmap <Leader>y "+y
nmap <Leader>d "+d
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P


" =============================================================================
" # Mappings
" =============================================================================
function! TurnOffCapsLock()
	let cmd = "turn_off_capslock"
	let result = system(cmd)
"endfun
"function! KillRg()
  "Kill the processes that :Rg leves opened"
	let cmd = "kill_rg"
	let reuslt = system(cmd)
endfun

nnoremap <silent><esc> <esc>:call TurnOffCapsLock()<cr>
inoremap <silent><esc> <esc>:call TurnOffCapsLock()<cr>
nnoremap ; :
nnoremap ff :w<CR>
inoremap jj <ESC>
inoremap <silent>JJ <ESC>:call TurnOffCapsLock()<CR>
inoremap kk ->
"inoremap ' ''<left>
inoremap ( ()<left>
inoremap [ []<left>
inoremap { {}<left>
inoremap {<CR> {<CR>}<ESC>O
inoremap {;<CR> {<CR>};<ESC>O
" Quick-save
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>
nmap <leader>wq :wq<CR>
nmap <leader>qw :wq<CR>

" CScope
nmap <F12> <Plug>CscopeDBInit

"GitGutter
let g:gitgutter_map_keys = 0
nmap <leader>gv <Plug>(GitGutterPreviewHunk)
nmap <leader>gu <Plug>(GitGutterUndoHunk)
nmap <leader>gp <Plug>(GitGutterPrevHunk)
nmap <leader>gn <Plug>(GitGutterNextHunk)

" =============================================================================

nnoremap <silent> <leader>o :FZF<CR>
nnoremap <silent> <leader>O :Buffers<CR>


" <leader>s for Rg search
noremap <leader>s :Rg
let g:fzf_layout = { 'down': '~20%' }
command! -bang -nargs=* Rg
\ call fzf#vim#grep(
\   'rg --column --line-number --no-heading --color=always -L --no-ignore-vcs --ignore-file /home/inaki/.fdignore '.shellescape(<q-args>), 1,
\   <bang>0 ? fzf#vim#with_preview('up:60%')
\           : fzf#vim#with_preview('right:50%:hidden', '?'),
\   <bang>0)

function! s:list_cmd()
let base = fnamemodify(expand('%'), ':h:.:S')
  return base == '.' ? 'fd --type file --follow' : printf('fd --type file --follow | proximity-sort %s', shellescape(expand('%')))
endfunction

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, {'source': s:list_cmd(),
  \                               'options': '--tiebreak=index'}, <bang>0)


" Lightline
set noshowmode
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'gitbranch' ,'modified' ] ],
      \   'right': [ ['lineinfo'], ['percent']]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'gitbranch': 'FugitiveHead',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction

" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

"=============================================================================
" Switch between header and source file
"=============================================================================
function! OpenFile(fname)
    let pname = expand("%:p:h")
    let cmd = "get_header_source_file " . pname . " " . a:fname
	let file = system(cmd)
    exe ":e" file
endfun

function! Mosh_Flip_Ext()
  " Switch editing between .c* and .h* files (and more).
  " Since .h file can be in a different dir, call find.
  if match(expand("%"),'\.c') > 0
    let fname = substitute(expand("%:t"),'\.c\(.*\)','.h',"")
    let s:bufname = bufname(fname)	
	if (strlen(s:bufname)) > 0
		try
			exe ":b" fname
		catch
			call OpenFile(fname)
		endtry
	else
		call OpenFile(fname)
	endif
  elseif match(expand("%"),"\\.h") > 0
    let fname = substitute(expand("%:t"),'\.h\(.*\)','.c',"")
    let s:bufname = bufname(fname)	
	echom s:bufname
	if (strlen(s:bufname)) > 0
		try
			exe ":b" fname
		catch
			call OpenFile(fname)
		endtry
	else
		call OpenFile(fname)
	endif
  endif
endfun
map <silent><leader>h :call Mosh_Flip_Ext()<CR>

" Decent wildmenu
set wildmenu
set wildmode=longest:full
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor


" Proper search
set incsearch
set ignorecase
set smartcase
set gdefault
" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" =============================================================================
" # Autocommands
" =============================================================================

" Prevent accidental writes to buffers that shouldn't be edited
autocmd BufRead *.orig set readonly
autocmd BufRead *.pacnew set readonly
" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste
" Jump to last edit position on opening file
if has("autocmd")
  " https://stackoverflow.com/questions/31449496/vim-ignore-specifc-file-in-autocommand
  au BufReadPost * if expand('%:p') !~# '\m/\.git/' && line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" Auto-clean fugitive buffers
autocmd BufReadPost fugitive://* set bufhidden=delete


" =============================================================================
" # Coc Configuration
" =============================================================================
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
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
	echo join(lines, "\n")
    ""return join(lines, "\n")
endfunction

vmap <leader>m get_visual_selection()

" Easymotion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use uppercase target labels and type as a lower case
let g:EasyMotion_use_upper = 1
let g:EasyMotion_keys = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1
"map <Leader> <Plug>(easymotion-prefix)

""" incsearch
""map / <Plug>(incsearch-forward)
""map ? <Plug>(incsearch-backward)
""map g/ <Plug>(incsearch-stay)
""
""" incsearch-easymotion
""map z/ <Plug>(incsearch-easymotion-/)
""map z? <Plug>(incsearch-easymotion-?)
""map zg/ <Plug>(incsearch-easymotion-stay)
