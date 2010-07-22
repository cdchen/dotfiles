if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet /* /* ".st.et." */"
exec "Snippet /** /**<CR>".st.et."<CR>*/"
exec "Snippet /*= /* ===== ".st.et." ===== */"
exec "Snippet /= /* ===== ".st.et." ===== */"
exec "Snippet { {<CR>".st.et."<CR>}"
exec "Snippet # #".st.et." {<CR>".st.et."<CR>}".st.et
exec "Snippet . .".st.et." {<CR>".st.et."<CR>}".st.et
exec "Snippet : ".st.et.":".st.et.";".st.et
exec "Snippet b border:".st.et.";"
exec "Snippet bg background-color:".st.et.";"
exec "Snippet bgi background-image:url(".st.et.");"
exec "Snippet br border-radius:".st."radius".et.";<CR>-moz-border-radius:".st."radius".et.";<CR>-webkit-border-radius:".st."radius".et.";<CR>-khtml-border-radius:".st."radius".et.";<CR>-o-border-radius:".st."radius".et.";".st.et
exec "Snippet c color:".st.et.";"
exec "Snippet cl clear:".st."both".et.";"
exec "Snippet fl float:".st.et.";"
exec "Snippet fll float:left;".st.et
exec "Snippet flr float:right;".st.et
exec "Snippet ff font-family:".st.et.";"
exec "Snippet fs font-style:".st."italic".et.";".st.et
exec "Snippet fw font-weight:".st."bold".et.";"
exec "Snippet m margin:".st.et.";"
exec "Snippet mt margin-top:".st.et.";"
exec "Snippet mr margin-right:".st.et.";"
exec "Snippet mb margin-bottom:".st.et.";"
exec "Snippet ml margin-left:".st.et.";"
exec "Snippet p padding:".st.et.";"
exec "Snippet ta text-align:".st.et.";"
exec "Snippet tal text-align:left;".st.et
exec "Snippet tac text-align:center;".st.et
exec "Snippet tar text-align:right;".st.et
exec "Snippet taj text-align:justify;".st.et
exec "Snippet td text-decoration:".st."underline".et.";".st.et
exec "Snippet va vertical-align:".st.et.";"

exec "Snippet clearfix .clearfix:after {<CR>content:".";<CR>display:block;<CR>height:0;<CR>clear:both;<CR>visibility:hidden;<CR>}".st.et
