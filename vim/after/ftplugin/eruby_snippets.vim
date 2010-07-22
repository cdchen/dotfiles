source ~/.vim/after/ftplugin/html_snippets.vim

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet each <% ".st."object".et.".each do |".st."item".et."| %><CR>".st.et."<CR><% end %>"
exec "Snippet if <% if ".st."expr".et." %><CR>".st.et."<CR><% end %>"
exec "Snippet bl <% ".st.et." %>"
exec "Snippet var <%= ".st.et." %>"
