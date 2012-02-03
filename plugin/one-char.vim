function! SubstituteByOneChar()
  let inputLine = getline('.')
  let outputLine = substitute(inputLine, 'a', 'x', 'g')
  call setline(line('.'), outputLine)
endfunction

inoremap <c-l> <Esc>:call SubstituteByOneChar()<cr>
