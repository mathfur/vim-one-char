function! SubstituteByOneChar()
  let inputLine = getline('.')
  let inputLineInBase64 = system("ruby -r cgi -e 'puts CGI.escape(%q!".substitute(inputLine, "!", "\\\\!", "g")."!)'")
  let url = 'http://localhost:8000/?statement='.inputLineInBase64
  let outputLine = system('curl -sf "'.url.'"')
  let splitedLine = split(outputLine, "\n")
  call setline(line('.'), splitedLine)
  call cursor(0, 1000)
endfunction

inoremap <c-l> <Esc>:call SubstituteByOneChar()<cr>
