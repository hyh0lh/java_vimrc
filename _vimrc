source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

" Startup {{{
filetype indent plugin on


" vim �ļ��۵���ʽΪ marker
augroup ft_vim
    au!

    au FileType vim setlocal foldmethod=marker
augroup END
" }}}

" General {{{

" vim��Ĭ�ϼĴ�����ϵͳ�����干��
set clipboard+=unnamed

" ����alt����ӳ�䵽�˵���(�����ܶԲ˵���������)
" set winaltkeys=no

" ���ô��ڴ�С
"set lines=35 columns=80

"ȡ�������ļ�����
set noundofile

"ȡ�������ļ�����(���Ѿ�Ԯ)
set nobackup
"ȡ�������������ļ�����(���Ѿ�Ԯ)
set noswapfile

"��ʾ�к�
set nu!

"����ʱ��ȥԮ����ʾ
set shortmess=atI

"�﷨����
syntax on

"û�б�����ļ�ֻ��ʱ����ȷ��
set confirm

"������
"set mouse=a

"tab����
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab

"�ļ��Զ�����ⲿ����
set autoread

"c�ļ��Զ�����
set cindent

"�Զ�����
set autoindent

"��������
set smartindent

"��������ƥ��
set hlsearch

"����ɫ����
"set background=desert

"��ʾ��ߣ����������½���ʾ���λ��
"set ruler

"�����۵�
"set foldenable
"""""""""""""""""�����۵�"""""""""""""""""""""
"
"�����﷨�۵�
"set fdm=syntax
"�ֶ��۵�
"set fdm=manual

"��Ҫ��˸
"set novisualbell

"������ʾ״̬��
"set laststatus=2

"ǳɫ��ʾ��ǰ��
"autocmd InsertLeave * se nocul

"��ǳɫ������ǰ��
"autocmd InsertEnter * se cul

"��ʾ���������
"set showcmd

set diffexpr=MyDiff()

" }}}

" keymap {{{

inoremap jk <Esc>

let mapleader=","
" �༭�����ļ�
nmap <leader>s :source $VIM/_vimrc<cr>
" ˢ�������ļ�
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
