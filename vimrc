" vim: set foldmarker={{{,}}} foldlevel=0 foldmethod=marker:

"===================================================================================
"  DESCRIPTION:  Enterprise Ready Development Environment
" .__         __
" |__| ______/  |_  _____  ______ ______  ______
" |  |/     \   __\ \__  \ \____ \\____ \/  ___/
" |  |  Y Y  \  |    / __ \|  |_> >  |_> >___ \
" |__|__|_|  /__|   (____  /   __/|   __/____  >
"          \/            \/|__|   |__|       \/
"
"===================================================================================
"
" Set nocompatible {{{1
"-----------------------------------------------------------------------------------
" Use Vim settings, rather then Vi settings. This must be first, because it changes
" other options as a side effect.
"-----------------------------------------------------------------------------------
set nocompatible
" }}}1

" NeoBundle auto-installation and setup {{{1
" Install and configure NeoBundle {{{2
if !1 | finish | endif

if has('vim_starting')
set nocompatible               " Be iMproved
set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')

if !filereadable(neobundle_readme)
    silent !curl https://raw.githubusercontent.com/Shougo/neobundle.vim/master/bin/install.sh | sh
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" }}}2
" Bundles {{{2
NeoBundle 'Shougo/vimproc', {'build': {'mac': 'make -f make_mac.mak', 'unix': 'make -f make_unix.mak'}} " Vimproc to asynchronously run commands (NeoBundle, Unite)
NeoBundle 'Shougo/unite.vim'
" Unite sources
NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload': {'unite_sources': 'colorscheme'}}          " Allows unite to auto switch between colorschemes
NeoBundleLazy 'osyo-manga/unite-fold', {'autoload': {'unite_sources': 'fold'}}                     " Allows unite to get a list of folds in the current buffer
NeoBundleLazy 'Shougo/neomru.vim', {'autoload':{'unite_sources': ['file_mru', 'directory_mru']}}   " Allows unite to create a list of mru files
NeoBundle 'kopischke/unite-spell-suggest'                                                          " Allows spell check to use the unite plugin for finding suggestions
NeoBundle 'Shougo/neocomplete.vim'                                                                 " Auto completion framework. Requires that vim be compiled with lua support
NeoBundle 'davidhalter/jedi-vim'                                                                   " Python autocompletion
NeoBundle 'Raimondi/delimitMate'                                                                   " Auto close quotes, parens, brackets, etc
NeoBundle 'JarrodCTaylor/vim-256-color-schemes'                                                    " A variety of terminal based colorschemes
NeoBundle 'majutsushi/tagbar'                                                                      " Display tags in a buffer ordered by class
NeoBundle 'ervandew/supertab'                                                                      " Use tab for all completions
NeoBundle 'pangloss/vim-javascript'                                                                " Improved indentation and syntax support
NeoBundle 'scrooloose/syntastic'                                                                   " Syntax checking
NeoBundle 'vim-scripts/UltiSnips'                                                                  " Ultimate solution for snippets
NeoBundle 'tpope/vim-commentary'                                                                   " Comment stuff out
NeoBundle 'mhinz/vim-startify'                                                                     " Fancy splash screen
NeoBundle 'tmhedberg/SimpylFold'                                                                   " Fold Python source code
NeoBundle 'JarrodCTaylor/vim-python-test-runner'                                                   " Run Python tests from Vim
NeoBundle 'tpope/vim-surround'                                                                     " Surround objects with all manor of things
NeoBundle 'bling/vim-airline'                                                                      " Pretty up the status line
NeoBundle 'sjl/gundo.vim'                                                                          " Visual undo
NeoBundle 'nelstrom/vim-markdown-folding'                                                          " Does what it says on the tin
NeoBundle 'tpope/vim-markdown'                                                                     " Syntax highlighting for markdown (Perhaps optional with new versions of Vim)
NeoBundle 'justinmk/vim-sneak'                                                                     " Vim motion plugin
NeoBundle 'JarrodCTaylor/vim-shell-executor'                                                       " Execute any code from within vim buffers
NeoBundle 'https://github.com/mattn/emmet-vim/'                                                    " Formally zen coding
NeoBundle 'junegunn/vim-easy-align'                                                                " Simple easy to use alignment plugin
NeoBundle 'kchmck/vim-coffee-script'                                                               " CoffeeScript support syntax, indenting, etc
NeoBundle 'JarrodCTaylor/vim-qunit-special-blend'                                                  " Run qunit tests
NeoBundle 'mustache/vim-mustache-handlebars'                                                       " Handlebars syntax highlighting
NeoBundle 'JarrodCTaylor/vim-js2coffee'                                                            " Convert JS to CoffeeScript and vice versa
NeoBundle 'osyo-manga/vim-over'                                                                    " Visual find and replace
NeoBundle 'groenewege/vim-less'                                                                    " Syntax highlighting for less files
NeoBundle 'Yggdroot/indentLine'                                                                    " Indent guides
NeoBundle 'wellle/targets.vim'                                                                     " Provide additional text objects
NeoBundle 'tpope/vim-fireplace'                                                                    " Clojure REPL support
NeoBundle 'thinca/vim-qfreplace'                                                                   " Easy replace in the quick fix buffer
NeoBundle 'guns/vim-sexp'                                                                          " Precision editing for S-expressions
NeoBundle 'tpope/vim-sexp-mappings-for-regular-people'                                             " Make sexp usable
NeoBundle 'amdt/vim-niji'                                                                          " Rainbow parentheses
NeoBundle 'lukaszkorecki/CoffeeTags'                                                               " Ctags generator for CoffeScript
NeoBundle 'tpope/vim-dispatch'                                                                     " Asynchronous build and test dispatcher
NeoBundle 'takac/vim-hardtime'                                                                     " Muhahahahaha oh their faces. I can taste their tears
NeoBundle '~/imt_dotfiles/vim/my-plugins/vim-grep-quickfix', {'type': 'nosync'}                    " Add grep functionality to the quickfix buffer
NeoBundle '~/imt_dotfiles/vim/my-plugins/vim-wiki-links', {'type': 'nosync'}                       " Add the ability to link between wiki (markdown) files
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'bkad/CamelCaseMotion'
NeoBundle 'Shougo/vimfiler.vim'
" }}}2
" Auto install the plugins {{{2
call neobundle#end()
filetype plugin indent on
NeoBundleCheck
" }}}2
" }}}1

" General Settings {{{1
" File Type Detection {{{2
"-----------------------------------------------------------------------------------
" Enable file type detection. Use the default filetype settings.
" Load indent files, to automatically do language-dependent indenting.
"-----------------------------------------------------------------------------------
filetype  plugin on
filetype  indent on
" }}}2
" Color scheme {{{2
"-----------------------------------------------------------------------------------
set t_Co=256
colorscheme pop-rocks
" }}}2
" Switch syntax highlighting on. {{{2
"-----------------------------------------------------------------------------------
syntax on
" }}}2
" Various settings {{{2
"-----------------------------------------------------------------------------------
set autoindent                         " Copy indent from current line
set autoread                           " Read open files again when changed outside Vim
set autowrite                          " Write a modified buffer on each :next , ...
set backspace=indent,eol,start         " Backspacing over everything in insert mode
set history=200                        " Keep 200 lines of command line history
set incsearch                          " Do incremental searching
set ignorecase                         " Ignore case when searching....
set smartcase                          " ...unless uppercase letter are used
set hlsearch                           " Highlight the last used search pattern
set list                               " Toggle manually with set list / set nolist or set list!
set listchars=""                       " Empty the listchars
set listchars=tab:>.                   " A tab will be displayed as >...
"set listchars+=trail:.                 " Trailing white spaces will be displayed as .
set nobackup                           " Don't constantly write backup files
set noswapfile                         " Ain't nobody got time for swap files
set noerrorbells                       " Don't beep
set nowrap                             " Do not wrap lines
set showbreak=↪\                       " Character to precede line wraps for the times I turn it on
set popt=left:8pc,right:3pc            " Print options
set shiftwidth=4                       " Number of spaces to use for each step of indent
set showcmd                            " Display incomplete commands in the bottom line of the screen
set tabstop=4                          " Number of spaces that a <Tab> counts for
set expandtab                          " Make vim use spaces and not tabs
set undolevels=1000                    " Never can be too careful when it comes to undoing
set hidden                             " Don't unload the buffer when we switch between them. Saves undo history
set visualbell                         " Visual bell instead of beeping
set wildignore=*.swp,*.bak,*.pyc,*.class,node_modules/**  " wildmenu: ignore these extensions
set wildmenu                           " Command-line completion in an enhanced mode
set shell=bash                         " Required to let zsh know how to run things on command line
set ttimeoutlen=50                     " Fix delay when escaping from insert with Esc
set noshowmode                         " Hide the default mode text (e.g. -- INSERT -- below the statusline)
set synmaxcol=256                      " Don't syntax highlight long lines
set nosol                              " Keep cursor in the same column if possible for G, gg, etc.
" }}}2
" Minimal number of screen lines to keep above and below the cursor {{{2
"-----------------------------------------------------------------------------------
set scrolloff=3
" }}}2
" Treat JSON files like JavaScript {{{2
"-----------------------------------------------------------------------------------
au BufNewFile,BufRead *.json set ft=javascript
" }}}2
" Last cursor position {{{2
"-----------------------------------------------------------------------------------
" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
"-----------------------------------------------------------------------------------
if has("autocmd")
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif
" }}}2
" Abbreviations {{{2
"-----------------------------------------------------------------------------------
:iabbr teh the
:iabbr condole console
" }}}2
" Make arrowkey resize viewports {{{2
"-----------------------------------------------------------------------------------
nnoremap <Left> :vertical resize +1<CR>
nnoremap <Right> :vertical resize -1<CR>
nnoremap <Up> :resize +1<CR>
nnoremap <Down> :resize -1<CR>
nnoremap <C-w><Right> :exe "vertical resize +" . (winwidth(0) * 1/2)<CR>
nnoremap <C-w><Left> :exe "vertical resize -" . (winwidth(0) * 1/2)<CR>
nnoremap <C-w><Up> :exe "resize +" . (winheight(0) * 1/2)<CR>
nnoremap <C-w><Down> :exe "resize -" . (winheight(0) * 1/2)<CR>
" }}}2
" }}}1

" Status line {{{1
"-----------------------------------------------------------------------------------
set laststatus=2                                    " Make the second to last line of vim our status line
let g:airline_theme='understated'                   " Use the custom theme I wrote
let g:airline_left_sep=''                           " No separator as they seem to look funky
let g:airline_right_sep=''                          " No separator as they seem to look funky
let g:airline#extensions#branch#enabled = 0         " Do not show the git branch in the status line
let g:airline#extensions#syntastic#enabled = 1      " Do show syntastic warnings in the status line
let g:airline#extensions#tabline#show_buffers = 0   " Do not list buffers in the status line
let g:airline_section_b = ''                        " Do not show git hunks or branch
let g:airline_section_x = ''                        " Do not list the filetype or virtualenv in the status line
let g:airline_section_y = '[TYPE=%Y] [Format=%{&ff}] [ASCII=%03.3b] [HEX=%02.2B] [R%04l,C%04v] [LEN=%L]'  " Replace file encoding and file format info with file position
"let g:airline_section_y = '[R%04l,C%04v] [LEN=%L]'  " Replace file encoding and file format info with file position
let g:airline_section_z = ''                        " Do not show the default file position info
" }}}1

" Key mappings {{{1
" Key Bindings For The Others (Everyone who is not Jarrod) AT IMT {{{2
"===================================================================================
let mapleader=" "
nnoremap j gj
nnoremap k gk
nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>- :split<CR>
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap <Leader>a :Search<CR>
nnoremap <Leader><ESC> :nohlsearch<CR>
nnoremap <Leader>ff :Unite file file_rec/async -start-insert -buffer-name=files -winheight=18<CR>
nnoremap <Leader>fb :Unite buffer<CR>
nnoremap <Leader>d :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit<CR>
nnoremap <Leader>nt :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -no-quit -find<CR>
autocmd FileType vimfiler nunmap <buffer> x
autocmd FileType vimfiler nmap <buffer> x <Plug>(vimfiler_toggle_mark_current_line)
autocmd FileType vimfiler vmap <buffer> x <Plug>(vimfiler_toggle_mark_selected_lines)
map <Leader>tw :DjangoTestApp<CR>
map <Leader>tf :DjangoTestFile<CR>
map <Leader>tc :DjangoTestClass<CR>
map <Leader>tm :DjangoTestMethod<CR>
nnoremap <Leader>y :Unite history/yank<CR><Esc>
nnoremap <Leader>ww :WrapWith<CR>
nnoremap <Leader>eb :ExecuteBuffer<CR>
vnoremap <Leader>es :ExecuteSelection<CR>
map<Leader>nf :NosetestFile<CR>
map<Leader>nc :NosetestClass<CR>
map<Leader>nm :NosetestMethod<CR>
nnoremap<Leader>ta :RerunLastTests<CR>
nmap <Leader><Leader> <c-^>
nnoremap <Leader>q :call QuickfixToggle()<CR>
nnoremap <Leader>ed :vsplit $MYVIMRC<CR>
let g:EasyMotion_leader_key = '<Space>l'
nnoremap <Leader>j :call MyJumpTo()<CR>
nnoremap <Leader>th :HardTimeToggle<CR>
map <Leader>rf :call RenameFile()<CR>
map <Leader>cf :call CopyFile()<CR>
nnoremap <Leader>ri :call RenewTagsFile()<CR>
nnoremap <Leader>y :Unite history/yank<CR><Esc>
nnoremap<Leader>tn :set relativenumber!<CR>
nmap<Leader>s ysiw
nnoremap<Leader>u :GundoToggle<CR>
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>
nnoremap <Leader>us :call MakeUnderscore()<CR>
autocmd BufReadPost quickfix nnoremap <buffer> <Space>g :GrepQuickfix<CR>
autocmd BufReadPost quickfix nnoremap <buffer> <Space>v :GrepQuickfixV<CR>
autocmd BufReadPost quickfix nnoremap <buffer> <Space>r :QuickfixRestore<CR>
" --- Strip trailing whitespace
nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>
inoremap <F10> <C-R>=(Ulti_ExpandOrJump_and_getRes() > 0)?"":IMAP_Jumpfunc('', 0)<CR>
nnoremap <F9> :UltiSnipsEdit<CR>

function! TestVector()
    let g:test_commad = '!python src/manage.py test test ' . expand('%:p')
    exe g:test_commad
endfunction
nmap<Leader>tv :call TestVector()<CR>

function! RetestVector()
    exe g:test_commad
endfunction
nmap<Leader>rv :call RetestVector()<CR>

nmap <Leader>tm :call InvokeTestMethodByType()<CR>
function! InvokeTestMethodByType()
    let filetype=&ft
    if filetype == 'python'
        exe ':DjangoTestMethod'
    else
        exe ':RunSingleQunitTest'
    endif
endfunction

nmap <Leader>tc :call InvokeTestClassByType()<CR>
function! InvokeTestClassByType()
    let filetype=&ft
    if filetype == 'python'
        exe ':DjangoTestClass'
    else
        exe ':RunSingleQunitModule'
    endif
endfunction

nmap <Leader>tf :call InvokeTestFileByType()<CR>
function! InvokeTestFileByType()
    let filetype=&ft
    if filetype == 'python'
        exe ':DjangoTestFile'
    else
        exe ':RunAllQunitTests'
    endif
endfunction
" }}}2
" Jarrod's Remapped Keys {{{2
" Notes {{{3
"===================================================================================
"  (nore) prefix -- non-recursive
"  (un)   prefix -- Remove a mode-specific map
"  Commands                        Mode
"  --------                        ----
"  map                             Normal, Visual, Select, Operator Pending modes
"  nmap, nnoremap, nunmap          Normal mode
"  imap, inoremap, iunmap          Insert and Replace mode
"  vmap, vnoremap, vunmap          Visual and Select mode
"  xmap, xnoremap, xunmap          Visual mode
"  smap, snoremap, sunmap          Select mode
"  cmap, cnoremap, cunmap          Command-line mode
"  omap, onoremap, ounmap          Operator pending mode
"===================================================================================
" }}}3
" Key mappings {{{3
let mapleader="9"
let maplocalleader= '|'
map ss :setlocal spell!<CR>
map z= :Unite spell_suggest<CR><ESC>
nnoremap <Leader>tb :TagbarToggle<CR>
nnoremap <Leader>\ :vsplit<CR>
nnoremap <Leader>- :split<CR>
nnoremap <Leader>a :Search<CR>
nnoremap <Leader>ff :Unite file file_rec/async -start-insert -buffer-name=files -winheight=18<CR>
nnoremap <Leader>b :Unite buffer<CR>
nnoremap <Leader>ts :SyntasticToggleMode<CR>
nnoremap <Leader><ESC> :nohlsearch<CR>
nnoremap <Leader>rt :call RenewTagsFile()<CR>
nnoremap <Leader>us :call MakeUnderscore()<CR>
nnoremap <Leader>da :DjangoTestApp<CR>
nnoremap <Leader>df :DjangoTestFile<CR>
nnoremap <Leader>dc :DjangoTestClass<CR>
nnoremap <Leader>dm :DjangoTestMethod<CR>
nnoremap <Leader>nf :NosetestFile<CR>
nnoremap <Leader>nc :NosetestClass<CR>
nnoremap <Leader>nm :NosetestMethod<CR>
nnoremap <Leader>rr :RerunLastTests<CR>
nnoremap <Leader>tn :set relativenumber!<CR>:set number!<CR>
nnoremap <Leader>ud :GundoToggle<CR>
nnoremap <Leader>tc :call ToggleTodoCheckbox()<CR>
nnoremap <Leader>q :call QuickfixToggle()<CR>
nnoremap <Leader>eb :ExecuteBuffer<CR>
vnoremap <Leader>es :ExecuteSelection<CR>
nnoremap <Leader>ja :RunAllQunitTests<CR>
nnoremap <Leader>jt :RunSingleQunitTest<CR>
nnoremap <Leader>js :RunSingleAsyncQunitTest<CR>
nnoremap <Leader>jm :RunSingleQunitModule<CR>
nnoremap <Leader>ww :WrapWith<CR>
nnoremap <Leader>fr :call VisualFindAndReplace()<CR>
xnoremap <Leader>fr :call VisualFindAndReplaceWithSelection()<CR>
nnoremap <Leader>ev :vsplit $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <Leader>sc :!aspell -c %<CR>
nnoremap <leader>h :%!xxd<CR>
nnoremap <Leader>gt :call MyJumpTo()<CR>
nnoremap <Leader>th :HardTimeToggle<CR>
inoremap <Leader>c <C-x><C-o>
nmap <Leader>em :call EditMacro()<CR> <Plug>em
" --- Select tag if more than one option exists else jump to tag
nnoremap <Leader>st g<C-]>
" --- Shortcuts for quickfix as it was broken for some reason
autocmd BufReadPost quickfix nnoremap <buffer> <CR> :.cc<CR>
autocmd BufReadPost quickfix nnoremap <buffer> o :.cc<CR>
" --- Strip trailing whitespace
nnoremap <Leader>W :%s/\s\+$//<CR>:let @/=''<CR>
" --- Save changes to a readonly file with sudo
cmap w!! w !sudo tee %
" }}}3
" }}}2
"  }}}1

" Plugin Configurations {{{1
" Syntastic configurations use :help syntastic.txt {{{2
"-----------------------------------------------------------------------------------
let g:syntastic_check_on_open=1                   " check for errors when file is loaded
let g:syntastic_loc_list_height=5                 " the height of the error list defaults to 10
let g:syntastic_python_checkers = ['flake8']      " sets flake8 as the default for checking python files
let g:syntastic_javascript_checkers = ['jshint']  " sets jshint as our javascript linter
" Disable syntastic in html files because it pretty well blows there
let g:syntastic_mode_map={ 'mode': 'active',
                     \ 'active_filetypes': [],
                     \ 'passive_filetypes': ['html', 'handlebars'] }
let g:syntastic_coffee_coffeelint_args="--csv --file ~/coffeelint.json"
" }}}2
" UltiSnips configurations {{{2
"-----------------------------------------------------------------------------------
let g:UltiSnipsSnippetDirectories=["UltiSnips"]
let g:UltiSnipsExpandTrigger="<Leader><Tab>"
let g:UltiSnipsJumpForwardTrigger="<Leader><Tab>"
let g:UltiSnipsEditSplit="vertical"
nnoremap <Leader>ue :UltiSnipsEdit<CR>
" }}}2
" Neocomplete {{{2
"-----------------------------------------------------------------------------------
let g:neocomplete#enable_at_startup = 1
let g:jedi#auto_vim_configuration = 0

" To make compatible with jedi
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.python='[^. \t]\.\w*'
let g:neocomplete#force_overwrite_completefunc = 1
let g:neocomplete#auto_completion_start_length = 99
set completeopt-=preview

let g:neocomplete#enable_smart_case = 1
" This refresh may be too heavy weight!!
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#max_list = 30
" let g:neocomplete#min_keyword_length = 1
" let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#data_directory = $HOME.'/.vim/tmp/neocomplete'

" disable the auto select feature by default to speed up writing without obstacles (is optimal for certain situations)
let g:neocomplete#enable_auto_select = 0

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" }}}2
" Exuberant ctags configurations {{{2
"-----------------------------------------------------------------------------------
" Vim will look for a ctags file in the current directory and continue
" up the file path until it finds one
"-----------------------------------------------------------------------------------
" Enable ctags support
set tags=./.ctags,.ctags;
" }}}2
" Jedi configurations {{{2
"-----------------------------------------------------------------------------------
let g:jedi#use_tabs_not_buffers = 0     " Use buffers not tabs
let g:jedi#popup_on_dot = 0
" }}}2
" Startify configurations {{{2
"-----------------------------------------------------------------------------------
" Highlight the acsii banner with red font
hi StartifyHeader ctermfg=124
" Don't change the directory when opening a recent file with a shortcut
let g:startify_change_to_dir = 0
" Set the contents of the banner
let g:startify_custom_header = [
            \ '               AAAAAAAA       PPPPPPPPPPPPP      PPPPPPPPPPPPP        SSSSSSSSSS     ',
            \ '              AAAAAAAAA       PPPPPPPPPPPPPPPP   PPPPPPPPPPPPPPPP   SSSSSSSSSSSSSS   ',
            \ '             AAAAAAAAAA       PPPPPPPPPPPPPPPPP PPPPPPPPPPPPPPPPPP SSSSSS   SSSSSSS  ',
            \ '                                          PPPPP              PPPPP                   ',
            \ '                                          PPPPP              PPPPP                   ',
            \ '                                         PPPPPP             PPPPPP                   ',
            \ '          AAAAAAAAAAAAAA    PPPPPPPPPPPPPPPPPP PPPPPPPPPPPPPPPPPP    SSSSSSSSSSSSS   ',
            \ '         AAAAAAAAAAAAAAA    PPPPPPPPPPPPPPPPP  PPPPPPPPPPPPPPPPP        SSSSSSSSSSS  ',
            \ '        AAAAAA     AAAAAA   PPPPPP             PPPPPP            SSSSS      SSSSSSS  ',
            \ '       AAAAAA      AAAAAA  PPPPPPP            PPPPPPP            SSSSSS     SSSSSSS  ',
            \ '      AAAAAA       AAAAAA  PPPPPPP            PPPPPPP             SSSSSSSSSSSSSSSS   ',
            \ '     AAAAAA        AAAAAAA PPPPPPP            PPPPPPP               SSSSSSSSSSSS     ',
            \ '    AAAAAAA        AAAAAAAAPPPPPPP            PPPPPPP                  SSSSSS        ',
            \ '                                                                                     ',
            \ '    ===============================================================================  ',
            \ '    ===============================================================================  ',
            \ '',
            \]
" List recently used files using viminfo.
let g:startify_show_files = 1
" The number of files to list.
let g:startify_show_files_number = 10
" A list of files to bookmark. Always shown
let g:startify_bookmarks = [ '~/.vimrc' ]
" }}}2
" SuperTab {{{2
"-----------------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "<c-n>"
" }}}2
" Gundo {{{2
"-----------------------------------------------------------------------------------
let g:gundo_preview_bottom = 1
" }}}2
" Vim-Markdown-Folding {{{2
"-----------------------------------------------------------------------------------
let g:markdown_fold_style = 'nested'
" }}}2
" Vim-Markdown {{{2
"-----------------------------------------------------------------------------------
let g:markdown_fenced_languages = ['python', 'sh', 'vim', 'javascript', 'html', 'css', 'c', 'sql']
"}}}2
" Vim-sneak {{{2
"-----------------------------------------------------------------------------------
" Replace the default f command
nmap f <Plug>SneakForward
nmap F <Plug>SneakBackward
let g:sneak#streak = 1
" We need 52 characters for this
let g:sneak#target_labels = "sfgkqwetyupzvbnmSDFGHJKLQWERTYUPZXCVBNM1234567890rxc"
"}}}2
" Emmet Vim {{{2
"-----------------------------------------------------------------------------------
" Enable just in html files
let g:user_emmet_install_global = 0
let g:user_emmet_leader_key=','
autocmd FileType html,htmldjango,handlebars,html.handlebars EmmetInstall
"}}}2
" Easy Align {{{2
"-----------------------------------------------------------------------------------
" Start interactive EasyAlign in visual mode
vmap <Enter> <Plug>(EasyAlign)
"}}}2
" Handlebars {{{2
"-----------------------------------------------------------------------------------
" Enable handlebars shortcuts
let g:mustache_abbreviations = 1
" }}}2
" Indent Lines {{{2
"-------------------------------------------------------------------------
nnoremap <Leader>ig :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '¦' "'┊'
let g:indentLine_color_term = 239
let g:indentLine_bufNameExclude = ['_.*', 'start*']
let g:indentLine_fileTypeExclude = ['text']
" }}}2
" Rainbow Parentheses (niji) settings {{{2
"-------------------------------------------------------------------------
" Color pairs are ctermfg, guifg
let g:niji_dark_colours = [
    \ [32 , 66],
    \ [209, 66],
    \ [86 , 66],
    \ [18 , 66],
    \ [154, 66],
    \ [58 , 66],
    \ [166, 66],
    \ [34,  66],
    \ [191, 66],
    \ [57,  66],
    \ [161, 66],
    \ [48,  66],
    \ [208, 66],
    \ [33,  66],
    \ [197, 66],
    \ [49,  66],
    \ ]
nnoremap <Leader>rc :call niji#highlight()<CR>
" }}}2
" CamelCaseMotion {{{2
"-----------------------------------------------------------------------------------
map <silent> W <Plug>CamelCaseMotion_w
map <silent> E <Plug>CamelCaseMotion_e
map <silent> B <Plug>CamelCaseMotion_b
omap <silent> iW <Plug>CamelCaseMotion_iw
xmap <silent> iW <Plug>CamelCaseMotion_iw
omap <silent> iE <Plug>CamelCaseMotion_ie
xmap <silent> iE <Plug>CamelCaseMotion_ie
omap <silent> iB <Plug>CamelCaseMotion_ib
xmap <silent> iB <Plug>CamelCaseMotion_ib
" }}}2
" HardTime {{{2
"-------------------------------------------------------------------------
let g:list_of_normal_keys = ["h", "j", "k", "l", "W", "w", "B", "b", "x"]
let g:hardtime_ignore_buffer_patterns = ["vimrc", ".*markdown", ".*md"]
let g:hardtime_maxcount = 4
let g:hardtime_ignore_quickfix = 1
let g:hardtime_default_on = 1
" }}}2
" Unite {{{2
"-------------------------------------------------------------------------
" Unite global variables and general settings {{{3
let g:unite_enable_start_insert = 1
let g:unite_split_rule = 'botright'
let g:unite_force_overwrite_statusline = 0
let g:unite_winheight = 15
let g:unite_source_history_yank_enable = 1
let g:unite_prompt = '──➤  '
let g:unite_update_time = 200
"let g:unite_source_rec_max_cache_files = 0 " The default is 20000
let g:unite_data_directory = $HOME.'/.vim/tmp/unite'
let g:unite_source_buffer_time_format = '(%m-%d-%Y %H:%M:%S) '
let g:unite_source_file_mru_time_format = '(%m-%d-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%m-%d-%Y %H:%M:%S) '
let g:unite_source_rec_async_command= 'ag --nocolor --nogroup -g ""'
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
" }}}3
" Unite autocmd FileType settings {{{3
autocmd FileType unite call s:unite_buffer_settings()

function! s:unite_buffer_settings()
  let b:SuperTabDisabled=1
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
  imap <silent><buffer><expr> <C-x> unite#do_action('split')
  imap <silent><buffer><expr> <C-v> unite#do_action('vsplit')
  imap <silent><buffer><expr> <C-t> unite#do_action('tabopen')
  nmap <buffer> <ESC> <Plug>(unite_exit)
endfunction
" }}}3
" Unite Key Mappings {{{3
nnoremap <Leader>m :Unite file_mru<CR>
" filter buffer for search term
nnoremap <Leader>sb :Unite line<CR>
nnoremap <Leader>y :Unite history/yank<CR><Esc>
nnoremap <Leader>sf :Unite fold<CR>
nnoremap <Leader>sj :Unite jump<CR><Esc>
nnoremap <LocalLeader>c :Unite colorscheme -auto-preview<CR>
nnoremap <Leader>nu :<C-u>Unite neobundle/update -log -vertical -auto-quit<CR>
" }}}3
" Unite Menus {{{3
" Setup Unit Menu {{{4
let g:unite_source_menu_menus = {}
nnoremap [menu] <Nop>
" menu prefix key (for all Unite menus)
nmap <LocalLeader> [menu]
" }}}4
" Menus {{{4
nnoremap <silent>[menu]u :Unite -silent -winheight=20 menu<CR><Esc>
" Keyboard Shortcuts For 9 leader {{{5
let g:unite_source_menu_menus.9LeaderKeyMaps = {'description': 'Custom mapped keyboard shortcuts with 9 leader               |9'}
let g:unite_source_menu_menus.9LeaderKeyMaps.command_candidates = [
    \['➤ Buffer list                                                   9b', 'Unite buffer'],
    \['➤ Choose colorscheme                                            |c', 'Unite colorscheme -auto-preview'],
    \['➤ Edit UltiSnips snippet file                                  9ue', 'normal 9ue'],
    \['➤ Edit configuration file (vimrc)                              9ev', 'edit $MYVIMRC'],
    \['➤ Edit macro contents in specific register                     9em', 'normal 9em'],
    \['➤ Enter paste mode [exit with <Esc>]                            yp', 'normal yp'],
    \['➤ Execute current buffer                                       9eb', 'ExecuteBuffer'],
    \['➤ Execute surrent selection                                    9es', 'ExecuteSelection'],
    \['➤ Find files,                                                  9ff', 'normal 9ff'],
    \['➤ Get Hex dump of binary file buffer                            9h', 'normal 9h'],
    \['➤ Grep in Quickfix buffer                                       9g', 'echo "Use 9g to grep within the Quickfix buffer"'],
    \['➤ Increment visually selected column of numbers              <C-a>', 'echo "Use <C-a>"'],
    \['➤ Jump to ctag or word under the cursor                        9gt', 'normal 9gt'],
    \['➤ Jump to next UltiSnip edit point                          9<Tab>', 'echo "Use 9<Tab> to jump to the next editable snippet segment"'],
    \['➤ Jumps to next bad spell word                                  ]s', 'normal ]s'],
    \['➤ Most recently used files                                      9m', 'Unite file_mru'],
    \['➤ New horizontal split                                          9-', 'split'],
    \['➤ New vertical split                                            9\', 'vsplit'],
    \['➤ Open Vimfiler focused in current directory                   9vs', 'echo "User 9vs"'],
    \['➤ Toggle Vimfiler                                              9vf', 'echo "Use 9vf"'],
    \['➤ Recolor the rainbow parentheses after sneak                  9rc', 'call VisualFindAndReplaceWithSelection()'],
    \['➤ Refresh Ctags                                                9rt', 'call RenewTagsFile()'],
    \['➤ Remove trailing whitespaces                                   9W', 'normal 9W'],
    \['➤ Rerun last Python test                                       9rr', 'RerunLastTests'],
    \['➤ Resize windows                                        Arrow keys', 'echo "Use the arrow keys to resize windows"'],
    \['➤ Restore the Quickfix buffer                                   9r', 'echo "Use 9r to restore the Quickfix buffer"'],
    \['➤ Reverse Grep in Quickfix buffer                               9v', 'echo "Use 9v to reverse grep within the Quickfix buffer"'],
    \['➤ Save as root                                                :w!!', 'exe "write !sudo tee % >/dev/null"'],
    \['➤ Search                                                        9a', 'echo "Use 9a to start the search prompt"'],
    \['➤ Search folds                                                 9sf', 'Unite fold'],
    \['➤ Search jumps                                                 9sj', 'Unite jump'],
    \['➤ Search lines in the current buffer                           9sb', 'Unite line'],
    \['➤ Select tag if more than one else jump to tag                 9st', 'normal 9st'],
    \['➤ Source vim configuration file (vimrc)                        9sv', 'normal 9sv'],
    \['➤ Spell check entire file with aspell                          9sc', 'normal 9sc'],
    \['➤ Suggest correctly spelled word                                z=', 'normal z='],
    \['➤ Test Django app                                              9da', 'echo "Use 9da"'],
    \['➤ Test Django class                                            9dc', 'echo "Use 9dc"'],
    \['➤ Test Django file                                             9df', 'echo "Use 9df"'],
    \['➤ Test Django method                                           9dm', 'echo "Use 9dm"'],
    \['➤ Test JavaScript all tests (Qunit)                            9ja', 'echo "Use 9ja"'],
    \['➤ Test JavaScript single asyncTest (Qunit)                     9js', 'echo "Use 9js"'],
    \['➤ Test JavaScript single method (Qunit)                        9jm', 'echo "Use 9jm"'],
    \['➤ Test JavaScript single test (Qunit)                          9jt', 'echo "Use 9jt"'],
    \['➤ Test Python class with Nose                                  9nc', 'echo "Use 9nc"'],
    \['➤ Test Python file with Nose                                   9nf', 'echo "Use 9nf"'],
    \['➤ Test Python method with Nose                                 9nm', 'echo "Use 9nm"'],
    \['➤ Toggle Syntastic                                             9ts', 'SyntasticToggleMode'],
    \['➤ Toggle Tagbar                                                9tb', 'TagbarToggle'],
    \['➤ Toggle checkbox                                              9tc', 'normal 9tc'],
    \['➤ Toggle hard mode                                             9th', 'normal 9th'],
    \['➤ Toggle indentation guildes                                   9ig', 'normal 9ig'],
    \['➤ Toggle line numbers                                          9tn', 'normal 9tn'],
    \['➤ Toggle quickfix                                               9q', 'call QuickfixToggle()'],
    \['➤ Toggle spell checking                                         ss', 'setlocal spell!'],
    \['➤ Toggle visual undo tree                                      9ud', 'GundoToggle'],
    \['➤ Trigger UltiSnip snippet expansion                        9<Tab>', 'echo "Use 9<Tab> to expand a snippet"'],
    \['➤ Turn off search highlighting                              9<ESC>', 'nohlsearch'],
    \['➤ Undersocre Python test name                                  9us', 'normal 9us'],
    \['➤ Update Neobundle packages                                    9nu', 'normal 9nu'],
    \['➤ Vim built in auto completion in inset mode                    9c', 'echo "Use 9c in insert mode to trigger the auto completion"'],
    \['➤ Visual find and replace over full file                       9fr', 'call VisualFindAndReplace()'],
    \['➤ Visual find and replace over visual selection                9fr', 'call VisualFindAndReplaceWithSelection()'],
    \['➤ Wrap word under cursor with method                           9ww', 'normal 9ww'],
    \['➤ Yank history                                                  9y', 'Unite history/yank'],
    \]
nnoremap <silent>[menu]9 :Unite -silent -winheight=17 -start-insert menu:9LeaderKeyMaps<CR>
" }}}5
" Keyboard Shortcuts For <Space> leader {{{5
let g:unite_source_menu_menus.SpaceLeaderKeyMaps = {'description': 'Custom mapped keyboard shortcuts with <Space> leader     |<Space>'}
let g:unite_source_menu_menus.SpaceLeaderKeyMaps.command_candidates = [
    \['➤ Search                                                  <Space>a', 'echo "Use <Space>a to start the search prompt"'],
    \['➤ Activate EasyMotion                                     <Space>l', 'echo "Press Space l"'],
    \['➤ Buffer list                                            <Space>fb', 'normal 9b'],
    \['➤ Choose colorscheme                                            |c', 'Unite colorscheme -auto-preview'],
    \['➤ Edit UltiSnips snippet file                                 <F9>', 'normal 9ue'],
    \['➤ Edit configuration file (vimrc)                        <Space>ev', 'edit $MYVIMRC'],
    \['➤ Execute Current Buffer                                 <Space>eb', 'ExecuteBuffer'],
    \['➤ Execute Current Selection                              <Space>es', 'ExecuteSelection'],
    \['➤ Find files,                                            <Space>ff', 'normal 9ff'],
    \['➤ Grep in Quickfix buffer                                 <Space>g', 'echo "Use <Space>g to grep within the Quickfix buffer"'],
    \['➤ Increment visually selected column of numbers              <C-a>', 'echo "Use <C-a>"'],
    \['➤ Jump to ctag or word under the cursor                   <Space>j', 'normal 9gt'],
    \['➤ Jump to next UltiSnip edit point                           <F10>', 'echo "Use <F10> to jump to the next editable snippet segment"'],
    \['➤ New horizontal split                                    <Space>-', 'split'],
    \['➤ New vertical split                                      <Space>\', 'vsplit'],
    \['➤ Open Vilfiler focused in current directory             <Space>nt', 'echo "Use <Space>nt"'],
    \['➤ Refresh Ctags                                          <Space>ri', 'call RenewTagsFile()'],
    \['➤ Remove trailing whitespaces                             <Space>W', 'normal 9W'],
    \['➤ Rerun Last Python Test                                 <Space>ta', 'RerunLastTests'],
    \['➤ Rerun Last Vector test file                            <Space>rv', 'echo "Use <Space>rv to rerun the last vector test file"'],
    \['➤ Resize windows                                        Arrow keys', 'echo "Use the arrow keys to resize windows"'],
    \['➤ Restore the Quickfix buffer                             <Space>r', 'echo "Use <Space>r to restore the Quickfix buffer"'],
    \['➤ Reverse Grep in Quickfix buffer                         <Space>v', 'echo "Use <Space>v to reverse grep within the Quickfix buffer"'],
    \['➤ Run all Qunit tests                                    <Space>tf', 'echo "Use <Space>tf to run all the Qunit tests for current project"'],
    \['➤ Save as root                                                :w!!', 'exe "write !sudo tee % >/dev/null"'],
    \['➤ Surround the word with a punctuation mark               <space>s', 'normal ysiw'],
    \['➤ Switch buffer to last active                      <Space><Space>', 'echo "Use Space Space"'],
    \['➤ Test Django App                                        <Space>tw', 'echo "Use <Space>tw"'],
    \['➤ Test Django Class                                      <Space>tc', 'echo "Use <Space>tc"'],
    \['➤ Test Django File                                       <Space>tf', 'echo "Use <Space>tf"'],
    \['➤ Test Django Method                                     <Space>tm', 'echo "Use <Space>tm"'],
    \['➤ Test Python Class with Nose                            <Space>nc', 'echo "Use <Space>nc"'],
    \['➤ Test Python File with Nose                             <Space>nf', 'echo "Use <Space>nf"'],
    \['➤ Test Python Method with Nose                           <Space>nm', 'echo "Use <Space>nm"'],
    \['➤ Test Qunit Module                                      <Space>tc', 'echo "Use <Space>tc"'],
    \['➤ Test Qunit Singled                                     <Space>tm', 'echo "Use <Space>tm"'],
    \['➤ Test Vector file                                       <Space>tv', 'echo "Use <Space>tv"'],
    \['➤ Toggle Vimfiler (open/close)                            <Space>d', 'echo "Use <Space>d"'],
    \['➤ Toggle Tagbar                                          <Space>tb', 'TagbarToggle'],
    \['➤ Toggle hard mode                                       <Space>th', 'normal 9th'],
    \['➤ Toggle line numbers                                    <Space>tn', 'normal 9tn'],
    \['➤ Toggle quickfix                                         <Space>q', 'call QuickfixToggle()'],
    \['➤ Toggle spell checking                                  <Space>sp', 'setlocal spell!'],
    \['➤ Toggle visual undo tree                                 <Space>u', 'GundoToggle'],
    \['➤ Trigger UltiSnip snippet expansion                         <F10>', 'echo "Use <F10> to expand a snippet"'],
    \['➤ Turn off search highlighting                        <Space><ESC>', 'nohlsearch'],
    \['➤ Undersocre Python test name                            <Space>us', 'normal 9us'],
    \['➤ Visual find and replace over full file                 <Space>fr', 'call VisualFindAndReplace()'],
    \['➤ Visual find and replace over visual selection          <Space>fr', 'call VisualFindAndReplaceWithSelection()'],
    \['➤ Wrap word under cursor with method                     <Space>ww', 'normal 9ww'],
    \['➤ Yank history                                            <Space>y', 'Unite history/yank'],
    \]
nnoremap <silent>[menu]<Space> :Unite -silent -winheight=17 -start-insert menu:SpaceLeaderKeyMaps<CR>
" }}}5
" Plugin Keyboard Shortcuts {{{5
let g:unite_source_menu_menus.PluginKeyMaps = {'description': 'Keyboard shortcuts mapped by 3rd party plugins                |p'}
let g:unite_source_menu_menus.PluginKeyMaps.command_candidates = [
    \['➤ Replace in quickfix                                   :Qfreplace', 'echo "Use :Qfreplace"'],
    \['➤ Activate EasyAlign in visual mode (<C-x> for regex)        Enter', 'echo "Press Enter"'],
    \['➤ Vimfiler copy file(s)                    Select file(s) then "c"', 'echo "Select file(s) then c"'],
    \['➤ Vimfiler delete file(s)                  Select file(s) then "d"', 'echo "Select file(s) then d"'],
    \['➤ Vimfiler move file(s)                    Select file(s) then "m"', 'echo "Select file(s) then m"'],
    \['➤ Vimfiler search dir                                           9s', 'echo "9s over desired dir"'],
    \['➤ Vimfiler create file(s)                                        N', 'echo "Press N"'],
    \['➤ Vimfiler create dirs(s)                                        K', 'echo "Press K"'],
    \['➤ Vimfiler cd into or edit under cursor                          l', 'echo "Press l"'],
    \['➤ Vimfiler switch to parrent directory                           h', 'echo "Press h"'],
    \['➤ Vimfiler select files/dirs                                     x', 'echo "Press x"'],
    \]
nnoremap <silent>[menu]p :Unite -silent -winheight=17 -start-insert menu:PluginKeyMaps<CR>
" }}}5
" Default Vim Keyboard Shortcuts {{{5
let g:unite_source_menu_menus.BuiltInKeyMaps = {'description': 'Lesser known/used builtin vim keybindings                    |b'}
let g:unite_source_menu_menus.BuiltInKeyMaps.command_candidates = [
    \['➤ Show current char info                                        ga', 'normal ga'],
    \]
nnoremap <silent>[menu]b :Unite -silent -winheight=17 -start-insert menu:BuiltInKeyMaps<CR>
" }}}5
" }}}4
" }}}3
" }}}2
" Vimfiler {{{2
"-------------------------------------------------------------------------
" nnoremap <Leader>vf :<C-u>VimFilerBufferDir -split -simple -parent -winwidth=35 -toggle -no-quit<CR>
nnoremap <Leader>vf :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -toggle -no-quit<CR>
nnoremap <Leader>vs :<C-u>VimFilerExplorer -split -simple -parent -winwidth=35 -no-quit -find<CR>
let g:vimfiler_as_default_explorer = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_tree_leaf_icon = " "
let g:vimfiler_tree_opened_icon = '▾'
let g:vimfiler_tree_closed_icon = '▸'
let g:vimfiler_file_icon = '-'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'
let g:vimfiler_time_format = '%m-%d-%y %H:%M:%S'
let g:vimfiler_expand_jump_to_first_child = 0
let g:vimfiler_ignore_pattern = '\.git\|\.DS_Store\|\.pyc'

autocmd FileType vimfiler nunmap <buffer> <C-l>
autocmd FileType vimfiler nunmap <buffer> <C-j>
autocmd FileType vimfiler nunmap <buffer> l
autocmd FileType vimfiler nmap <buffer> l <Plug>(vimfiler_cd_or_edit)
autocmd FileType vimfiler nmap <buffer> h <Plug>(vimfiler_switch_to_parent_directory)
autocmd FileType vimfiler nmap <buffer> <C-R> <Plug>(vimfiler_redraw_screen)
autocmd FileType vimfiler nmap <buffer> <Leader>s <Plug>(vimfiler_mark_current_line):call VimfilerSearch()<CR>
autocmd FileType vimfiler nmap <silent><buffer><expr> <CR> vimfiler#smart_cursor_map(
\ "\<Plug>(vimfiler_expand_tree)",
\ "\<Plug>(vimfiler_edit_file)")
" }}} 2
" }}}1

" Misc Functions {{{1
" DeleteBuffer {{{2
"-----------------------------------------------------------------------------------
" Delete buffer(s) in Ctrl-P with <F5>
function! s:DeleteBuffer()
    let line = getline('.')
    let bufid = line =~ '\[\d\+\*No Name\]$' ? str2nr(matchstr(line, '\d\+'))
        \ : fnamemodify(line[2:], ':p')
    exec "bd" bufid
    exec "norm \<F5>"
endfunction
"}}}2
" Renewtagsfile {{{2
"-----------------------------------------------------------------------------------
" If a ctags file exists updated it if not create one
function! RenewTagsFile()
    exe 'silent !rm -rf .ctags'
    exe 'silent !coffeetags --include-vars -Rf .ctags'
    exe 'silent !ctags -a -Rf .ctags --languages=python --python-kinds=-iv --exclude=build --exclude=dist ' . system('python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"')''
    exe 'silent !ctags -a -Rf .ctags --extra=+f --exclude=.git --languages=python --python-kinds=-iv --exclude=build --exclude=dist 2>/dev/null'
    exe 'redraw!'
endfunction
" }}}2
" Highlight matches when jumping to next {{{2
"-----------------------------------------------------------------------------------
" This rewires n and N to highlight the match to help your eye track between jumps
nnoremap <silent> n   n:call HLNext(0.4)<cr>
nnoremap <silent> N   N:call HLNext(0.4)<cr>

function! HLNext (blinktime)
    highlight HighlightStyle ctermfg=none ctermbg=160 cterm=none
    let [bufnum, lnum, col, off] = getpos('.')
    let matchlen = strlen(matchstr(strpart(getline('.'),col-1),@/))
    let target_pat = '\c\%#'.@/
    let ring = matchadd('HighlightStyle', target_pat, 101)
    redraw
    exec 'sleep ' . float2nr(a:blinktime * 500) . 'm'
    call matchdelete(ring)
    redraw
endfunction
" }}}2
" Custom Fold Text{{{2
"-----------------------------------------------------------------------------------
" Customizations for how folded text is displayed
function! CustomFoldText()
    let fs = v:foldstart
    while getline(fs) =~ '^\s*$' | let fs = nextnonblank(fs + 1)
    endwhile
    if fs > v:foldend
        let line = getline(v:foldstart)
    else
        let line = substitute(getline(fs), '\t', repeat(' ', &tabstop), 'g')
    endif
    let w = winwidth(0) - &foldcolumn - (&number ? 8 : 0)
    let foldSize = 1 + v:foldend - v:foldstart
    let foldSizeStr = " " . foldSize . " lines "
    let foldLevelStr = repeat("+--", v:foldlevel)
    let lineCount = line("$")
    let foldPercentage = printf("[%.1f", (foldSize*1.0)/lineCount*100) . "%] "
    let expansionString = repeat(".", w - strwidth(foldSizeStr.line.foldPercentage))
    return line . expansionString . foldSizeStr . foldPercentage
endf
set foldtext=CustomFoldText()
" }}}2
" Nohassle Paste {{{2
"-----------------------------------------------------------------------------------
" Code totally boosted from Tim Pope
function! s:setup_paste() abort
  let s:paste = &paste
  set paste
endfunction

nnoremap <silent> <Plug>unimpairedPaste :call <SID>setup_paste()<CR>
nnoremap <silent> yp  :call <SID>setup_paste()<CR>a
nnoremap <silent> yP  :call <SID>setup_paste()<CR>i
nnoremap <silent> yo  :call <SID>setup_paste()<CR>o
nnoremap <silent> yO  :call <SID>setup_paste()<CR>O
nnoremap <silent> yA  :call <SID>setup_paste()<CR>A
nnoremap <silent> yI  :call <SID>setup_paste()<CR>I

augroup unimpaired_paste
  autocmd!
  autocmd InsertLeave *
        \ if exists('s:paste') |
        \   let &paste = s:paste |
        \   unlet s:paste |
        \ endif
augroup END
" }}}2
" Increment a column of numbers {{{2
"-----------------------------------------------------------------------------------
function! Incr()
    let a = line('.') - line("'<")
    let c = virtcol("'<")
    if a > 0
        execute 'normal! '.c.'|'.a."\<C-a>"
    endif
    normal `<
endfunction

vnoremap <C-a> :call Incr()<CR>
" }}}2
" Toggle checkboxs {{{2
"-----------------------------------------------------------------------------------
" Used in .md files for todo lists turns [ ] into [√] and appends a done time stamp
function! ToggleTodoCheckbox()
        let line = getline('.')
        if(match(line, "\\[ \\]") != -1)
          let line = substitute(line, "\\[ \\]", "[√]", "")
          let line = substitute(line, "$", " @done (" . strftime("%m/%d/%y %H:%M") . ")", "")
        elseif(match(line, "\\[√\\]") != -1)
          let line = substitute(line, "\\[√\\]", "[ ]", "")
          let line = substitute(line, " @done.*$", "", "")
        endif
        call setline('.', line)
endfunction
" }}}2
" Toggle Quickfix {{{2
"-----------------------------------------------------------------------------------
let g:quickfix_is_open = 0

function! QuickfixToggle()
    if g:quickfix_is_open
        cclose
        let g:quickfix_is_open = 0
        execute g:quickfix_return_to_window . "wincmd w"
    else
        let g:quickfix_return_to_window = winnr()
        copen
        let g:quickfix_is_open = 1
    endif
endfunction
" }}}2
" Format JSON {{{2
"-----------------------------------------------------------------------------------
" Visually select an uglified json string and call this command to pretty print it
function! FormatJSON()
    :'<,'>!python -m json.tool
endfunction
command! -range FormatJSON call FormatJSON()
" }}}2
" Visual Find and Replace {{{2
"-----------------------------------------------------------------------------------
function! VisualFindAndReplace()
    :OverCommandLine%s/
    :w
endfunction
" }}}2
" Visual Find and Replace With Selection {{{2
"-----------------------------------------------------------------------------------
function! VisualFindAndReplaceWithSelection() range
    :'<,'>OverCommandLine s/
    :w
endfunction
" }}}2
" Doesn't replace buffer contents when pasting {{{2
"-----------------------------------------------------------------------------------
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()
" }}}2
" Under score test name {{{2
"-----------------------------------------------------------------------------------
function! MakeUnderscore()
python << endPython

import vim

def underscore_test_name():
    current_line = vim.current.line
    test_start = current_line.find("test")
    test_end = current_line.find("(")
    test_name = current_line[test_start:test_end]
    test_name_underscored = test_name.replace(" ", "_")
    cursor_pos = vim.current.window.cursor
    vim.current.buffer[cursor_pos[0] - 1] = current_line.replace(test_name, test_name_underscored)

underscore_test_name()

endPython
endfunction

command! UnderscoreTest call MakeUnderscore()
" }}}2
" Wrap WORD {{{2
" -----------------------------------------------------------------------------------
function! WrapWordWith()
python << endPython

import vim
from itertools import dropwhile

def python_input(message = 'input'):
    vim.command('call inputsave()')
    vim.command("let user_input = input('" + message + ": ')")
    vim.command('call inputrestore()')
    return vim.eval('user_input')

def wrap_with():
    the_chars = {"[": "]", "['": "']", '["': '"]', "(": ")", "('": "')", '("': '")', "": ")"}
    the_word = vim.eval('expand("<cword>")')
    current_line = vim.current.line
    wrap_name = python_input("Wrap with")
    cursor_pos = vim.current.window.cursor
    open_char_gen = dropwhile(lambda x: x not in ["[", "(", "'", '"'], wrap_name)
    open_char = "".join(open_char_gen)
    courtesy_opener = "" if open_char else "("
    vim.current.buffer[cursor_pos[0] - 1] = current_line.replace(the_word, "{}{}{}{}".format(wrap_name, courtesy_opener, the_word, the_chars[open_char]))

wrap_with()

endPython
endfunction

command! WrapWith call WrapWordWith()
" }}}2
" Jump to the appropriate tags for Python and Everything else {{{2
"-----------------------------------------------------------------------------------
function! MyJumpTo()
    let filetype=&ft
    if filetype == "python"
        exe ":call jedi#goto_definitions()"
    else
        :exe "norm \<C-]>"
    endif
endfunction
" }}}2
" UltiSnips mapping for multi trigger options {{{2
"-----------------------------------------------------------------------------------
let g:ulti_expand_or_jump_res = 0 "default value, just set once
function! Ulti_ExpandOrJump_and_getRes()
    call UltiSnips#ExpandSnippetOrJump()
    return g:ulti_expand_or_jump_res
endfunction
" }}}2
" The Silver Searcher {{{2
"-----------------------------------------------------------------------------------
if executable('ag')
    set grepprg=ag\ --nogroup\ --nocolor\ --column
    set grepformat=%f:%l:%c:%m
endif

function! TheSilverSearcher()
python << endPython

import vim

def python_input(message = 'input'):
  vim.command('call inputsave()')
  vim.command("let user_input = input('" + message + ": ')")
  vim.command('call inputrestore()')
  return vim.eval('user_input')

def silver_search():
    search_args = python_input("Search For")
    if search_args:
        vim.command('silent grep! "{}"'.format(search_args))
        vim.command('redraw!')
        vim.command('redrawstatus!')
        vim.command('copen')

silver_search()

endPython
endfunction

command Search call TheSilverSearcher()
" }}}2
" Navigate Terminal Splits {{{2
function! s:NavigateTermSplits(direction)
  let windowNumber = winnr()
  execute 'wincmd ' . a:direction
  if windowNumber == winnr()
    " We didn't move to a new vim split. Now try to move tmux splits
    silent call system('tmux select-pane -' . tr(a:direction, 'hjkl', 'LDUR'))
  endif
endfunction

nnoremap <silent> <C-h> :call <SID>NavigateTermSplits('h')<CR>
nnoremap <silent> <C-j> :call <SID>NavigateTermSplits('j')<CR>
nnoremap <silent> <C-k> :call <SID>NavigateTermSplits('k')<CR>
nnoremap <silent> <C-l> :call <SID>NavigateTermSplits('l')<CR>
" }}}2
" Edit Macro {{{2
"-----------------------------------------------------------------------------------
function! EditMacro()
  call inputsave()
  let g:regToEdit = input('Register to edit: ')
  call inputrestore()
  execute "nnoremap <Plug>em :let @" . eval("g:regToEdit") . "='<C-R><C-R>" . eval("g:regToEdit")
endfunction
" VimfilerCurrentDir {{{2
"-----------------------------------------------------------------------------------
function! VimfilerCurrentDir()
    let currentDir = vimfiler#get_current_vimfiler().original_files
    for dirItem in currentDir
        if dirItem.vimfiler__is_marked == 1
            return dirItem.action__path
        endif
    endfor
endfunction
" }}}2
" VimfilerSearch {{{2
"-----------------------------------------------------------------------------------
function! VimfilerSearch()
    let dirToSearch = VimfilerCurrentDir()
    let pattern = input("Search [".dirToSearch."] For: ")
    if pattern == ''
        echo 'Maybe another time...'
        return
    endif
    exec 'silent grep! "'.pattern.'" '.dirToSearch
    exec "redraw!"
    exec "redrawstatus!"
    exec "copen"
endfunction
" }}}2
" VimfilerChangeDir {{{2
"-----------------------------------------------------------------------------------
function! VimfilerChangeDir()
    let dirToSearch = VimfilerCurrentDir()
    call vimfiler#mappings#cd('file:'.dirToSearch)
endfunction
" }}}2
" Delete Matching Buffers {{{2
"-----------------------------------------------------------------------------------
function! DeleteMatchingBuffers(pattern)
    let l:bufferList = filter(range(1, bufnr('$')), 'buflisted(v:val)')
    let l:matchingBuffers = filter(bufferList, 'bufname(v:val) =~ a:pattern')
    if len(l:matchingBuffers) < 1
        echo 'No buffers found matching pattern ' . a:pattern
        return
    endif
    exec 'bd ' . join(l:matchingBuffers, ' ')
endfunction

command! -nargs=1 BD call DeleteMatchingBuffers('<args>')
" }}}2
" }}}1

