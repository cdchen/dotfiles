"
" Bunt Color Scheme
" =================
"
" author:   Gregor Müllegger <gregor@muellegger.de>
"
set background=dark

hi clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "bunt"


hi Normal       guifg=#d8d8d8   guibg=#101010
hi NonText      guifg=#303030   guibg=#101010
hi SpecialKey   guifg=#303030   guibg=#000000
hi Cursor       guibg=#00ffff   guifg=#000000
hi lCursor      guibg=#ffffff
hi MatchParen   guifg=#ffffff   guibg=#0000ff
hi Visual       guibg=#3f3f3f

" Search
hi Search	guifg=#000000   guibg=#FFDC00
hi IncSearch    guifg=#000000   guibg=#FFDC00   gui=none

" Window Elements
hi StatusLine   guifg=#000000   guibg=#ff8844   gui=bold
hi StatusLineNC guifg=#ffffff   guibg=#4444ff   gui=bold
hi VertSplit    guifg=#222222   guibg=#222222   gui=bold
hi Folded       guifg=#aa4444   guibg=#101010
hi Pmenu        guifg=#BBBBFF   guibg=#444444
hi PmenuSel     guifg=#444444   guibg=#BBBBFF
hi PmenuSbar    guifg=#BBBBFF   guibg=#BBBBFF
hi PmenuThumb   guifg=#202020   guibg=#202020
hi SignColumn   guibg=#111111
hi CursorLine   guibg=#202020
hi LineNr       guifg=#aaaaaa   guibg=#222222
hi FoldColumn   guibg=#222222   guifg=#cccc00

" Tabbar
hi TabLine      guibg=#222222   guifg=#aaaaaa   gui=italic
hi TabLineSel   guibg=#e0e0e0   guifg=#222222   gui=bold
hi TabLineFill  guibg=#000000   guifg=#666666

" Spellchecking
hi SpellCap     guisp=#ffff00

" Specials
hi Todo         guifg=#e50808                   gui=bold
hi Title        guifg=#ffffff                   gui=bold
hi Special      guifg=#fd8900

" Syntax Elements
hi String       guifg=#2f7f49
hi Constant     guifg=#00d200
hi Number       guifg=#4488bb                   gui=NONE
hi Statement    gui=NONE
hi Function     gui=NONE
hi PreProc      guifg=#ff0007                   gui=NONE
hi Comment      guifg=#5A7085 ctermfg=60 gui=italic
hi Type         guifg=#cdcaa9
hi Error        guifg=#ffffff   guibg=#ab0000
hi Identifier   guifg=#ff0086
hi Label        guifg=#ff0086
hi Define       guifg=#ff0000

hi wordUnderCursor guifg=#FF358B gui=NONE guibg=bg

"hi Constant        guifg=#B994FF                                       ctermfg=204
"hi String          guifg=#AEEE00                                       ctermfg=204
hi Number          guifg=#FF358B                                       ctermfg=202
hi Boolean         guifg=#FF358B                                       ctermfg=154
hi Float           guifg=#FF358B                                       ctermfg=138
hi Function        guifg=#B0F010                                       ctermfg=39
hi Statement       guifg=#FF6E0E                                       ctermfg=39
hi Conditional     guifg=#FF6E0E                                       ctermfg=154
hi Operator        guifg=#FF6E0E                                       ctermfg=202
hi Keyword         guifg=#FF6E0E                                       ctermfg=154
hi Define          guifg=#69C3FF                                       ctermfg=154
hi Delimiter       guifg=#69C3FF                                       ctermfg=154
"hi Exception       guifg=#FF6E0E
"hi Include         guifg=#FF6E0E

" Diff
hi DiffAdd      guibg=#1f2f1f
hi DiffChange   guifg=#808080    guibg=#1f1f2f
hi DiffDelete   guifg=#2f1818    guibg=#2f1818
hi DiffText     guifg=#ff2222    guibg=#1f1f2f

" Taglist
hi TagListComment guifg=#008800 guibg=#000000
hi TagListFileName guifg=#8888aa guibg=#444455 gui=bold
"hi TagListTagName guifg=#888888 guibg=#000000
hi TagListTagScope guifg=#448844 guibg=#000000
hi TagListTitle guifg=#8888aa guibg=#000000 gui=bold

" Python Highlighting for python.vim
hi pythonCoding         guifg=#ff0086
hi pythonRun            guifg=#ff0086
hi pythonBuiltinObj     guifg=#56e0e0
hi pythonBuiltinFunc    guifg=#808080
hi pythonExClass        guifg=#f05656
hi pythonTab            guibg=#00001f
hi pythonDocTest        guifg=#50A27C
hi pythonDocTest2       guifg=#3b916a
hi pythonFunction       guifg=#01B0F0
hi pythonClass          guifg=#01B0F0
hi pythonSelf           guifg=#B0F010
hi pythonLongLines      guibg=#442222
"hi pythonSpaceError     guibg=#470000
"hi pythonBorder         guibg=#444444

" JavaScript Highlighting
hi javaScript                   guifg=#ffffff
hi javaScriptRegexpString       guifg=#aa6600
hi javaScriptDocComment         guifg=#44ff44
hi javaScriptCssStyles          guifg=#dd7700
hi javaScriptDomElemFuncs       guifg=#66cd66
hi javaScriptHtmlElemFuncs      guifg=#dd7700
hi javaScriptLabel              guifg=#00bdec   gui=italic
hi javaScriptPrototype          guifg=#00bdec
hi javaScriptConditional        guifg=#ff0007   gui=bold
hi javaScriptRepeat             guifg=#ff0007   gui=bold
hi javaScriptFunction           guifg=#ffff00   gui=bold

" CSS Highlighting
hi cssIdentifier            guifg=#88b068       gui=bold
hi cssBraces                guifg=#666666
hi cssClassName             guifg=#cd77ee       gui=bold
hi cssPseudoClassId         guifg=#88cdcd       gui=bold

" XML Highlighting
hi xmlTag           guifg=#00bdec
hi xmlTagName       guifg=#00bdec
hi xmlEndTag        guifg=#00bdec
hi xmlNamespace     guifg=#00bdec                   gui=underline
hi xmlAttribPunct   guifg=#cccaa9                   gui=bold
hi xmlEqual         guifg=#cccaa9                   gui=bold
hi xmlCdata         guifg=#bf0945                   gui=bold
hi xmlCdataCdata	guifg=#ac1446   guibg=#23010c   gui=none
hi xmlCdataStart	guifg=#bf0945                   gui=bold
hi xmlCdataEnd		guifg=#bf0945                   gui=bold

" HTML Highlighting
hi htmlString       guifg=#aa66ff
hi htmlTag          guifg=#2244dd               gui=bold
hi htmlEndTag       guifg=#2244dd               gui=bold
hi htmlTagName      guifg=#4488ff
hi htmlTagN         guifg=#4488ff
hi htmlArg          guifg=#88aaff
hi htmlSpecialTagName   guifg=#ffff00
hi htmlEvent        guifg=#ffffff

" Django Highlighting
hi djangoTagBlock   guifg=#bf1107      gui=bold
hi djangoVarBlock   guifg=#61ff87   
hi djangoArgument   guifg=#ddaaaa   
hi djangoStatement  guifg=#ff6644      gui=bold
hi djangoComment    guifg=#00d2ff      gui=italic
hi djangoFilter     guifg=#ffa620      gui=italic

" Jinja Highlighting
hi jinjaTagBlock    guifg=#ff0007   guibg=#200000   gui=bold
hi jinjaVarBlock    guifg=#ff0007   guibg=#200000
hi jinjaString      guifg=#0086d2   guibg=#200000
hi jinjaNumber      guifg=#bf0945   guibg=#200000   gui=bold
hi jinjaStatement   guifg=#fb660a   guibg=#200000   gui=bold
hi jinjaComment     guifg=#008800   guibg=#002300   gui=italic
hi jinjaFilter      guifg=#ff0086   guibg=#200000
hi jinjaRaw         guifg=#aaaaaa   guibg=#200000
hi jinjaOperator    guifg=#ffffff   guibg=#200000
hi jinjaVariable    guifg=#92cd35   guibg=#200000
hi jinjaAttribute   guifg=#dd7700   guibg=#200000
hi jinjaSpecial     guifg=#008ffd   guibg=#200000

" ERuby Highlighting (for my eruby.vim)
hi erubyRubyDelim   guifg=#2c8a16                   gui=bold
hi erubyComment     guifg=#4d9b3a                   gui=italic

" Quickfix Files
hi qfFileName       guifg=#aaaaaa                   gui=italic
hi qfSeparator      guifg=#444444
hi qfLineNr         guifg=#ffffff                   gui=bold
hi qfError          guifg=#ff0000
