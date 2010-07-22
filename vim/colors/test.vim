autocmd CursorMoved * exe printf('match pythonFunction /\<%s\>/', expand('<cword>'))
