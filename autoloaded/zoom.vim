scriptencoding utf-8

function! ZOOM(...)
  if strlen(&guifont) == 0
    echo "guifont has not set."
    finish
  else
  if has("win32") || has("win64")
    let getfont = split(&guifont, ':')
    call remove(insert(insert(getfont, substitute(substitute(getfont[1], '\D*', '', '') + get(a:, 1, 1), '^', 'h', ''), 1), 'guifont', 0), 3)
    let setfont = substitute(join(getfont,':'), ':', '=', '')
  elseif has("unix")
    let getfont = split(&guifont, ' ')
    call remove(insert(insert(getfont, getfont[1] + get(a:, 1, 1), 1), 'guifont=', 0),3) 
    let setfont = join(getfont, '\ ')
  endif
  execute 'set' setfont
  endif
endfunction

