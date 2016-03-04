" Main conceal settings.
" Keeps everything concealed at all times.
set conceallevel=1
set concealcursor=nvic

" JavaScript thanks to pangloss/vim-javascript
let g:javascript_conceal_function = "λ"
let g:javascript_conceal_this = "@"
" Due to jsx, this mapping for conceal is annoying 
" let g:javascript_conceal_return = "<"
let g:javascript_conceal_prototype = "#"
