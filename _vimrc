" 前置
" win的配置文件是_vimrc 在vim安装目录下配置，linux的配置文件在家目录下~/.vim/vimrc下配置。
" vimtutor官方教程。
" 读取系统命令的返回内容：:r !ls ，执行此命令就会将命令的返回结果输入到光标所在行。
" 键盘宏：q开启 a-z将宏录制到那个键位上 q退出录制 @a-z调用录制好的宏
" c i w 删除一个单词并进入写入模式,c i " 删除指定符号内的东西并进入写入模式。
" f a-z 光标跳转到指定字符下一次出现的地方。
" 可视块批量操作 v :normal 头：xxx ，尾：A.xxx
" 打开文件 :e 文件路径


" 基本设置
" 老板键
let mapleader=" "





" 开启设置
" == 开启高亮
syntax on
" == 开启行号
set number
set relativenumber
" == 开启光标线
" set cursorline
" 启动折行
set wrap
" 设置当文件变化时，自动读取新文件
set autoread	
" 设置 tab space 为4个空格
set tabstop=4 			
" 同 tabstop
set ts=4				
" 将tab替换为指定数量的空格
set expandtab			
" 设置为自动缩进
set autoindent			
" 设置字体为 consolas，字号为14
set guifont=consolas:h14	
" 设置保存命令的行数
set history=700		
" 切换文件格式，ff是 fileformat 的缩写
set ff=unix			" 将文件切换为 unix 格式，每行以 \n 结尾 
" set ff=dos		" 切换为 Windows 格式，每行以 \r\n 结尾
" 设置编码格式
set encoding=utf-8			" 设置 vim 展示文本时的编码格式
set fileencoding=utf-8		" 设置 vim 写入文件时的编码格式
" 显示输入的命令，按q:就可以调出历史命令。
set showcmd
" vim 命令补全,列出可选项。
set wildmenu
" 搜索结果高亮， n是下一个 N是上一个。
set hlsearch
" 打开文件不高亮
exec "nohlsearch"
" 实时高亮
set incsearch
" 搜索时忽略大小写
set ignorecase
" 搜索时智能识别大小写
set smartcase
" 取消高亮
noremap <LEADER><CR> :nohlsearch<CR>

" 需要考察。。。
" noremap = hzz
" noremap - Hzz
" 解决win下无法删除
set nocompatible
set backspace=indent,eol,start


" -----------------------------------------------



" 键位设置
map W <nop>
map W :w<CR> 
map Q :q<CR>
map R :source $MYVIMRC<CR>

noremap K 5k
noremap J 5j
" 分屏下、上、右、左, ctrl+w hjkl 切换光标所在的窗口。 (<C-w>j)
map <LEADER>j :set splitbelow<CR>:split<CR>
map <LEADER>k :set nosplitbelow<CR>:split<CR>
map <LEADER>l :set splitright<CR>:vsplit<CR>
map <LEADER>h :set nosplitright<CR>:vsplit<CR>
" 调整分屏大小
map <up> :res -5<CR>
map <down> :res +5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>
" 标签创建与切换
map tn :tabe<CR>
map tj :-tabnext<CR>
map tk :+tabnext<CR>
" 切换分屏方向
map th <C-w>t<C-w>H
map tl <C-w>t<C-w>K






" 安装plug.vim
" 进入github搜索vim-plug下载里面的plug.vim到电脑上的autoload目录下，win目录在~/vimfiles/需要创建,linux在~/.vim目录下/根据情况创建。

" 插件设置 安装命令 :PlugInstall
call plug#begin('o:/Vim/plugged')
" 状态栏样式
Plug 'vim-airline/vim-airline'
" vim的配色
Plug 'connorholyday/vim-snazzy'
" 代码补全下载语言服务器 :LspInstallServer 卸载是 :LspUninstallServer
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
"Plug 'ycm-core/YouCompleteMe'
" 目录树
Plug 'preservim/nerdtree'
" 命令管理插件，方便记忆
Plug 'liuchengxu/vim-which-key'


Plug 'sheerun/vim-polyglot'
Plug 'fatih/vim-go'


call plug#end()

" 调用配色
color snazzy
" 调整背景透明度
let g:SnazzyTransparent = 100

nnoremap tt :NERDTree<CR>

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>








