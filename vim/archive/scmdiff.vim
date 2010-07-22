if !exists("g:SCMDiffCommand")
  let g:SCMDiffCommand = 'svn'
endif
"if !exists("g:SCMDiff_diffwindow_title")
"  let g:SCMDiff_diffwindow_title = '__SCMDiff_diffwindow__'
"endif


if exists("loaded_scmdiff") || &cp
  finish
endif

let loaded_scmdiff = 1
let s:last_difffile = "__last_difffile__"

map <C-d> :SCMDiffToggle<CR>
map <C-g> :set nodiff<CR>
command! -nargs=0 -bar SCMDiffToggle call s:SCMDiffToggle()
command! -nargs=0 -bar SCMDiffOpen call s:SCMDiff("-r -1")
command! -nargs=0 -bar SCMDiffClose call s:SCMDiffClose()

if !exists('g:SCMDiff_split_vertical')
  let g:SCMDiff_split_vertical = 1
endif


function! s:SCMDiff(...)
  if exists("g:scmdiff_rev")
    let s:scmdiff_rev = g:scmdiff_rev
  else
    let s:scmdiff_rev = ""
  endif
  if a:0 == 1
    if a:1 == 'none'
      let s:scmdiff_rev = ""
    else
      let s:scmdiff_rev = a:1
    endif
  endif

  let ftype = &filetype
  let tmpfile = tempname()
  let cmd = 'cat ' . bufname('%') . ' > ' . tmpfile
  let cmd_output = system(cmd)
  let tmpdiff = tempname()
  let cmd = g:SCMDiffCommand . ' diff ' . s:scmdiff_rev . ' ' . bufname('%') . ' > ' . tmpdiff
  let cmd_output = system(cmd)
  if v:shell_error && cmd_output != ''
    echohl WarningMsg | echon cmd_output 
    return
  endif

  let cmd = 'patch -R -p0 ' . tmpfile . ' ' . tmpdiff
  let cmd_output = system(cmd)
  if v:shell_error && cmd_output != ''
    echohl WarningMsg | echon cmd_output 
    return
  endif

  if g:SCMDiff_split_vertical
    exe 'vertical diffsplit ' . tmpfile
  else
    exe 'diffsplit ' . tmpfile
  endif
  set readonly

  let s:last_difffile = tmpfile
  exe 'set filetype=' . ftype
endfunction

function! s:SCMDiffClose()
    " Make sure the taglist window exists
    let winnum = bufwinnr(s:last_difffile)
    if winnum == -1
        return
    endif

    if winnr() == winnum
        exe winnum . 'bd'
    else
        " Goto the diff window, close it and then come back to the
        " original window
        let curbufnr = bufnr('%')
        exe winnum . 'wincmd w'
        exe winnum . 'bd'
        " Need to jump back to the original window only if we are not
        " already in that window
        let winnum = bufwinnr(curbufnr)
        if winnr() != winnum
            exe winnum . 'wincmd w'
        endif
    endif
endfunction

function! s:SCMDiffToggle()
    " If diff window is open then close it.
    let winnum = bufwinnr(s:last_difffile)
    if winnum != -1
        call s:SCMDiffClose()
        return
    endif

    call s:SCMDiff()

    " Go back to the original window
    exe 'wincmd p'
endfunction

"function! SCMDiffWindow()
"  if exists("g:scmdiff_rev")
"    let s:scmdiff_rev = g:scmdiff_rev
"  else
"    let s:scmdiff_rev = ""
"  endif
"  if a:0 == 1
"    if a:1 == 'none'
"        let s:scmdiff_rev = ""
"    else
"      let s:scmdiff_rev = a:1
"    endif
"  endif
"
"  let ftype = &filetype
"  let tmpfile = tempname()
"  let cmd = 'cat ' . bufname('%') . ' > ' . tmpfile
"  let cmd_output = system(cmd)
"  let tmpdiff = tempname()
"  let cmd = g:SCMDiffCommand . ' diff ' . s:scmdiff_rev . ' ' . bufname('%') . ' > ' . tmpdiff
"  let cmd_output = system(cmd)
"  if v:shell_error && cmd_output != ''
"    echohl WarningMsg | echon cmd_output 
"    return
"  endif
"
"  let cmd = 'patch -R -p0 ' . tmpfile . ' ' . tmpdiff
"  let cmd_output = system(cmd)
"  if v:shell_error && cmd_output != ''
"    echohl WarningMsg | echon cmd_output 
"    return
"  endif
"
"  if a:0 > 0 && a:1 == 'h'
"    exe 'diffsplit' . tmpfile
"  else
"    exe 'vert diffsplit' . tmpfile
"  endif 
"
"  exe 'set filetype=' . ftype
"
"  hide
"  set foldlevel=100
"endfunction

"autocmd CursorHold * call s:SCMDiff()
