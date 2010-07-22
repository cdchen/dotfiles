if !exists('loaded_snippet') || &cp
    finish
endif

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

exec "Snippet extends {% extends \"".st.et."\" %}"
exec "Snippet filter {% filter ".st.et." %}<CR>".st.et."<CR>".st."% endfilter %}"
exec "Snippet block {% block ".st.et." %}".st.et."{% endblock %}"
exec "Snippet cycle {% cycle ".st.et." as ".st.et." %}"
exec "Snippet if {% if ".st.et." %}<CR>".st.et."<CR>{% endif %}"
exec "Snippet include {% include \"".st.et."\" %}"
exec "Snippet for {% for ".st.et." in ".st.et." %}<CR>".st.et."<CR>{% endfor %}"
exec "Snippet set {% set ".st.et." = ".st.et." %}"
exec "Snippet filter {% filter ".st.et."%}".st.et."{% endfilter %}"
exec "Snippet raw {% raw %}".st.et."{% endraw %}"
exec "Snippet var {{ ".st.et." }}"
