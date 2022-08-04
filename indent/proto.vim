if exists('b:did_indent')
  finish
endif
let b:did_indent = 1

setl cindent
setl nolisp
setl autoindent
setl indentexpr=PbIndent(v:lnum)
setl indentkeys+=<:>,0=},0=)
setl expandtab
setl shiftwidth=2

if exists('*PbIndent')
  finish
endif

function! PbIndent(lnum)
  let l:prevlnum = prevnonblank(a:lnum-1)
  if l:prevlnum == 0
    return 0
  endif

  let l:prevl = substitute(getline(l:prevlnum), '//.*$', '', '')
  let l:thisl = substitute(getline(a:lnum), '//.*$', '', '')
  let l:previ = indent(l:prevlnum)

  let l:ind = l:previ

  if l:prevl =~ '[\[({]\s*$'
    let l:ind += shiftwidth()
  endif

  if l:thisl =~ '^\s*[)}\]]'
    let l:ind -= shiftwidth()
  endif

  return l:ind
endfunction

" vim: et sw=2 sts=2
