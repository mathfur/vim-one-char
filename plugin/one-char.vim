function! SubstituteByOneChar()
  let inputLine = getline('.')
  let inputLineInBase64 = system("ruby -r cgi -e 'puts CGI.escape(%q!".substitute(inputLine, "!", "\\\\!", "g")."!)'")
  let url = 'http://localhost:8000/?statement='.inputLineInBase64
  let outputLine = system('curl -sf "'.url.'"')
  call setline(line('.'), outputLine)
endfunction

inoremap <c-l> <Esc>:call SubstituteByOneChar()<cr>
