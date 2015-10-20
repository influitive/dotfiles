""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VIM FOR RAILS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

    " a .vimrc files customized for use with Ruby on Rails
    " --enric ribas i susany

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PACKAGES with Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Setting up Vundle - the vim plugin bundler
   set nocompatible
   filetype off

   " set the runtime path to include Vundle and initialize
   set rtp+=~/.vim/bundle/Vundle.vim


" Plugins
   call vundle#begin()
   Plugin 'gmarik/Vundle.vim'

   Plugin 'airblade/vim-gitgutter'
   Plugin 'Lokaltog/vim-powerline'
   Plugin 'sjl/gundo.vim'
   Plugin 'ragtag.vim'
   Plugin 'rails.vim'
   Plugin 'fugitive.vim'
   Plugin 'Solarized'
   Plugin 'Zenburn'
   Plugin 'Diablo3'
   Plugin 'surround.vim'
   Plugin 'Sass'
   Plugin 'jQuery'
   Plugin 'handlebars'
   Plugin 'ctrlp.vim'
   Plugin 'SuperTab'
   Plugin 'ack.vim'
   Plugin 'YankRing.vim'
   Plugin 'tComment'
   Plugin 'mattn/emmet-vim'
   Plugin 'The-NERD-tree'
   Plugin 'michaeljsmith/vim-indent-object'
   Plugin 'bkad/CamelCaseMotion'

   if version >= 704
     Plugin 'SirVer/ultisnips'
   endif
   Plugin 'honza/vim-snippets'

   call vundle#end()
" Plugins (end)

    filetype plugin indent on

" Brief help

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LEADER
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" redefine leader. must be before all uses cleader
  let mapleader = ","
  let maplocalleader = ","

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" SNIPPETS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  let g:UltiSnipsExpandTrigger="<tab>"
  let g:UltiSnipsJumpForwardTrigger="<tab>"
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
  let g:UltiSnipsEditSplit="vertical"

  map <leader>se :UltiSnipsEdit<cr>
  map <leader>sa :UltiSnipsAddFiletypes<space>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STANDARD SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Not VI mode
  set nocompatible

" Enable highlighting for syntax
  syntax on

" Turn on specific actions for different types of files
  filetype plugin indent on
  compiler ruby

" Indent Text Object
"
" Selects text based on indentation level
"  <command>ai         (A)n (I)ndentation level and line above.
"  <command>ii         (I)nner (I)ndentation level (no line above).
"  <command>aI         (A)n (I)ndentation level and lines above/below.

" Ruby Text Object (not installed)
" <command>ar – a Ruby block
" <command>ir – inner Ruby block

" Ack
"   o    to open (same as enter)
"   go   to preview file (open but maintain focus on ack.vim results)
"   t    to open in new tab
"   T    to open in new tab silently
"   v    to open in vertical split
"   gv   to open in vertical split silently
"   q    to close the quickfix window
"
"   Filter by type
"   --ruby 'search_regex'
"
"   css, html, js, etc..

" Emmet
  let g:user_emmet_leader_key='<C-M>'

"   Standard is <c-y>, (comma)


" DWM Tiling Window Management
  " This works better than ZoonWin
  " nnoremap <C-J> <C-W>w
  " nnoremap <C-K> <C-W>W

  "<C-,> DWMRotateCounterclockwise " Doesn't seem to work
  "<C-.> DWMRotateClockwise " Doesn't seem to work

  "<C-N> Create new blank window
  "<C-C> Close current window
  "<C-@> Set focus to main window
  "<C-Space> Move current window to main window

  "<C-L> Increase size of main window
  "<C-H> Decrease size of main window

" TComment
"    confusing but it's control-dash
"    <c--><c-->   :: :TComment
"    <c--><space> :: :TComment <QUERY COMMENT-BEGIN ?COMMENT-END>
"    <c-->b       :: :TCommentBlock
"    <c-->a       :: :TCommentAs <QUERY COMMENT TYPE>
"    <c-->n       :: :TCommentAs &filetype <QUERY COUNT>
"    <c-->s       :: :TCommentAs &filetype_<QUERY COMMENT SUBTYPE>
"    <c-->i       :: :TCommentInline
"    <c-->r       :: :TCommentRight
"    <c-->p       :: Comment the current inner paragraph

" TagBar ctags
  " displays list of functions for quick navigation
  let g:tagbar_ctags_bin='/usr/local/bin/ctags'  " Proper Ctags locations (brew install ctags-exuberant)
  "let g:tagbar_width=26                          " Default is 40, seems too wide
  noremap <silent> <f7> :TagbarOpenAutoClose<cr>

" Ack
"   better than grep
  let g:AckAllFiles = 0
  let g:AckCmd='ack --type-add ruby=.feature --ignore-dir=tmp 2> /dev/null'
  let g:ackprg="ack -H --nocolor --nogroup --column"

  nnoremap <leader>/ :Ack ''<left>

" ragTag
   let g:ragtag_global_maps = 1

    "     Mapping       Changed to   (cursor = ^) ~

    "     <C-X>=        foo<%= ^ %>                               *ragtag-CTRL-X_=*
    "     <C-X>+        <%= foo^ %>                               *ragtag-CTRL-X_+*
    "     <C-X>-        foo<% ^ %>                                *ragtag-CTRL-X_-*
    "     <C-X>_        <% foo^ %>                                *ragtag-CTRL-X__*
    "     <C-X>'        foo<%# ^ %>                               *ragtag-CTRL-X_'*
    "     <C-X>"        <%# foo^ %>                               *ragtag-CTRL-X_quote*
    "     <C-X><Space>  <foo>^</foo>                              *ragtag-CTRL-X_<Space>*
    "     <C-X><CR>     <foo>\n^\n</foo>                          *ragtag-CTRL-X_<CR>*
    "     <C-X>/        Last HTML tag closed                      *ragtag-CTRL-X_/*
    "     <C-X>!        <!DOCTYPE...>/<?xml ...?> (menu)          *ragtag-CTRL-X_!*
    "     <C-X>@        <link rel="stylesheet" ...>               *ragtag-CTRL-X_@*
    "     <C-X>#        <meta http-equiv="Content-Type" ... />    *ragtag-CTRL-X_#*
    "     <C-X>$        <script src="/javascripts/^.js"></script> *ragtag-CTRL-X_$*

" CtrlP
"   File Navigation and Open file navigation (buffers)
  map <leader><space> :CtrlP<cr>
  map <space> :CtrlPBuffer<cr>
  map <leader>cpr :CtrlPClearAllCaches<CR>

" NERDTree
"   File Navigation via tree view
  let NERDTreeIgnore=['\.pyc']
  map <silent> <LocalLeader>nt  :NERDTreeToggle<CR>
  map <f3>                      :NERDTreeToggle<CR>
  map <silent> <LocalLeader>nr  :NERDTree<CR>
  map <silent> <LocalLeader>nf  :NERDTreeFind<CR>
  map <silent> <LocalLeader>ntc :NERDTreeClose<CR>

" Align
"   aligns text based on characters passed
  vnoremap <leader>aa :Align<space>
  vnoremap <leader>== :Align<space>=<CR>

" Surround
"   surrounds text objects with quotes, brackets, etc.
"   basically
"     add surround    = ys
"     change surround = cs
"     delete surround = ds

      "  Old text                  Command     New text ~

      "  "Hello *world!"           ds"         Hello world!
      "  [123+4*56]/2              cs])        (123+456)/2
      "  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
      "  if *x>3 {                 ysW(        if ( x>3 ) {
      "  my $str = *whee!;         vllllS'     my $str = 'whee!';
      "  "Hello *world!"           ds"         Hello world!
      "  (123+4*56)/2              ds)         123+456/2
      "  <div>Yo!*</div>           dst         Yo!
      "  "Hello *world!"           cs"'        'Hello world!'
      "  "Hello *world!"           cs"<q>      <q>Hello world!</q>
      "  (123+4*56)/2              cs)]        [123+456]/2
      "  (123+4*56)/2              cs)[        [ 123+456 ]/2
      "  <div>Yo!*</div>           cst<p>      <p>Yo!</p>
      "  Hello w*orld!             ysiw)       Hello (world)!
      "  Hello w*orld!             yssB        {Hello world!}

" Gundo
"   undo tree
  nnoremap <F4> :GundoToggle<CR>

" Paste previous insert text
"   <c-a> in insert mode
"   . register ie. ".p

" Search and Replace word under cursor
  nnoremap <Leader>* :%s/\<<C-r><C-w>\>/

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" COLOR
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
  if ! has("gui_running")
    set t_Co=256
  endif
  " feel free to choose :set background=light for a different style
  " colorscheme solarized
  set background=light

  colorscheme diablo3

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" BASIC EDITING CONFIGURATION
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This makes RVM work inside Vim. I have no idea why.
" from gary bern*
  set shell=bash

" Apply  substitutions globally on lines. For example, instead of
" :%s/foo/bar/g you just type :%s/foo/bar/. This is almost always what you
" want (when was the last time you wanted to only replace the first occurrence
" of a word on a line?) and if you need the previous behavior you just tack on
" the g again.
  set gdefault

" code folding
  set foldmethod=indent
  set foldlevel=9999
  set foldcolumn=0

" allow unsaved background buffers and remember marks/undo for them
  set hidden

" Other Settings
  set nobackup
  set noswapfile
  set ignorecase
  set smartcase
  set incsearch
  set showmatch
  set hlsearch
  set encoding=utf-8
  set scrolloff=3
  set autoindent
  set showmode
  set showcmd
  set wildmenu
  set wildmode=list,longest
  set visualbell
  set cursorline
  set ttyfast
  set modelines=0
  set relativenumber
  set backspace=indent,eol,start
  set textwidth=0
  set nosmartindent
  set tabstop=2
  set shiftwidth=2
  set softtabstop=2
  set expandtab
  set ruler
  set nowrap
  set dir=/tmp//

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OTHER SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  let html_use_css=1
  let html_number_lines=0
  let html_no_pre=1
  let coffee_no_trailing_space_error = 1

  let g:gist_clip_command = 'pbcopy'
  let g:gist_detect_filetype = 1
  let g:rubycomplete_buffer_loading = 1
  let g:no_html_toolbar = 'yes'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM AUTOCMDS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
augroup vimrcEx
  " Clear all autocmds in the group
  autocmd!
  autocmd FileType text setlocal textwidth=78
  " Jump to last cursor position unless it's invalid or in an event handler
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

" Special Settings based on Filetypes
  autocmd FileType php setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType python setlocal tabstop=4 shiftwidth=4 softtabstop=4
  autocmd FileType tex setlocal textwidth=78
  autocmd BufNewFile,BufRead *.txt setlocal textwidth=78
  autocmd FileType ruby runtime ruby_mappings.vim
  autocmd FileType ruby,haml,eruby,yaml,html,javascript,sass,cucumber set ai sw=2 sts=2 et
  autocmd! BufRead,BufNewFile *.sass setfiletype sass
  autocmd BufRead *.mkd  set ai formatoptions=tcroqn2 comments=n:&gt;
  autocmd BufRead *.markdown  set ai formatoptions=tcroqn2 comments=n:&gt;

  " Leave the return key alone when in command line windows, since it's used
  " to run commands there.
  autocmd! CmdwinEnter * :unmap <cr>
  autocmd! CmdwinLeave * :call MapCR()
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RELATIVE LINE NUMBERS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

nnoremap <f6> :call NumberToggle()<cr>

augroup relative_lines
  autocmd FocusLost   * :set number
  autocmd FocusGained * :set relativenumber

  autocmd InsertEnter * :set number
  autocmd InsertLeave * :set relativenumber
augroup END


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

map <leader>rn :call RenameFile()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PROMOTE VARIABLE TO RSPEC LET
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! PromoteToLet()
  :normal! dd
  " :exec '?^\s*it\>'
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:map <leader>rl :PromoteToLet()<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RUNNING TESTS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>RS :call RunTestFile()<cr>
map <leader>rs :call RunNearestTest()<cr>
map <leader>rsa :call RunTests('')<cr>

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number . " -b")
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!script/features " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        elseif filereadable("Gemfile")
            exec ":!bundle exec rspec --color " . a:filename
        else
            exec ":!rspec --color " . a:filename
        end
    end
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Better Keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Go to middle of line
  map gm :call cursor(0, virtcol('$')/2)<CR>

" Jump up and down a little faster
  nnoremap <c-j> 10j
  nnoremap <c-k> 10k

" Annoyed with pressing shift so often
  nnoremap ; :
  " Unfortunately this is a bad idea which breaks everything
  " nnoremap : ;
  nnoremap <c-f> ;

" Diff
  map <silent> <LocalLeader>gd :e product_diff.diff<CR>:%!git diff<CR>:setlocal buftype=nowrite<CR>

" Hide the hightlighting which can get annoying
  map <silent> <LocalLeader>nh :nohls<CR>

" Enter in normal mode adds newline (because I think it makes sense)
  nnoremap <Return> A<Return><Esc>
  nnoremap <S-Return> 0O<Esc> "This doesn't seem to work in terminal VIM


" Window Movement and Control
  " Window Switching
  nnoremap <S-left>  <C-w>h
  nnoremap <S-down>  <C-w>j
  nnoremap <S-up>    <C-w>k
  nnoremap <S-right> <C-w>l

" Paste line after current line
  nnoremap <leader>p :put<cr>

" Delete word part
  nnoremap <LocalLeader>d df_

" Delete all console.log
  nnoremap <leader>dcl :g/.*console.log.*/d<cr>

" Scopes
  " Paragraph select
  onoremap p i(

" Replace current word in entire document (no confirm)
  nnoremap <expr> <leader>8 ':%s/'.expand('<cword>').'/'.input('New Word:').'/g<cr>'
" Replace current word in entire document (no confirm)
  nnoremap <expr> <leader>* ':%s/'.expand('<cword>').'/'.input('New Word:').'/gc<cr>'

" Better default searching
  nnoremap / /\v
  vnoremap / /\v

" For lines that wrap, this is better behaviour
  nnoremap <silent> k gk
  nnoremap <silent> j gj

" edit in vertical split and reload vimrc file.
  nnoremap <leader>sv :source $MYVIMRC<cr>
  nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" move line up and down
  nnoremap <C-UP> ddkP
  nnoremap <C-DOWN> ddp

" White Space
  " remove
    function! Trim()
      %s/\s*$//
    endfunction
    command! -nargs=0 Trim :call Trim()
    nnoremap <silent> <Leader>ws :Trim<CR>``

  " Highlight trailing whitespace
    autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
    autocmd BufRead,InsertLeave * match ExtraWhitespace /\s\+$/

    " Set up highlight group & retain through colorscheme changes
      highlight ExtraWhitespace ctermbg=blue guibg=blue
      autocmd ColorScheme * highlight ExtraWhitespace ctermbg=blue guibg=blue

" Highlight too-long lines
  autocmd BufRead,InsertEnter,InsertLeave * 2match LineLengthError /\%126v.*/
  highlight LineLengthError ctermbg=black guibg=black
  autocmd ColorScheme * highlight LineLengthError ctermbg=black guibg=black

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Status line settings
  set laststatus=2
  set statusline=
  set statusline+=%<\                       " cut at start
  set statusline+=%2*[%n%H%M%R%W]%*\        " buffer number, and flags
  set statusline+=%-40f\                    " relative path
  set statusline+=%=                        " separate between right- and left-aligned
  set statusline+=%1*%y%*%*\                " file type
  " set statusline+=%10(L(%l/%L)%)\\           " line
  " set statusline+=%2(C(%v/125)%)\\           " column
  " set statusline+=%P                         " percentage of file

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" UNDO
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
if version >= 703
  set undodir=~/.vim/undodir
  set undofile
  set undoreload=10000 "maximum number lines to save for undo on a buffer reload
endif
set undolevels=1000 "maximum number of changes that can be undone

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" DVORAK
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" no d h
" no h j
" no t k
" no n l
" no j d
" no l n
" no L N

" " Added benefits

" no - $
" no _ ^
" no N <C-w><C-w>
" no T <C-w><C-r>
" no H 8<Down>
" no T 8<Up>
" no D <C-w><C-r>


" the end of enric's vimrc. thanks.
"
"
