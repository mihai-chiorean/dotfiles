" Load Vundle. Manages all of the bundles.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Specify all bundles.
Plugin 'gmarik/Vundle.vim'

" Syntax and language improvements.
Plugin 'helino/vim-json'
Plugin 'tpope/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'derekwyatt/vim-scala'

" General.
Plugin 'ciaranm/detectindent'
Plugin 'Lokaltog/vim-distinguished'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'PeterRincker/vim-argumentative'
Plugin 'Raimondi/delimitMate'
Plugin 'Valloric/YouCompleteMe'
Plugin 'mhinz/vim-signify'
Plugin 'bling/vim-airline'
Plugin 'edkolev/promptline.vim'
Plugin 'embear/vim-localvimrc'
Plugin 'kien/ctrlp.vim'
Plugin 'marijnh/tern_for_vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/syntastic'
Plugin 'walm/jshint.vim'
Plugin 'sjl/gundo.vim'
Plugin 'SirVer/ultisnips'
Plugin 'sjl/splice.vim'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-vinegar'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-projectile'

" Mine!
Plugin 'Wolfy87/vim-enmasse'

" Text objects.
Plugin 'kana/vim-textobj-user'
Plugin 'glts/vim-textobj-comment'
Plugin 'kana/vim-textobj-datetime'
Plugin 'kana/vim-textobj-entire'
Plugin 'kana/vim-textobj-indent'
Plugin 'mattn/vim-textobj-url'

" Enable some syntax settings that had to be disabled for Vundle.
call vundle#end()
filetype plugin indent on

" Configure syntastic.
let g:syntastic_check_on_open=1
let g:syntastic_mode_map={
  \'mode': 'active',
  \'active_filetypes': [],
  \'passive_filetypes': ['html', 'cpp']
\}

" Configure YouCompleteMe.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

" Configure UltiSnips.
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetsDir="~/.vim/snippets"

" Configure localvimrc.
let g:localvimrc_ask=0
let g:localvimrc_sandbox=0

" Configure EasyMotion.
let g:EasyMotion_leader_key='<Space>'

" Configure airline.
let g:airline#extensions#tabline#enabled=1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Configure promptline.
let g:promptline_powerline_symbols=0
let g:promptline_preset = {
  \'a' : [ promptline#slices#user() ],
  \'b' : [ promptline#slices#jobs(), promptline#slices#vcs_branch() ],
  \'c' : [ promptline#slices#cwd() ],
  \'warn' : [ promptline#slices#last_exit_code() ]
\}

" Configure delimitMate
let delimitMate_expand_cr=1

" Ag motion mappings. (stolen from Steve Losh!)
nnoremap <silent> <leader>a :set opfunc=<SID>AgMotion<CR>g@
xnoremap <silent> <leader>a :<C-U>call <SID>AgMotion(visualmode())<CR>

nnoremap <bs> :Ag! '\b<c-r><c-w>\b'<cr>
xnoremap <silent> <bs> :<C-U>call <SID>AgMotion(visualmode())<CR>

function! s:CopyMotionForType(type)
  if a:type ==# 'v'
    silent execute "normal! `<" . a:type . "`>y"
  elseif a:type ==# 'char'
    silent execute "normal! `[v`]y"
  endif
endfunction

function! s:AgMotion(type) abort
  let reg_save = @@
  call s:CopyMotionForType(a:type)
  execute "normal! :Ag! --literal " . shellescape(@@) . "\<cr>"
  let @@ = reg_save
endfunction

" Gundo commands. (u)
nnoremap <silent> <leader>u :GundoToggle<CR>

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command='ag %s -l --nocolor -g ""'

" Enable indent guides on boot and allow colorschemes to style them.
nnoremap <silent> <leader>i :IndentGuidesToggle<CR>
let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_auto_colors=0

" Enable indentation detection.
let g:detectindent_preferred_indent=4

augroup DetectIndent
  autocmd!
  autocmd BufReadPost * :DetectIndent
augroup END
