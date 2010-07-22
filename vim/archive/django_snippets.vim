if !exists('loaded_snippet') || &cp
  finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet extends {% extends \"".st.et."\" %}"
exec "Snippet include {% include \"".st.et."\" %}"
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
for djtag in ['filter', 'block', 'cycle', 'if', 'blocktrans', 'with']
  exec "Snippet ".djtag." {% ".djtag." ".st.et." %}<CR>".st.et."<CR>{% end".djtag." %}"
endfor

exec "Snippet <trfields {% for field in form %}<CR><tr><CR><Tab><th><CR><Tab>{{ field.label_tag }}:<CR><BS></th><CR><td><CR><Tab>{{ field }}<CR>{{ field.errors }}<CR>{% if field.help_text %}<p class=\"help_text\">{{ field.help_text|safe }}</p>{% endif %}<CR><BS></td><CR><BS></tr><CR>{% endfor %}".st.et
exec "Snippet <trsubmit <tr><CR><Tab><td colspan=\"2\" class=\"submit_cell\"><CR><Tab><input type=\"submit\" value=\"".st.et."\" /><CR><BS></td><CR><BS></tr>".st.et
