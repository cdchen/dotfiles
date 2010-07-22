" Rope shortcuts
imap <buffer> <F1> <C-O>:RopeShowDoc<CR>
map <buffer> <F1> :RopeShowDoc<CR>
imap <buffer> <S-F1> <C-O>:RopeShowCalltip<CR>
map <buffer> <S-F1> :RopeShowCalltip<CR>


"
" Taken from http://www.sontek.net/post/Python-with-a-modular-IDE-%28Vim%29.aspx
"

python << EOF
def SetBreakpoint(lib='ipdb'):
    import re
    nLine = int( vim.eval( 'line(".")'))

    strLine = vim.current.line
    strWhite = re.search( '^(\s*)', strLine).group(1)

    vim.current.buffer.append(
       "%(space)simport %(lib)s; %(lib)s.set_trace() %(mark)s Breakpoint %(mark)s" %
         {'lib': lib, 'space':strWhite, 'mark': '#' * 30}, nLine - 1)


def RemoveBreakpoints(lib='ipdb'):
    import re

    nCurrentLine = int( vim.eval( 'line(".")'))

    nLines = []
    nLine = 1
    strSearchLine = 'import %(lib)s; %(lib)s.set_trace()' % {'lib': lib}
    for strLine in vim.current.buffer:
        
        if strLine.lstrip()[:len(strSearchLine)] == strSearchLine:
            nLines.append(nLine)
        nLine += 1
    nLines.reverse()

    for nLine in nLines:
        vim.command( 'normal %dG' % nLine)
        vim.command( 'normal dd')
        if nLine < nCurrentLine:
            nCurrentLine -= 1

    vim.command( 'normal %dG' % nCurrentLine)
EOF

nmap <buffer> <F7> :python SetBreakpoint('ipdb')<CR>
nmap <buffer> <S-F7> :python RemoveBreakpoints('ipdb')<CR>
nmap <buffer> <F8> :python SetBreakpoint('pudb')<CR>
nmap <buffer> <S-F8> :python RemoveBreakpoints('pudb')<CR>
