" Randy's .vimrc
" Inspiration taken from http://mirnazim.org/writings/vim-plugins-i-use/.

" Load pathogen plugin. It manages plugins for me, so I don't have to load them
" manually.
call pathogen#infect()
" Load plugin documentation.
call pathogen#helptags()

" TEXT WRAPPING SETTINGS

" Display long lines on multiple lines on screen. This wraps visually, but
" don't enter newlines.
set wrap
" Break lines only at certain characters (keep words together).
set linebreak
" Don't display $ after every line. This is handy to toggle on temporarily to
" see white space and differentiate tabe from spaces.
set nolist
" Don't hard wrap lines by entering newlines. Set textwidth=72 for emails.
set textwidth=0
set wrapmargin=0

" WHITESPACE SETTINGS

" Use spaces rather than tabs when I press the Tab key.
set expandtab
" Use shiftwidth rather than tabstop when tabbing at the beginning of a line.
" Also makes Backspace delete shiftwidth spaces, rather than one.
set smarttab
" Tabs are 2 spaces wide.
set tabstop=2
" Indentation uses shiftwidth. Pressing Tab uses tabstop.
set shiftwidth=2
" Intelligently set indentation policy based on filetype. If this causes
" problems, just use autoindent and smartindent.
filetype plugin indent on
" If not using the filetype plugin ahead, use this. Auto indent on lines after
" things like '{', and keep current indentation level when opening a new line.
" Note: may cause comments to undo indentation.
"set autoindent
"set smartindent
" Don't automatically open new comment lines when I hit Enter.
autocmd FileType * setlocal formatoptions-=r formatoptions-=o formatoptions+=j

" WINDOW DRESSING SETTINGS

" Enable line numbers.
set nu
" Always show a staus bar on the bottom of the screen.
set laststatus=2
" Show cursor position in the bottom right.
set ruler
" When using Tab to complete a filename, show a pretty list with highlighting.
set wildmenu
" If a file is changed by a different program while vim has it open and vim
" doesn't have unsaved changes, automatically reload the file.
set autoread
" Let `vim -p ...` open more than 10 files.
set tabpagemax=100

" SEARCH SETTINGS

" Search patterns are not case sensitive.
set ignorecase
" If the search string contains a capital letter, override ignorecase and do a
" case-sensitive search.
set smartcase
" When typing a search pattern, don't wait for an enter press before finding
" thr next match. Pressing ESC rather than Enter will return to your starting
" place.
set incsearch
" Highlight all matches when searching. Use ':nohl' to turn it off afterward.
set hlsearch
" Try to keep at least one line above or below the cursor when scrolling.
set scrolloff=1
" Don't let commandT look here.
set wildignore=*/node_modules,*/build,*/vendor,*/dist,*/cache

" COLOR SETTINGS

" Syntax highlighting.
syntax on
" Make comments lighter and bold, rather than DarkBlue, which is much easier
" to read on a black terminal.
"highlight Comment ctermfg=Blue
" Highlight spelling mistakes in red. Enable spell checking with ":set spell".
"highlight SpellBad ctermbg=Red
" Draw a bar at 120 columns so I know when I've gone over.
set colorcolumn=120
" Make that bar gray, showing text foreground as red so it sticks out more.
"highlight ColorColumn ctermbg=235 ctermfg=Red

"highlight Search ctermbg=Yellow

"highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17
"highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17
"highlight DiffChange cterm=bold ctermfg=10 ctermbg=17
"highlight DiffText   cterm=bold ctermfg=10 ctermbg=88
"highlight DiffAdd    cterm=bold ctermbg=LightBlue
"highlight DiffDelete cterm=bold ctermbg=LightBlue
"highlight DiffChange cterm=bold ctermbg=LightBlue
"highlight DiffText   cterm=bold ctermbg=DarkRed

" MISC SETTINGS

" Enable omnicompletion, using a tags file (e.g. ctags). Use ^X^O, then ^N/^P
" to autocomplete function and variable names.
filetype plugin on
set omnifunc=syntaxcomplete#Complete
" This leader key is used in many plugin shortcuts.
let mapleader = ","
" This is necessary because I use fish, which isn't a POSIX shell. Vim needs
" a POSIX shell for some things.
set shell=sh

" GO SETTINGS
" Go packages installed: 
" - github.com/golang/lint/golint
" - github.com/jstemmer/gotags
" - github.com/kisielk/errcheck
" - github.com/nsf/gocode
" - github.com/rogpeppe/godef
" - golang/org/x/cmd/goimports
" - golang/org/x/cmd/gorename
" - golang/org/x/cmd/guru
autocmd FileType go setlocal noexpandtab
au FileType go nnoremap <leader>v :vsp <CR>:exe "GoDef"<CR>

" Better auto-format on save.
let g:go_fmt_command = "goimports"
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
" Show types (:GoInfo)
let g:go_auto_type_info = 1

let g:syntastic_go_checkers = [ 'go', 'golint', 'errcheck' ]

" For gotags.
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

" PLUGIN SETTINGS

" Tagbar plugin settings.
" Map F8 to open Tagbar window and close after a jump.
nmap <F8> :TagbarOpenAutoClose<CR>

" Syntastic plugin settings. Syntastic does realtime syntax checking for a
" wide variety of languages. It will automatically open a bottom pane with
" your syntax mistakes for e.g. Python/C/LaTeX.
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" Run the checks when a file os open.
let g:syntastic_check_on_open = 1
" Don't bother when I save and quit.
let g:syntastic_check_on_wq = 0
" When writing C code, use clang rather than GCC and make sure these
" directories are passed with -I to the compiler. This is reasonably
" BSD-specific, as Linux doesn't use /usr/local.
let g:syntastic_c_compiler = 'clang'
let g:syntastic_c_include_dirs = [ '/usr/local/avr/include', '/usr/include', '/usr/local/include' ]
" If my current directory path includes "uvfirm", use avrgcc. This is for a
" cross-compilation project, so it shouldn't use the default checker.
autocmd FileType c if stridx(expand("%:p"), "uvfirm") > 0 |
        \ let b:syntastic_checkers = ["avrgcc"] | endif

" Rust syntax checking.
let g:syntastic_rust_checkers = ['rustc']

" Fugitive plugin settings.
" Add git branch name to the status line.
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

" Command-T plugin settings.
" Map ,t to launch the file search window.
nmap <leader>t :CommandT<CR>
nmap <leader>p :CtrlP<CR>
" Ignore files in .gitignore.
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Load bundled matchit.vim, which allows '%' to match XML tags, but only if the
" user hasn't installed a newer version manually.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
    runtime! macros/matchit.vim
endif

" YouCompleteMe plugin settings. Disabled because it isn't currently installed.
"let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_server_python_interpreter = '/usr/local/bin/python2.7'

" Testing powerline.
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup



function! GoToNextIndent(inc)
    " Get the cursor current position
    let currentPos = getpos('.')
    let currentLine = currentPos[1]
    let matchIndent = 0

    " Look for a line with the same indent level whithout going out of the buffer
    while !matchIndent && currentLine != line('$') + 1 && currentLine != -1
        let currentLine += a:inc
        let matchIndent = indent(currentLine) == indent('.')
    endwhile

    " If a line is found go to this line
    if (matchIndent)
        let currentPos[1] = currentLine
        call setpos('.', currentPos)
    endif
endfunction
nnoremap ni :call GoToNextIndent(1)<CR>
nnoremap pi :call GoToNextIndent(-1)<CR>
