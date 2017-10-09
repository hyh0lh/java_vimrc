source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Startup {{{
filetype indent plugin on


" vim 文件折叠方式为 marker
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
augroup END
" }}}

" General {{{

" vim的默认寄存器和系统剪贴板共享
set clipboard+=unnamed

" 设置alt键不映射到菜单栏(即不能对菜单栏起作用)
" set winaltkeys=no

" 设置窗口大小
"set lines=35 columns=80

"取消撤销文件生成
set noundofile

"取消备份文件生成(灾难救援)
set nobackup
"取消缓冲区备份文件生成(灾难救援)
set noswapfile

"显示行号
set nu!

"启动时隐去援助提示
set shortmess=atI

"语法高亮
syntax on

"没有保存或文件只读时弹出确认
set confirm

"鼠标可用
"set mouse=a

"tab缩进
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

"文件自动检测外部更改
set autoread

"c文件自动缩进
set cindent

"自动对齐
set autoindent

"智能缩进
set smartindent

"高亮查找匹配
set hlsearch

"背景色设置
"set background=desert

"显示标尺，就是在右下角显示光标位置
"set ruler

"允许折叠
"set foldenable
"""""""""""""""""设置折叠"""""""""""""""""""""
"
"根据语法折叠
"set fdm=syntax
"手动折叠
"set fdm=manual

"不要闪烁
"set novisualbell

"启动显示状态行
"set laststatus=2

"浅色显示当前行
"autocmd InsertLeave * se nocul

"用浅色高亮当前行
"autocmd InsertEnter * se cul

"显示输入的命令
"set showcmd

set diffexpr=MyDiff()

" }}}

" keymap {{{

inoremap jk <Esc>

let mapleader=","
" 编辑配置文件
nmap <leader>s :source $VIM/_vimrc<cr>
" 刷新配置文件
nmap <leader>e :e $VIM/_vimrc<cr>

map <leader>tn :tabnew<cr>
map <leader>tc :tabclose<cr>
map <leader>th :tabp<cr>
map <leader>tl :tabn<cr>

" }}}

" function {{{

function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction

" }}}
