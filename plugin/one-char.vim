function! SubstituteByOneChar()
  let inputLine = getline('.')
  let url = 'http://localhost:8000/?statement='.inputLine
  let outputLine = system('curl -sf "'.url.'"')
  call setline(line('.'), outputLine)
endfunction

inoremap <c-l> <Esc>:call SubstituteByOneChar()<cr>
