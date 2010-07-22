if !exists('loaded_snippet') || &cp
    finish
endif

source ~/.vim/after/ftplugin/javascript_snippets.vim

let st = g:snip_start_tag
let et = g:snip_end_tag
let cd = g:snip_elem_delim

" Document sceleton
exec "Snippet basehtml <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\"><CR><html><CR><Tab><title>".st.et."</title><CR><BS></head><CR><body><CR><Tab>".st.et."<CR><BS></body><CR></html>"
exec "Snippet xhtml <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"><CR><html xmlns=\"http://www.w3.org/1999/xhtml\"><CR><Tab><title>".st.et."</title><CR><BS></head><CR><body><CR><Tab>".st.et."<CR><BS></body><CR></html>"

" Doctypes
exec "Snippet doctype <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Frameset//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\"><CR>".st.et
exec "Snippet doc4s <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01//EN\" \"http://www.w3.org/TR/html4/strict.dtd\"><CR>".st.et
exec "Snippet doc4t <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\"><CR>".st.et
exec "Snippet doc4f <!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Frameset//EN\" \"http://www.w3.org/TR/html4/frameset.dtd\"><CR>".st.et
exec "Snippet docxs <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\"><CR>".st.et
exec "Snippet docxt <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\"><CR>".st.et
exec "Snippet docxf <!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML Frameset//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-frameset.dtd\"><CR>".st.et

" Meta tags
exec "Snippet <xhtml <html xmlns=\"http://www.w3.org/1999/xhtml\">".st.et."</html>"
exec "Snippet <html <html><CR><head><CR><Tab><title>".st.et."</title><CR><BS></head><CR><body><CR><Tab>".st.et."<CR><BS><body><CR></html>"
exec "Snippet <metautf8 <meta http-equiv=\"Content-Type\" content=\"text/html;charset=utf-8\" />".st.et
exec "Snippet <style <style type=\"text/css\">".st.et."</style>".st.et
exec "Snippet <script <script type=\"text/javascript\">//<![CDATA[<CR><Tab>".st.et."<CR><BS>//]]></script>"
exec "Snippet <scriptsrc <script type=\"text/javascript\" src=\"".st.et."\"></script>".st.et
exec "Snippet <textarea <textarea name=\"".st.et."\" rows=\"".st.et."\" cols=\"".st.et."\">".st.et."</textarea>".st.et
exec "Snippet <css <link rel=\"stylesheet\" href=\"".st.et."\" type=\"text/css\" media=\"".st."screen".et."\" />".st.et
exec "Snippet <ct <meta http-equiv=\"Content-Type\" content=\"".st.et."\" />".st.et

" Form Tags
exec "Snippet <form <form action=\"".st.et."\" method=\"".st."post".et."\">".st.et."</form>"
exec "Snippet <fileform <form action=\"".st."\".\"".et."\" method=\"".st."post".et."\" enctype=\"multipart/form-data\">".st.et."</form>"
exec "Snippet <input <input type=\"".st."text".et."\" name=\"".st.et."\" value=\"".st.et."\" ".st.et."/>".st.et
for ctype in ['text', 'hidden', 'password', 'checkbox', 'radio', 'button']
  exec "Snippet <i".ctype." <input type=\"".ctype."\" name=\"".st.et."\" value=\"".st.et."\" ".st.et."/>".st.et
endfor
exec "Snippet <isubmit <input type=\"submit\" value=\"".st.et."\" ".st.et."/>".st.et
exec "Snippet <ireset <input type=\"reset\" value=\"".st.et."\" ".st.et."/>".st.et
exec "Snippet <select <select name=\"".st.et."\">".st.et
exec "Snippet <option <option value=\"".st.et."\">".st.et."</option>".st.et
exec "Snippet <label <label for=\"".st.et."\">".st.et."</label>".st.et

" Normal Tags
exec "Snippet <a <a href=\"".st.et."\">".st.et."</a>".st.et
for ctag in ['div', 'span', 'head', 'title', 'body', 'li', 'ol', 'p', 'dd', 'dl', 'dt', 'tr', 'td', 'h1', 'h2', 'h3', 'h4', 'h5', 'h6', 'tt']
    exec "Snippet <".ctag." <".ctag.">".st.et."</".ctag.">"
    exec "Snippet <".ctag."c <".ctag." class=\"".st.et."\">".st.et."</".ctag.">"
    exec "Snippet <".ctag."i <".ctag." id=\"".st.et."\">".st.et."</".ctag.">"
endfor
exec "Snippet <ul <ul><CR><Tab><li>".st.et."</li><CR><BS></ul>"
exec "Snippet <table <table><CR><Tab><tr><CR><Tab><th>".st.et."</th><CR><td>".st.et."</td><CR><BS></tr><CR><BS></table>".st.et
exec "Snippet <colgroup <colgroup><CR><Tab><col width=\"".st.et."\" /><CR><BS></colgroup>"

exec "Snippet c class=\"".st.et."\"".st.et
exec "Snippet class class=\"".st.et."\"".st.et
exec "Snippet i id=\"".st.et."\"".st.et
exec "Snippet id id=\"".st.et."\"".st.et

exec "Snippet lorem <p>Lorem ipsum dolor sit amet, consectetuer sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet. Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum. Stet clita kasd gubergren, no sea takimata sanctus est Lorem ipsum dolor sit amet.\nDuis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.\nUt wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi.</p>".st.et
