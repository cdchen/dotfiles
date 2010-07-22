if !exists('loaded_snippet') || &cp
  finish
endif

source ~/.vim/after/ftplugin/html_snippets.vim

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet extends {% extends \"".st.et."\" %}"
exec "Snippet base {% extends \"base.html\" %}".st.et
exec "Snippet include {% include \"".st.et."\" %}"
exec "Snippet load {% load ".st.et." %}"
exec "Snippet for {% for ".st."object".et." in ".st."\"object_list\"".et." %}<CR>".st.et."<CR>{% endfor %}"
exec "Snippet var {{ ".st."object".et." }}".st.et
exec "Snippet else {% else %}".st.et
exec "Snippet trans {% trans \"".st.et."\" %}".st.et
exec "Snippet i18n {% load i18n %}".st.et

" tags without arguments
for djtag in ['raw', 'comment']
  exec "Snippet ".djtag." {% ".djtag." %}<CR>".st.et."<CR>{% end".djtag." %}"
endfor
" tags with arguments
for djtag in ['filter', 'block', 'cycle', 'if', 'ifequal', 'ifchanged', 'ifnotequal', 'blocktrans', 'with', 'cache']
  exec "Snippet ".djtag." {% ".djtag." ".st.et." %}".st.et."{% end".djtag." %}"
endfor

exec "Snippet <trfields {% for field in form %}<CR><tr><CR><Tab><th><CR><Tab>{{ field.label_tag }}:<CR><BS></th><CR><td><CR><Tab>{{ field }}<CR>{{ field.errors }}<CR>{% if field.help_text %}<p class=\"help_text\">{{ field.help_text|safe }}</p>{% endif %}<CR><BS></td><CR><BS></tr><CR>{% endfor %}".st.et
exec "Snippet <trsubmit <tr><CR><Tab><td colspan=\"2\" class=\"submit_cell\"><CR><Tab><input type=\"submit\" value=\"".st.et."\" /><CR><BS></td><CR><BS></tr>".st.et

exec "Snippet media {{ MEDIA_URL }}".st.et
exec "Snippet debug {% load tdebug %}<CR>{% debugcontext %}".st.et
