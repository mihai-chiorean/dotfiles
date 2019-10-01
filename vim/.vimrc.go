Plug 'vim-jp/vim-go-extra'
Plug 'stamblerre/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }

if exists('g:loaded_polyglot')
    let g:polyglot_disabled = ['go']
endif
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
autocmd BufWritePost,FileWritePost *.go execute 'Lint' | cwindow
setlocal omnifunc=go#complete#Complete
