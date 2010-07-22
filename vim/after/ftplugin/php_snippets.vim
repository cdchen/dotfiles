if !exists('loaded_snippet') || &cp
  finish
endif

function! PHPArgs(text)
  if a:text != "args"
    return a:text
  else
    return ''
  endif
endfunction

function! PHPInitVars(text)
  if a:text != "args"
    let text = substitute(a:text,'=.\{-},','','g')
    let text = substitute(text,'=.\{-}$','','g')
    let text = substitute(text,',','','g')
    let text = substitute(text,'\$','','g')
    let ret = ''
    let tabs = indent(".")
    let tab_text = ''
    for i in range(tabs)
      let tab_text = tab_text.' '
    endfor
    for Arg in split(text, ' ')
      let ret = ret.'$this->'.Arg.' = $'.Arg.';\n'.tab_text
    endfor
    return ret
  else
    return ""
  endif
endfunction

function! PHPCount(haystack, needle)
  let counter = 0
  let index = match(a:haystack, a:needle)
  while index > -1
    let counter = counter + 1
    let index = match(a:haystack, a:needle, index+1)
  endwhile
  return counter
endfunction

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet php <?php ".st.et." ?>"
exec "Snippet class class ".st."ClassName".et." {<CR>function __construct(".st."args:PHPArgs(@z)".et.") {<CR>".st."args:PHPInitVars(@z)".et."".st.et."<CR>}<CR>}"
exec "Snippet . $this->".st.et
exec "Snippet a array(".st.et.")"
exec "Snippet pub public $".st.et." = ".st.et.";"
exec "Snippet func function ".st."name".et."(".st.et.") {<CR>".st.et."<CR>}"
exec "Snippet func function ".st."name".et."(".st.et.") {<CR>".st.et."<CR>}"
exec "Snippet try try {<CR>".st.et."<CR>} catch (".st."Exception".et.") {<CR>".st.et."<CR>}"
exec "Snippet if if (".st.et.") {<CR>".st.et."<CR>}"
exec "Snippet elseif elseif (".st.et.") {<CR>".st.et."<CR>}"
exec "Snippet else {<CR>".st.et."<CR>}"
exec "Snippet foreach foreach (".st."$seq".et." as ".st."$item".et.") {<CR>".st.et."<CR>}"
exec "Snippet for for (".st."int $i=0".et."; ".st.et."; ".st."$i++".et.") {<CR>".st.et."<CR>}"
exec "Snippet while while (".st."true".et.") {<CR>".st.et."<CR>}"
