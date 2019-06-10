set nu " 显示行号

" 配置tab缩进
set ts=4
set sw=4
set expandtab
set autoindent

" 鼠标支持
set mouse=a

" 配置插件管理工具
call plug#begin("~/.config/nvim/plugged")

" 状态栏配置
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 代码补全
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect
highlight PmenuSel ctermbg=white guibg=white  " 修改选择下拉菜单的颜色

" languageClient 支持
Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }

" languageServer 配置
let g:LanguageClient_serverCommands = {
	\ 'python' :["pyls"],
    \ 'rust': ['rustup', 'run', 'stable', 'rls'],
    \ 'dart': ['$DART_SDK/dart', "$DART_SDK/snapshots/analysis_server.dart.snapshot", "--lsp"],
\ }
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" 目录显示
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

map <F3> :NERDTreeToggle<CR>
let NERDTreeChDirMode=1
let NERDTreeShowBookmarks=1  " 显示书签
let NERDTreeWinSize=25  " 修改NERDTree侧边窗口大小

"  文档查询dash
Plug 'rizzatti/dash.vim'

" markdown 预览
" 需要安装依赖
Plug 'iamcco/mathjax-support-for-mkdp'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'}

" 输入法切换
" 退出insert模式的时候切换到英文输入法
Plug 'chenguanda/smartim'
let g:smartim_default='com.apple.keylayout.ABC' " 配置默认输入法

" dart 支持
" 需要在环境变量中配置 Dart sdk的路径 $DART_SDK 
Plug 'dart-lang/dart-vim-plugin'

call plug#end()


