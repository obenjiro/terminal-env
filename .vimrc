syntax on
filetype plugin on
set omnifunc=syntaxcomplete#Complete

function SetIndentWidth(numberOfSpaces)
  " A tab is 4 spaces
  let &tabstop=a:numberOfSpaces
  " When hitting <BS>, pretend like a tab is removed, even if spaces
  let &softtabstop=a:numberOfSpaces
  " Number of spaces to use for autoindenting
  let &shiftwidth=a:numberOfSpaces
endfunction

call SetIndentWidth(4)

" Always set autoindenting on
set autoindent
" Copy the previous indentation on autoindenting
set copyindent

autocmd BufNewFile,BufRead *.json set ft=javascript
autocmd BufNewFile,BufRead *.bemhtml set ft=javascript

set title

auto BufEnter * call system("tmux rename-window \"vim " . expand("%:t") . "\"") 
auto VimLeave * call system("tmux rename-window bash") 
