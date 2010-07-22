if !exists('loaded_snippet') || &cp
    finish
endif

function! JsInit(text)
    if a:text != "args"
        return a:text
    else
        return ''
    endif
endfunction

function! JsInitVars(text)
    if a:text != "args"
        let text = substitute(a:text,'=.\{-},','','g')
        let text = substitute(text,'=.\{-}$','','g')
        let text = substitute(text,',','','g')
        let ret = ''
        let tabs = indent(".")/&tabstop
        let tab_text = ''
        for i in range(tabs)
            let tab_text = tab_text.'\t'
        endfor
        for Arg in split(text, ' ')
            let ret = ret.'this.'.Arg.' = '.Arg.';\n'.tab_text
        endfor
        return ret
    else
        return ''
    endif
endfunction

function! JsRemDefVal(text)
    return substitute(a:text,'=.*','','g')
endfunction

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet class function (".st.et.") {<CR>var C = {<CR>".st.et."<CR><BS>};<CR>return C;<CR>};"
exec "Snippet : ".st.et.": ".st.et.","
exec "Snippet met function (".st.et.") {<CR>".st.et."<CR>}"
exec "Snippet meth function (".st.et.") {<CR>".st.et."<CR>},"
exec "Snippet func function (".st.et.") {<CR>".st.et."<CR>};"
exec "Snippet fun function (".st.et.") {<CR>".st.et."<CR>}"
exec "Snippet fu function (".st.et.") { ".st.et." }"
exec "Snippet efor for (var ".st."i".et." = ".st."0".et."; ".st."i:JsRemDefVal(@z)".et."; < ".st.et."; ".st."i:JsRemDefVal(@z)".et."++) {<CR>".st.et."<CR>}"
exec "Snippet for for (".st.et."; ".st.et."; ".st.et.") {<CR>".st.et."<CR>}"
exec "Snippet forin for (var ".st."i".et." in ".st."object".et.") { if (".st."object".et.".hasOwnProperty(".st."i".et.")) {<CR>".st.et."<CR>}}"
exec "Snippet foreach for each (var ".st."x".et." in ".st.et.") {<CR>".st.et."<CR>}"
exec "Snippet fori for (var ".st."i".et." = 0; ".st.et."; ".st."i".et."++) {<CR>".st.et."<CR>}"
exec "Snippet fora for (var ".st."i".et." = 0; ".st."i".et." < ".st.et.".length; ".st."i".et."++) {<CR>".st.et."<CR>}"
exec "Snippet forarg for (var ".st."i".et." = 0; ".st."i".et." < arguments.length; ".st."i".et."++) {<CR>".st.et."<CR>}"
exec "Snippet while while (".st."true".et.") {<CR>".st.et."<CR>}"
exec "Snippet do do {<CR>".st.et."<CR>} while (".st."true".et.")"
exec "Snippet if if (".st.et.") {<CR>".st.et."<CR>}"
exec "Snippet elif else if (".st.et.") {<CR>".st.et."<CR>}"
exec "Snippet else else {<CR>".st.et."<CR>}"
exec "Snippet . this."
exec "Snippet that var that = this;".st.et
exec "Snippet log console.log(".st.et.");".st.et
exec "Snippet logs console.log(\"".st.et."\");".st.et
