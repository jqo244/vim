" 起動時にruntimepathにNeoBundleのパスを追加する
if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
 
" NeoBundle設定の開始
call neobundle#begin(expand('~/.vim/bundle'))
 
" NeoBundleのバージョンをNeoBundle自身で管理する
NeoBundleFetch 'Shougo/neobundle.vim'
 
" インストールしたいプラグインを記述
NeoBundle 'tomasr/molokai'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'scrooloose/syntastic.git'
NeoBundle 'ngmy/vim-rubocop'
 
" NeoBundle設定の終了
 
call neobundle#end()
 
filetype plugin indent on
 
" vim起動時に未インストールのプラグインをインストールする
NeoBundleCheck

""""""プラグインの設定""""""

"mololai
syntax on
colorscheme molokai
set t_Co=256

"モードを見やすくlightline.vim
set laststatus=2

"文法チェックsyntastic
let g:syntastic_enable_signs=1
let g:syntastic_auto_loc_list=2
let g:syntastic_mode_map = {'mode': 'passive'} 
" augroup AutoSyntastic
" 	autocmd!
" 	autocmd InsertLeave,TextChanged * call s:syntastic() 
" augroup END
" function! s:syntastic()
" 	w
" 	SyntasticCheck
" endfunction
let g:syntastic_check_on_wq = 0

"コード綺麗に RuboCop
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop','mri']

"""""""プラグインの設定　終わり""""""

""""""その他の設定""""""

" 行番号を表示
:set number

" オートインデントする
:set autoindent

" 行頭と行末とで移動できるようにする
:set whichwrap=b,s,h,l,<,>,[,]

" タブ幅を設定する
:set tabstop=4
:set softtabstop=4
:set shiftwidth=4


" 編集中のファイル名を表示する
" :set title

" モードを表示する
:set showmode
