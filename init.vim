" options
set number  " 行番号を表示する
set encoding=UTF-8
set backspace=indent,eol,start  " バックスペースを有効にする
set updatetime=250  " 反映時間を短くする(デフォルトは4000ms)
set belloff=all

"" キーマップ
" タブを作成する
nnoremap tc :tabnew<CR>
" 前のタブを開く
nnoremap tp :tabp<CR>
" 次のタブを開く
nnoremap tn :tabn<CR>
" タブを閉じる
nnoremap tx :tabclose<CR>

""" plugin
call plug#begin('~/.vim/plugged')

" ステータスラインを表示する
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasiser/vim-code-dark'
Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
Plug 'yuki-yano/fern-preview.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'airblade/vim-gitgutter'

" c-lang
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'Shougo/dein.vim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'Shougo/deoplete.nvim'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" rust
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}
Plug 'itchyny/lightline.vim'

" ファイル検索
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

call plug#end()

" VSCodeライクなカラースキームにする
colorscheme codedark

""" vim-airline
" カラーテーマ
let g:airline_theme = 'codedark'
" タブラインの表示
let g:airline#extensions#tabline#enabled = 1
" ステータスラインに表示する項目を変更する
let g:airline#extensions#default#layout = [
	\ ['a', 'b', 'c' ],
	\ ['z']
	\ ]
let g:airline_section_c = '%t $M'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '')
" 変更が無ければdiffの行数を表示しない
let g:airline#extensions#hunks#non_zero_only = 1

" タブラインの表示を変更する
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_buffers = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#show_close_button = 0

" Fern
let g:fern#renderer = 'nerdfont'

" アイコンに色をつける
augroup my-glyph-palette
	autocmd! *
	autocmd FileType fern call glyph_palette#apply()
	autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

""" c-lang
set hidden
let g:LanguageClient_serverCommands = {
	\ 'cpp': ['clangd'],
	\ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
	\ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
	\ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
	\ 'python': ['/usr/local/bin/pyls'],
	\ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
      \ }
let g:LanguageClient_loadSettings = 1
let g:LanguageClient_hasSnippetSupport = 0

set completefunc=LanguageClient#complete

nnoremap K :call LanguageClient#textDocument_hover()<CR>
nnoremap F :call LanguageClient#textDocument_formatting()<CR>

""" Rust
syntax enable
filetype plugin indent on

" 保存時に自動でrustfmt
let g:rustfmt_autosave = 1

set number

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

""" タブ操作
" タブを作成
nnoremap tc :tabnew<CR>
" 前のタブを開く
nnoremap tp :tabp<CR>
" 次のタブを開く
nnoremap tn :tabn<CR>
" タブを閉じる
nnoremap tx :tabclose<CR>
" Ctrl+nでファイルツリーを表示/非表示する
nnoremap <C-n> :Fern . -reveal=% -drawer -toggle -width=40<CR>

"" git操作
" g]で前の変更箇所へ移動する
nnoremap g[ :GitGutterPrevHunk<CR>
" g[で次の変更箇所へ移動する
nnoremap g] :GitGutterNextHunk<CR>
" ghでdiffをハイライトする
nnoremap gh :GitGutterLineHighlightsToggle<CR>
" gpでカーソル行のdiffを表示する
nnoremap gp :GitGutterPreviewHunk<CR>
" 記号の色を変更する
highlight GitGutterAdd ctermfg=green
highlight GitGutterChange ctermfg=blue
highlight GitGutterDelete ctermfg=red

"LightLineにcoc.nvimのステータスを載せます
let g:lightline = {
  \'active': {
    \'right': [
      \['coc']
    \]
  \},
  \'component_function': {
    \'coc': 'coc#status'
  \}
\}

"Diagnosticsの、左横のアイコンの色設定
highlight CocErrorSign ctermfg=15 ctermbg=196
highlight CocWarningSign ctermfg=0 ctermbg=172

"以下ショートカット

"ノーマルモードで
"スペース2回でCocList
nmap <silent> <space><space> :<C-u>CocList<cr>
"スペースhでHover
nmap <silent> <space>h :<C-u>call CocAction('doHover')<cr>
"スペースdfでDefinition
nmap <silent> <space>df <Plug>(coc-definition)
"スペースrfでReferences
nmap <silent> <space>rf <Plug>(coc-references)
"スペースrnでRename
nmap <silent> <space>rn <Plug>(coc-rename)
"スペースfmtでFormat
nmap <silent> <space>fmt <Plug>(coc-format)

