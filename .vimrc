"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"
" Author: joe di castro <joe@joedicastro.com>
" Source: http://github.com/joedicastro/dotfiles/tree/master/vim
"
" This file is under a lot of stress, it changes frequently, so it's better if
" you watch the DVCS commits to stay in the loop.

" Setup language {{{ ==========================================================

" language en_US.UTF-8           " Solve some plugins incompatibilities

" }}}

" NEOBUNDLE {{{ ===============================================================

set nocompatible             " No to the total compatibility with the ancient vi

" NeoBundle auto-installation and setup {{{

" Auto installing NeoBundle
let iCanHazNeoBundle=1
let neobundle_readme=expand($HOME.'/.vim/bundle/neobundle.vim/README.md')
if !filereadable(neobundle_readme)
    echo "Installing NeoBundle.."
    echo ""
    silent !mkdir -p $HOME/.vim/bundle
    silent !git clone https://github.com/Shougo/neobundle.vim $HOME/.vim/bundle/neobundle.vim
    let iCanHazNeoBundle=0
endif


" Call NeoBundle
if has('vim_starting')
    set rtp+=$HOME/.vim/bundle/neobundle.vim/
endif
"call neobundle#rc(expand($HOME.'/.vim/bundle/'))
"Ronny actualizo forma de llamar a neobundle
call neobundle#begin(expand($HOME.'/.vim/bundle/'))

" is better if NeoBundle rules NeoBundle (needed!)
NeoBundle 'Shougo/neobundle.vim'
" }}}

" BUNDLES (plugins administrated by NeoBundle) {{{

" Shougo's way {{{

" Vimproc to asynchronously run commands (NeoBundle, Unite)
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }

" Unite. The interface to rule almost everything
NeoBundle 'Shougo/unite.vim'
NeoBundle 'ujihisa/unite-colorscheme'

" Unite sources
NeoBundleLazy 'Shougo/unite-outline', {'autoload':{'unite_sources':'outline'}}
NeoBundleLazy 'tsukkee/unite-help', {'autoload':{'unite_sources':'help'}}
NeoBundleLazy 'ujihisa/unite-colorscheme', {'autoload':{'unite_sources':
            \ 'colorscheme'}}
NeoBundleLazy 'ujihisa/unite-locate', {'autoload':{'unite_sources':'locate'}}
NeoBundleLazy 'thinca/vim-unite-history', { 'autoload' : { 'unite_sources' :
            \ ['history/command', 'history/search']}}
NeoBundleLazy 'osyo-manga/unite-filetype', { 'autoload' : {'unite_sources' :
            \ 'filetype', }}
NeoBundleLazy 'osyo-manga/unite-quickfix', {'autoload':{'unite_sources':
            \ ['quickfix', 'location_list']}}
NeoBundleLazy 'osyo-manga/unite-fold', {'autoload':{'unite_sources':'fold'}}
NeoBundleLazy 'tacroe/unite-mark', {'autoload':{'unite_sources':'mark'}}
NeoBundleLazy 'Shougo/neomru.vim', {'autoload':{'unite_sources': 
            \['file_mru', 'directory_mru']}}

" File explorer (needed where ranger is not available)
NeoBundleLazy 'Shougo/vimfiler', {'autoload' : { 'commands' : ['VimFiler']}}

" Junk files
NeoBundleLazy 'Shougo/junkfile.vim', {'autoload':{'commands':'JunkfileOpen',
            \ 'unite_sources':['junkfile','junkfile/new']}}

" Unite plugin that provides command line completition
NeoBundle 'majkinetor/unite-cmdmatch'

" Unite plugin that provides spell suggestions
NeoBundle 'kopischke/unite-spell-suggest'
" }}}

" Colorschemes {{{

" Dark themes
" Improved terminal version of molokai, almost identical to the GUI one
NeoBundle 'joedicastro/vim-molokai256'
" Ronny Plugins
" 05 agosto plugin para agregar clases de java classpath
" Lo necesitaba para ir a las clases de java, pero no me sirvió
" NeoBundle 'tpope/vim-classpath'
" 26 may 2017 Crea tablas interactivamente
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'maksimr/vim-jsbeautify'

" Ronny 09/oct/2017
NeoBundle 'nathanaelkane/vim-indent-guides'
" Ronny 08/oct/2017
NeoBundle 'stevearc/vim-arduino'
" Ronny 30/oct/2016
" https://github.com/fatih/vim-go
NeoBundle 'fatih/vim-go'
NeoBundle 'dyng/ctrlsf.vim'
"se pone lento
NeoBundle 'majutsushi/tagbar'
" Ronny Laravel
NeoBundle 'markwu/vim-laravel4-snippets'
" Ronny railscast
NeoBundle 'shinzui/vim-idleFingers'
" Ronny syntax Jade
NeoBundle 'digitaltoad/vim-jade'
" Ronny Javascript
NeoBundle "wookiehangover/jshint.vim"
NeoBundle "pangloss/vim-javascript"
" Para jst/ejs syntax, requiere vim-javascript
NeoBundle "briancollins/vim-jst"
" Ronny Themes
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'whatyouhide/vim-gotham'
NeoBundle 'w0ng/vim-hybrid'
" Ronny BusyBee
NeoBundle 'vim-scripts/BusyBee'
" Ronny 05/feb/2017 Laravel Plugins
NeoBundle 'jwalton512/vim-blade'
" xterm color table
NeoBundle 'guns/xterm-color-table.vim'
" Rails plugin
NeoBundle 'tpope/vim-rails'
" Rails theme
NeoBundle 'chriskempson/base16-vim'
" Vitaly for event onfocus lostfocus with tmux
NeoBundle 'sjl/vitality.vim'
" Session, mejor manejo de sesiones
NeoBundle 'tpope/vim-obsession'
" Moverse mas rápido
NeoBundle 'Lokaltog/vim-easymotion'
" Syntax para objetive-j
NeoBundle 'nanki/vim-objj'
NeoBundle 'chrisbra/Colorizer'
" Para archivos csv 17/mar/2017
NeoBundle 'vim-scripts/csv.vim'
" Para hacer transparente el background
NeoBundle 'miyakogi/seiya.vim'

" En Ronny Plugins
NeoBundle 'tomasr/molokai'
NeoBundleLazy 'sjl/badwolf', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'nielsmadan/harlequin', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}


" Light themes
NeoBundleLazy 'vim-scripts/summerfruit256.vim', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}
NeoBundleLazy 'joedicastro/vim-github256', { 'autoload' :
        \ { 'unite_sources' : 'colorscheme', }}

" Make terminal themes from GUI themes
NeoBundleLazy 'godlygeek/csapprox', { 'autoload' :
        \ { 'commands' : ['CSApprox', 'CSApproxSnapshot']}}

" }}}

" DCVS {{{
"
" Admin Git
NeoBundle 'tpope/vim-fugitive'
" Show git repository changes in the current file
NeoBundle 'airblade/vim-gitgutter'
" Git viewer
NeoBundleLazy 'gregsexton/gitv', {'depends':['tpope/vim-fugitive'],
            \ 'autoload':{'commands':'Gitv'}}
" Browse GitHub events in Vim
NeoBundle 'joedicastro/vim-github-dashboard'

" }}}

" Markdown & reStructuredText {{{

" Markdown Syntax
NeoBundleLazy 'joedicastro/vim-markdown'
" Makes a Markdown Extra preview into the browser
NeoBundleLazy 'joedicastro/vim-markdown-extra-preview'
" reStructuredText in vim. Your personal Wiki in RST
NeoBundleLazy 'Rykka/riv.vim', {'autoload': {'filetypes': ['rst']}} 

" }}}

" Linux tools {{{

" A diff tool for directories
NeoBundleLazy 'joedicastro/DirDiff.vim', { 'autoload': { 'commands' : 'DirDiff'}}
" Hexadecimal editor
NeoBundle 'Shougo/vinarise.vim'
" Ronny , Ctrlp
NeoBundle 'kien/ctrlp.vim'
" }}}

" Ronny , Tabular
NeoBundle 'godlygeek/tabular'
" }}}

" Python {{{

" Autocompletion
NeoBundle 'Shougo/neocomplete.vim'
" A Python plugin
NeoBundleLazy 'klen/python-mode', {'autoload': {'filetypes': ['python']}}
" Admin virtualenvs
NeoBundle 'jmcantrell/vim-virtualenv'
" Show indent lines
NeoBundleLazy 'Yggdroot/indentLine', {'autoload': {'filetypes': ['python']}}
" Show reports from coverage.py
NeoBundleLazy 'alfredodeza/coveragepy.vim', {'autoload': {'filetypes': ['python']}}
" Sort imports
 NeoBundle 'fisadev/vim-isort', {'autoload': {'filetypes': ['python']}}
" }}}

" Code Snippets {{{

" Powerful and advanced Snippets tool
NeoBundle 'SirVer/ultisnips'
" Snippets for Ultisnips
NeoBundle 'honza/vim-snippets'

" }}}

" Syntax {{{

NeoBundleLazy 'elzr/vim-json', {'filetypes' : 'json'}
NeoBundleLazy 'vim-scripts/po.vim--gray', {'autoload': {'filetypes': ['po']}}
NeoBundleLazy 'joedicastro/vim-pentadactyl', {
            \ 'autoload': {'filetypes': ['pentadactyl']}}
NeoBundle 'scrooloose/syntastic'

" }}}

" Open external links {{{

" Open a url into the browser or another files with an external app
NeoBundle 'vim-scripts/utl.vim'

" }}}

" Text edition {{{

" Autocompletion of (, [, {, ', ", ...
NeoBundle 'delimitMate.vim'
" Smart and fast date changer
NeoBundle 'tpope/vim-speeddating'
" to surround vim objects with a pair of identical chars
NeoBundle 'tpope/vim-surround'
" extend repetitions by the 'dot' key
NeoBundle 'tpope/vim-repeat'
" toggle comments
NeoBundle 'tpope/vim-commentary'
" smart digraphs insertion
NeoBundle 'Rykka/easydigraph.vim'
" browse the vim undo tree
NeoBundleLazy 'sjl/gundo.vim', { 'autoload' : {'commands': 'GundoToggle'}}
" to insert lorem ipsum blocks
NeoBundleLazy 'vim-scripts/loremipsum', { 'autoload' :
            \ { 'commands' : 'Loremipsum'}}
" reveals all the character info, Unicode included
NeoBundle 'tpope/vim-characterize'
" transpose lines and text blocks
NeoBundleLazy 'salsifis/vim-transpose', { 'autoload' :
            \ { 'commands' : 'Transpose'}}
" marks admin
NeoBundle 'kshenoy/vim-signature'
" text-objects
NeoBundle 'kana/vim-textobj-entire' " ae, ie
NeoBundle 'kana/vim-textobj-indent' " ai, ii, aI, iI
NeoBundle 'kana/vim-textobj-lastpat' " a/, i/, a?, i?
NeoBundle 'kana/vim-textobj-line' " al, il
NeoBundle 'kana/vim-textobj-underscore' " a_, i_
NeoBundle 'kana/vim-textobj-user'

" }}}

" HTML/CSS {{{

" A smart and powerful Color Management tool. Needs to be loaded to be able
" to use the mappings
NeoBundleLazy 'Rykka/colorv.vim', {'autoload' : {
            \ 'commands' : [
                             \ 'ColorV', 'ColorVView', 'ColorVPreview',
                             \ 'ColorVPicker', 'ColorVEdit', 'ColorVEditAll',
                             \ 'ColorVInsert', 'ColorVList', 'ColorVName',
                             \ 'ColorVScheme', 'ColorVSchemeFav',
                             \ 'ColorVSchemeNew', 'ColorVTurn2'],
            \ }}

NeoBundleLazy 'othree/html5.vim', {'autoload':
            \ {'filetypes': ['html', 'xhttml', 'css']}}

NeoBundleLazy 'mattn/emmet-vim', {'autoload':
            \ {'filetypes': ['html', 'xhttml', 'css', 'xml', 'xls', 'markdown']}}

NeoBundle 'kchmck/vim-coffee-script',{'autoload' : {
            \ 'commands' : [
                             \ 'CoffeeCompile', 'CoffeeLint', 'CoffeeMake',
                             \ 'CoffeeRun', 'CoffeeWatch'],
            \ 'filetypes' : ['coffee']
            \ }}

" }}}

" GUI {{{

" A better looking status line
"NeoBundle 'bling/vim-airline'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
" Zooms a window
NeoBundleLazy 'vim-scripts/zoomwintab.vim', {'autoload' :
            \{'commands' : 'ZoomWinTabToggle'}}
" easily window resizing
NeoBundle 'jimsei/winresizer'

" }}}

" Tmux {{{

" Easily interacts with Tmux from Vim
NeoBundle 'benmills/vimux'
" Tmux config file syntax
NeoBundleLazy 'vimez/vim-tmux', { 'autoload' : { 'filetypes' : 'conf'}}

" }}}

" API Web {{{

NeoBundle 'mattn/webapi-vim'

" }}}

" DBMS {{{

NeoBundleLazy 'joedicastro/dbext.vim', { 'autoload' : { 'filetypes' : 'sql'}}

" }}}
" NerdTree :: Ronny {{{
NeoBundle 'scrooloose/nerdtree'
" }}}
NeoBundle 'junegunn/goyo.vim'
NeoBundle 'amix/vim-zenroom2'
"Ronny python
NeoBundle 'fneu/breezy'
NeoBundle 'ap/vim-css-color'
NeoBundle 'chrisbra/Colorizer'
"colorscheme javascript
NeoBundle 'crusoexia/vim-monokai'
"Ronny PHP linter que usa Mess Detector y Codesniffer
"https://github.com/joonty/vim-phpqa
" NeoBundle 'joonty/vim-phpqa.git'

call neobundle#end()
" END BUNDLES }}}

" Auto install the plugins {{{

" First-time plugins installation
if iCanHazNeoBundle == 0
    echo "Installing Bundles, please ignore key map error messages"
    echo ""
    :NeoBundleInstall
endif

" Check if all of the plugins are already installed, in other case ask if we
" want to install them (useful to add plugins in the .vimrc)
NeoBundleCheck

" }}}

filetype plugin indent on      " Indent and plugins by filetype

" END NEOBUNDLE }}}

" VIM Setup {{{ ===============================================================

" <Leader> & <LocalLeader> mapping {{{

let mapleader=','
let maplocalleader= ' '

" }}}

" Basic options {{{

scriptencoding utf-8
set encoding=utf-8              " setup the encoding to UTF-8
set ls=2                        " status line always visible
set go-=T                       " hide the toolbar
set go-=m                       " hide the menu
" The next two lines are quite tricky, but in Gvim, if you don't do this, if you
" only hide all the scrollbars, the vertical scrollbar is showed anyway
set go+=rRlLbh                  " show all the scrollbars
set go-=rRlLbh                  " hide all the scrollbars
set visualbell                  " turn on the visual bell
set cursorline                  " highlight the line under the cursor
set fillchars+=vert:│           " better looking for windows separator
set ttyfast                     " better screen redraw
set title                       " set the terminal title to the current file
set showcmd                     " shows partial commands
set hidden                      " hide the inactive buffers
set ruler                       " sets a permanent rule
set lazyredraw                  " only redraws if it is needed
set autoread                    " update a open file edited outside of Vim
set ttimeoutlen=0               " toggle between modes almost instantly
set backspace=indent,eol,start  " defines the backspace key behavior
set virtualedit=all             " to edit where there is no actual character

" }}}

" Searching {{{

set incsearch                   " incremental searching
set showmatch                   " show pairs match
set hlsearch                    " highlight search results
set smartcase                   " smart case ignore
set ignorecase                  " ignore case letters

" }}}

" History and permanent undo levels {{{

set history=1000
set undofile
set undoreload=1000

" }}}

" Make a dir if no exists {{{

function! MakeDirIfNoExists(path)
    if !isdirectory(expand(a:path))
        call mkdir(expand(a:path), "p")
    endif
endfunction

" }}}

" Backups {{{

set backup
set noswapfile
set backupdir=$HOME/.vim/tmp/backup/
set undodir=$HOME/.vim/tmp/undo/
set directory=$HOME/.vim/tmp/swap/
set viminfo+=n$HOME/.vim/tmp/viminfo

" make this dirs if no exists previously
silent! call MakeDirIfNoExists(&undodir)
silent! call MakeDirIfNoExists(&backupdir)
silent! call MakeDirIfNoExists(&directory)

" }}}

" Wildmenu {{{

set wildmenu                        " Command line autocompletion
set wildmode=list:longest,full      " Shows all the options

set wildignore+=*.sw?                            " Vim swap files
set wildignore+=*.bak,*.?~,*.??~,*.???~,*.~      " Backup files
set wildignore+=*.luac                           " Lua byte code
" Ronny: Descomentado hace que no funcione syntastic:javac_java_classpath
" set wildignore+=*.jar                            " java archives
set wildignore+=*.pyc                            " Python byte code
set wildignore+=*.stats                          " Pylint stats
set wildignore+=*.ctxt,*.bluej                   " BlueJ Files
set wildignore+=*.class,*.dex,*.apk              " Java Class Files, Dex and apk
set wildignore+=*.jar                            " Java jar Files
set wildignore+=*.png,*jpeg,*jpg                 " Image Files
set wildignore+=*.flat,*.pro                     " Other android files
set wildignore+=*/debug/*
set wildignore+=*/build/*

" }}}

" Tabs, space and wrapping {{{

set expandtab                  " spaces instead of tabs
set tabstop=4                  " a tab = four spaces
set shiftwidth=4               " number of spaces for auto-indent
set softtabstop=4              " a soft-tab of four spaces
set autoindent                 " set on the auto-indent

" set formatoptions=qrn1ct
set textwidth=80
set colorcolumn=81

function! ToggleWrap()
    let s:nowrap_cc_bg = [22, '#005f00']
    redir => s:curr_cc_hi
    silent hi ColorColumn
    redir END
    let s:curr_cc_ctermbg = matchstr(s:curr_cc_hi, 'ctermbg=\zs.\{-}\s\ze\1')
    let s:curr_cc_guibg = matchstr(s:curr_cc_hi, 'guibg=\zs.\{-}\_$\ze\1')
    if s:curr_cc_ctermbg != s:nowrap_cc_bg[0]
        let g:curr_cc_ctermbg = s:curr_cc_ctermbg
    endif
    if s:curr_cc_guibg != s:nowrap_cc_bg[1]
        let g:curr_cc_guibg = s:curr_cc_guibg
    endif
    if &textwidth == 80
        set textwidth=0
        exec 'hi ColorColumn ctermbg='.s:nowrap_cc_bg[0].
                    \' guibg='.s:nowrap_cc_bg[1]
    elseif &textwidth == 0
        set textwidth=80
        exec 'hi ColorColumn ctermbg='.g:curr_cc_ctermbg.
                    \' guibg='.g:curr_cc_guibg
    endif
endfunction

nmap <silent><Leader>ew :call ToggleWrap()<CR>

" }}}

" Ok, a vim for men, get off the cursor keys {{{

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" }}}

" Colorscheme {{{

syntax enable                  " enable the syntax highlight
set background=dark            " set a dark background
set t_Co=256                   " 256 colors for the terminal
"if has('gui_running')
"    colorscheme molokai
"else
"    colorscheme molokai256
"endif

" }}}

" Font {{{

set guifont=Dejavu\ Sans\ Mono\ for\ Powerline\ 11

" }}}

" Resize the divisions if the Vim window size changes {{{

au VimResized * exe "normal! \<c-w>="

" }}}

" New windows {{{

nnoremap <Leader>v <C-w>v
nnoremap <Leader>h <C-w>s

" }}}

" Fast window moves {{{

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" }}}

" Fast window & buffer close and kill {{{

nnoremap <Leader>k <C-w>c
nnoremap <silent><Leader>K :bd<CR>

" }}}

" Toggle line numbers {{{

nnoremap <silent><Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if !&number && !&relativenumber
      set number
      set norelativenumber
  elseif &number && !&relativenumber
      set nonumber
      set relativenumber
  elseif !&number && &relativenumber
      set number
      set relativenumber
  elseif &number && &relativenumber
      set nonumber
      set norelativenumber
  endif
endfunction

" }}}

" Show hidden chars {{{

nmap <Leader>eh :set list!<CR>
" set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
set listchars=tab:→\ ,eol:¬,trail:·,extends:↷,precedes:↶

" }}}

" Folding {{{

set foldmethod=marker

" Toggle folding

nnoremap \ za
vnoremap \ za

" }}}

" Cut/Paste {{{

" to/from the clipboard
map <Leader>y "*y
map <Leader>p "*p

" toggle paste mode
map <Leader>P :set invpaste<CR>

" }}}

" Autoload configuration when this file changes ($MYVIMRC) {{{

autocmd! BufWritePost vimrc source %

" }}}

" Spelling {{{

" turn on the spell checking and set the Spanish language
" nmap <Leader>ss :setlocal spell spelllang=es<CR>
" turn on the spell checking and set the English language
" nmap <Leader>se :setlocal spell spelllang=en<CR>
" turn off the spell checking
nmap <Leader>so :setlocal nospell <CR>
" jump to the next bad spell word
nmap <Leader>sn ]s
" suggest words
" nmap <Leader>sp z=
nmap <Leader>sp :Unite spell_suggest<CR>
" jump to the next bad spell word and suggests a correct one
" nmap <Leader>sc ]sz=
nmap <Leader>sc ]s :Unite spell_suggest<CR>
" add word to the dictionary
nmap <Leader>sa zg
" }}}

" Save as root {{{

cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" }}}

" Quick saving {{{

nmap <silent> <Leader>w :update<CR>

" }}}

" Delete trailing whitespaces {{{

nmap <silent><Leader>et :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar>:nohl<CR>

" }}}

" Use Ranger as a file explorer {{{

fun! RangerChooser()
    exec "silent !ranger --choosefile=/tmp/chosenfile " . expand("%:p:h")
    if filereadable('/tmp/chosenfile')
        exec 'edit ' . system('cat /tmp/chosenfile')
        call system('rm /tmp/chosenfile')
    endif
    redraw!
endfun
map <Leader>x :call RangerChooser()<CR>
" }}}

" Toggle the Quickfix window {{{

function! s:QuickfixToggle()
    for i in range(1, winnr('$'))
        let bnum = winbufnr(i)
        if getbufvar(bnum, '&buftype') == 'quickfix'
            cclose
            lclose
            return
        endif
    endfor
    copen
endfunction
command! ToggleQuickfix call <SID>QuickfixToggle()

nnoremap <silent> <Leader>q :ToggleQuickfix<CR>

" }}}

" Text statistics {{{

" get the total of lines, words, chars and bytes (and for the current position)
map <Leader>es g<C-G>

" get the word frequency in the text
function! WordFrequency() range
  let all = split(join(getline(a:firstline, a:lastline)), '\A\+')
  let frequencies = {}
  for word in all
    let frequencies[word] = get(frequencies, word, 0) + 1
  endfor
  let lst = []
  for [key,value] in items(frequencies)
    call add(lst, value."\t".key."\n")
  endfor
  call sort(lst)
  echo join(lst)
endfunction
command! -range=% WordFrequency <line1>,<line2>call WordFrequency()
map <Leader>ef :Unite output:WordFrequency<CR>

" }}}

" Count lines of code {{{

function! LinesOfCode()
    echo system('cloc --quiet '.bufname("%"))
endfunction

"}}}

" Toggle the search results highlighting {{{

map <silent><Leader>eq :set invhlsearch<CR>

" }}}

" Move between Vim and Tmux windows {{{

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      " The sleep and & gives time to get back to vim so tmux's focus tracking
      " can kick in and send us our ^[[O
      execute "silent !sh -c 'sleep 0.01; tmux select-pane -" . a:tmuxdir . "' &"
      redraw!
    endif
  endfunction
  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te
  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<CR>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<CR>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<CR>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<CR>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" }}}

" Quick exiting without save {{{

nnoremap <Leader>`` :qa!<CR>

" }}}

" Execution permissions by default to shebang (#!) files {{{

augroup shebang_chmod
  autocmd!
  autocmd BufNewFile  * let b:brand_new_file = 1
  autocmd BufWritePost * unlet! b:brand_new_file
  autocmd BufWritePre *
        \ if exists('b:brand_new_file') |
        \   if getline(1) =~ '^#!' |
        \     let b:chmod_post = '+x' |
        \   endif |
        \ endif
  autocmd BufWritePost,FileWritePost *
        \ if exists('b:chmod_post') && executable('chmod') |
        \   silent! execute '!chmod '.b:chmod_post.' "<afile>"' |
        \   unlet b:chmod_post |
        \ endif
augroup END

" }}}

" Load matchit by default {{{

if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

" }}}

" Make the Y behavior similar to D & C {{{

nnoremap Y y$

" }}}

" END VIM SETUP }}}

" PLUGINS Setup {{{ ===========================================================

" Airline {{{

set noshowmode

" Ronny 26 ene 2016
let g:airline_theme='wombat'
let g:airline_enable_branch=1
let g:airline_powerline_fonts=1
let g:airline_detect_whitespace = 1
let g:airline#extensions#hunks#non_zero_only = 1

" let g:airline#extensions#tabline#enabled = 2
" let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#buffer_min_count = 1

" }}}

" CoffeeScript {{{

map <Leader>rw :CoffeeWatch vert<CR>

" }}}

" ColorV {{{

let g:colorv_cache_file=$HOME.'/.vim/tmp/vim_colorv_cache'
let g:colorv_cache_fav=$HOME.'/.vim/tmp/vim_colorv_cache_fav'

" }}}

" Commentary {{{ -------------------------------------------------------------

nmap <Leader>c <Plug>CommentaryLine
xmap <Leader>c <Plug>Commentary

augroup plugin_commentary
    au!
    au FileType python setlocal commentstring=#%s
    au FileType htmldjango setlocal commentstring={#\ %s\ #}
    au FileType puppet setlocal commentstring=#\ %s
    au FileType xquery setlocal commentstring=(:\ %s\ :)
augroup END

" }}}

" DBext {{{

let g:dbext_default_type = 'SQLITE'
let g:dbext_default_user = ""
let g:dbext_default_passwd = ""
let g:dbext_default_display_cmd_line = 0
let g:dbext_default_prompt_for_parameters=0
let g:dbext_default_history_file = $HOME.'./vim/tmp/dbext_sql_history.txt'

" Mappings

let g:dbext_default_usermaps = 0
let g:dbext_map_or_cmd = 'cmd'

vnoremap <Leader>Se :DBExecVisualSQL<CR>
vnoremap <leader>St :DBSelectFromTable<CR>
vnoremap <Leader>Sdt :DBDescribeTable<CR>
vnoremap <Leader>Sdp :DBDescribeProcedure<CR>
vnoremap <Leader>Slt :DBListTable<CR>
vnoremap <Leader>Slp :DBListProcedure<CR>
vnoremap <Leader>Slv :DBListView<CR>
vnoremap <Leader>Slc :DBListColumn<CR>

nnoremap <Leader>Se :DBExecSQLUnderCursor<CR>
nnoremap <Leader>SE :DBExecSQLTopX<CR>
nnoremap <Leader>Sea :1,$DBExecRangeSQL<CR>
nnoremap <Leader>Sel :.,.DBExecRangeSQL<CR>
nnoremap <Leader>Sep :'<,'>DBExecRangeSQL<CR>
nnoremap <Leader>St :DBSelectFromTable<CR>
nnoremap <Leader>ST :DBSelectFromTableTopX<CR>
nnoremap <Leader>Stw :DBSelectFromTableWithWhere<CR>
nnoremap <Leader>Sta :DBSelectFromTableAskName<CR>
nnoremap <Leader>Sd :DBDescribeTable<CR>
nnoremap <Leader>Sda :DBDescribeTableAskName<CR>
nnoremap <Leader>Sdp :DBDescribeProcedure<CR>
nnoremap <Leader>Sdpa :DBDescribeProcedureAskName<CR>
nnoremap <Leader>Slt :DBListTable<CR>
nnoremap <Leader>Slp :DBListProcedure<CR>
nnoremap <Leader>Slv :DBListView<CR>
nnoremap <Leader>Slc :DBListColumn<CR>
nnoremap <Leader>Svr :DBListVar<CR>
nmap <silent> <Leader>Sal :.,.DBVarRangeAssign<CR>
nmap <silent> <Leader>Saa :1,$DBVarRangeAssign<CR>
nmap <silent> <Leader>Sap :'<,'>DBVarRangeAssign<CR>
xmap <silent> <Leader>Sa :DBVarRangeAssign<CR>
nnoremap <Leader>Sh :DBHistory<CR>
nnoremap <Leader>So :DBOrientation<CR>
nnoremap <Leader>Sbp <Plug>DBPromptForBufferParameters<CR>

" SQLite
let g:dbext_default_SQLITE_bin = 'sqlite3'
" let g:dbext_default_SQLITE_cmd_header        = ".mode column\n.headers ON\n"
" let g:dbext_default_SQLITE_cmd_terminator    = ';'
" let g:dbext_default_SQLITE_cmd_terminator    = ';'
" let g:dbext_default_SQLITE_extra             = ''

" }}}

" delimitmate {{{

let delimitMate_expand_space = 1

" }}}

" easydigraph {{{

let g:EasyDigraph_nmap = '<Leader>dd'

" }}}

" Fugitive {{{

nnoremap <Leader>gn :Unite output:echo\ system("git\ init")<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>ga :Gwrite<CR>
nnoremap <Leader>go :Gread<CR>
nnoremap <Leader>gR :Gremove<CR>
nnoremap <Leader>gm :Gmove<Space>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gB :Gbrowse<CR>
nnoremap <Leader>gp :Git! push<CR>
nnoremap <Leader>gP :Git! pull<CR>
nnoremap <Leader>gi :Git!<Space>
nnoremap <Leader>ge :Gedit<CR>
nnoremap <Leader>gE :Gedit<Space>
nnoremap <Leader>gl :exe "silent Glog <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gL :exe "silent Glog -- <Bar> Unite -no-quit
            \ quickfix"<CR>:redraw!<CR>
nnoremap <Leader>gt :!tig<CR>:redraw!<CR>
nnoremap <Leader>gS :exe "silent !shipit"<CR>:redraw!<CR>
nnoremap <Leader>gg :exe 'silent Ggrep -i '.input("Pattern: ")<Bar>Unite
            \ quickfix -no-quit<CR>
nnoremap <Leader>ggm :exe 'silent Glog --grep='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>
nnoremap <Leader>ggt :exe 'silent Glog -S='.input("Pattern: ").' <Bar>
            \Unite -no-quit quickfix'<CR>

nnoremap <Leader>ggc :silent! Ggrep -i<Space>

" for the diffmode
noremap <Leader>du :diffupdate<CR>

if !exists(":Gdiffoff")
    command Gdiffoff diffoff | q | Gedit
endif
noremap <Leader>dq :Gdiffoff<CR>
" }}}

" Gitv {{{

nnoremap <silent> <leader>gv :Gitv --all<CR>
nnoremap <silent> <leader>gV :Gitv! --all<CR>
vnoremap <silent> <leader>gV :Gitv! --all<CR>

let g:Gitv_OpenHorizontal = 'auto'
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_DoNotMapCtrlKey = 1
let g:Gitv_WrapLines = 1

autocmd FileType git set nofoldenable

" }}}

" GitHub dashboard {{{

nnoremap <Leader>gD :exe 'GHD! '.input("Username: ")<CR>
nnoremap <Leader>gA :exe 'GHA! '.input("Username or repository: ")<CR>

function! GHDashboard (...)
  if &filetype == 'github-dashboard'
    " first variable is the statusline builder
    let builder = a:1

    call builder.add_section('airline_a', 'GitHub ')
    call builder.add_section('airline_b',
                \ ' %{get(split(get(split(github_dashboard#statusline(), " "),
                \ 1, ""), ":"), 0, "")} ')
    call builder.add_section('airline_c',
                \ ' %{get(split(get(split(github_dashboard#statusline(), " "),
                \ 2, ""), "]"), 0, "")} ')

    " tell the core to use the contents of the builder
    return 1
  endif
endfunction

autocmd FileType github-dashboard call airline#add_statusline_func('GHDashboard')

" }}}

" Gundo {{{ ------------------------------------------------------------------

nnoremap <Leader>u :GundoToggle<CR>

let g:gundo_preview_bottom = 1

" }}}

" indentLine {{{

map <silent> <Leader>L :IndentLinesToggle<CR>
let g:indentLine_enabled = 0
let g:indentLine_char = '┊'
let g:indentLine_color_term = 239

" }}}

" Neocomplete {{{

let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_refresh_always = 1
let g:neocomplete#max_list = 30
let g:neocomplete#min_keyword_length = 1
let g:neocomplete#sources#syntax#min_keyword_length = 1
let g:neocomplete#data_directory = $HOME.'/.vim/tmp/neocomplete'

" disable the auto select feature by default to speed up writing without
" obstacles (is optimal for certain situations)
let g:neocomplete#enable_auto_select = 0
                                        
" toggle the auto select feature
function! ToggleNeoComplete()
  if !g:neocomplete#disable_auto_complete && g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 0
  elseif !g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 1
      let g:neocomplete#enable_auto_select = 0
  elseif g:neocomplete#disable_auto_complete && !g:neocomplete#enable_auto_select
      let g:neocomplete#disable_auto_complete = 0
      let g:neocomplete#enable_auto_select = 1
  endif
endfunction
nnoremap <silent><Leader>ea :call ToggleNeoComplete()<CR>
   
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif

let g:neocomplete#sources#omni#input_patterns.python='[^. \t]\.\w*'

" }}}

" Neobundle {{{

let g:neobundle#log_filename = $HOME.'/.vim/tmp/neobundle.log'

" }}}

" neomru {{{

let g:neomru#file_mru_path = $HOME.'/.vim/tmp/neomru/file'
let g:neomru#directory_mru_path = $HOME.'/.vim/tmp/neomru/directory'

" }}}

" Po.vim {{{ -----------------------------------------------------------------

let g:po_translator = "joe di castro <joe@joedicastro.com>"

" }}}

" PythonMode {{{ -------------------------------------------------------------

nmap <silent><Leader>n :PymodeLint<CR>

let g:pymode_breakpoint_bind = '<Leader>B'

let g:pymode_lint = 1
let g:pymode_lint_on_write = 0
let g:pymode_lint_checkers = ['pylint', 'pep8', 'mccabe', 'pep257']
let g:pymode_lint_ignore = ''
let g:pymode_virtualenv = 0
let g:pymode_rope = 1

let g:pymode_rope_completion = 0
let g:pymode_rope_complete_on_dot = 1

" }}}

" Syntastic {{{

nmap <silent><Leader>N :SyntasticCheck<CR>:Errors<CR>

let g:syntastic_python_pylint_exe = "pylint2"
let g:syntastic_mode_map = { 'mode': 'active',
            \ 'active_filetypes': [],
            \ 'passive_filetypes': ['python','php'] }

let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol  = '⚡'
let g:syntastic_style_warning_symbol  = '⚡'

" }}}

" Unite {{{

" files
nnoremap <silent><Leader>o :Unite -silent -start-insert file<CR>
nnoremap <silent><Leader>O :Unite -silent -start-insert file_rec/async<CR>
nnoremap <silent><Leader>m :Unite -silent file_mru<CR>
" buffers
nnoremap <silent><Leader>b :Unite -silent buffer<CR>
" tabs
nnoremap <silent><Leader>B :Unite -silent tab<CR>
" buffer search
nnoremap <silent><Leader>f :Unite -silent -no-split -start-insert -auto-preview
            \ line<CR>
nnoremap <silent>[menu]8 :UniteWithCursorWord -silent -no-split -auto-preview
            \ line<CR>
" yankring
nnoremap <silent><Leader>i :Unite -silent history/yank<CR>
" grep
nnoremap <silent><Leader>a :Unite -silent -no-quit grep<CR>
" help
nnoremap <silent> g<C-h> :UniteWithCursorWord -silent help<CR>
" tasks
nnoremap <silent><Leader>; :Unite -silent -toggle
            \ grep:%::FIXME\|TODO\|NOTE\|XXX\|COMBAK\|@todo<CR>
" outlines (also ctags)
nnoremap <silent><Leader>t :Unite -silent -vertical -winwidth=40
            \ -direction=topleft -toggle outline<CR>
" junk files
  nnoremap <silent><Leader>d :Unite -silent junkfile/new junkfile<CR>

" menus {{{
let g:unite_source_menu_menus = {}

" menu prefix key (for all Unite menus) {{{
nnoremap [menu] <Nop>
nmap <LocalLeader> [menu]
" }}}

" menus menu
nnoremap <silent>[menu]u :Unite -silent -winheight=20 menu<CR>

" files and dirs menu {{{
let g:unite_source_menu_menus.files = {
    \ 'description' : '          files & dirs
        \                                          ⌘ [space]o',
    \}
let g:unite_source_menu_menus.files.command_candidates = [
    \['▷ open file                                                  ⌘ ,o',
        \'Unite -start-insert file'],
    \['▷ open more recently used files                              ⌘ ,m',
        \'Unite file_mru'],
    \['▷ open file with recursive search                            ⌘ ,O',
        \'Unite -start-insert file_rec/async'],
    \['▷ edit new file',
        \'Unite file/new'],
    \['▷ search directory',
        \'Unite directory'],
    \['▷ search recently used directories',
        \'Unite directory_mru'],
    \['▷ search directory with recursive search',
        \'Unite directory_rec/async'],
    \['▷ make new directory',
        \'Unite directory/new'],
    \['▷ change working directory',
        \'Unite -default-action=lcd directory'],
    \['▷ know current working directory',
        \'Unite output:pwd'],
    \['▷ junk files                                                 ⌘ ,d',
        \'Unite junkfile/new junkfile'],
    \['▷ save as root                                               ⌘ :w!!',
        \'exe "write !sudo tee % >/dev/null"'],
    \['▷ quick save                                                 ⌘ ,w',
        \'normal ,w'],
    \['▷ open ranger                                                ⌘ ,x',
        \'call RangerChooser()'],
    \['▷ open vimfiler                                              ⌘ ,X',
        \'VimFiler'],
    \]
nnoremap <silent>[menu]o :Unite -silent -winheight=17 -start-insert
            \ menu:files<CR>
" }}}

" file searching menu {{{
let g:unite_source_menu_menus.grep = {
    \ 'description' : '           search files
        \                                          ⌘ [space]a',
    \}
let g:unite_source_menu_menus.grep.command_candidates = [
    \['▷ grep (ag → ack → grep)                                     ⌘ ,a',
        \'Unite -no-quit grep'],
    \['▷ find',
        \'Unite find'],
    \['▷ locate',
        \'Unite -start-insert locate'],
    \['▷ vimgrep (very slow)',
        \'Unite vimgrep'],
    \]
nnoremap <silent>[menu]a :Unite -silent menu:grep<CR>
" }}}

" buffers, tabs & windows menu {{{
let g:unite_source_menu_menus.navigation = {
    \ 'description' : '     navigate by buffers, tabs & windows
        \                   ⌘ [space]b',
    \}
let g:unite_source_menu_menus.navigation.command_candidates = [
    \['▷ buffers                                                    ⌘ ,b',
        \'Unite buffer'],
    \['▷ tabs                                                       ⌘ ,B',
        \'Unite tab'],
    \['▷ windows',
        \'Unite window'],
    \['▷ location list',
        \'Unite location_list'],
    \['▷ quickfix',
        \'Unite quickfix'],
    \['▷ resize windows                                             ⌘ C-C C-W',
        \'WinResizerStartResize'],
    \['▷ new vertical window                                        ⌘ ,v',
        \'vsplit'],
    \['▷ new horizontal window                                      ⌘ ,h',
        \'split'],
    \['▷ close current window                                       ⌘ ,k',
        \'close'],
    \['▷ toggle quickfix window                                     ⌘ ,q',
        \'normal ,q'],
    \['▷ zoom                                                       ⌘ ,z',
        \'ZoomWinTabToggle'],
    \['▷ delete buffer                                              ⌘ ,K',
        \'bd'],
    \]
nnoremap <silent>[menu]b :Unite -silent menu:navigation<CR>
" }}}

" buffer internal searching menu {{{
let g:unite_source_menu_menus.searching = {
    \ 'description' : '      searchs inside the current buffer
        \                     ⌘ [space]f',
    \}
let g:unite_source_menu_menus.searching.command_candidates = [
    \['▷ search line                                                ⌘ ,f',
        \'Unite -auto-preview -start-insert line'],
    \['▷ search word under the cursor                               ⌘ [space]8',
        \'UniteWithCursorWord -no-split -auto-preview line'],
    \['▷ search outlines & tags (ctags)                             ⌘ ,t',
        \'Unite -vertical -winwidth=40 -direction=topleft -toggle outline'],
    \['▷ search marks',
        \'Unite -auto-preview mark'],
    \['▷ search folds',
        \'Unite -vertical -winwidth=30 -auto-highlight fold'],
    \['▷ search changes',
        \'Unite change'],
    \['▷ search jumps',
        \'Unite jump'],
    \['▷ search undos',
        \'Unite undo'],
    \['▷ search tasks                                               ⌘ ,;',
        \'Unite -toggle grep:%::FIXME|TODO|NOTE|XXX|COMBAK|@todo'],
    \]
nnoremap <silent>[menu]f :Unite -silent menu:searching<CR>
" }}}

" yanks, registers & history menu {{{
let g:unite_source_menu_menus.registers = {
    \ 'description' : '      yanks, registers & history
        \                            ⌘ [space]i',
    \}
let g:unite_source_menu_menus.registers.command_candidates = [
    \['▷ yanks                                                      ⌘ ,i',
        \'Unite history/yank'],
    \['▷ commands       (history)                                   ⌘ q:',
        \'Unite history/command'],
    \['▷ searches       (history)                                   ⌘ q/',
        \'Unite history/search'],
    \['▷ registers',
        \'Unite register'],
    \['▷ messages',
        \'Unite output:messages'],
    \['▷ undo tree      (gundo)                                     ⌘ ,u',
        \'GundoToggle'],
    \]
nnoremap <silent>[menu]i :Unite -silent menu:registers<CR>
" }}}

" spelling menu {{{
let g:unite_source_menu_menus.spelling = {
    \ 'description' : '       spell checking
        \                                        ⌘ [space]s',
    \}
let g:unite_source_menu_menus.spelling.command_candidates = [
    \['▷ spell checking in Spanish                                  ⌘ ,ss',
        \'setlocal spell spelllang=es'],
    \['▷ spell checking in English                                  ⌘ ,se',
        \'setlocal spell spelllang=en'],
    \['▷ turn off spell checking                                    ⌘ ,so',
        \'setlocal nospell'],
    \['▷ jumps to next bad spell word and show suggestions          ⌘ ,sc',
        \'normal ,sc'],
    \['▷ jumps to next bad spell word                               ⌘ ,sn',
        \'normal ,sn'],
    \['▷ suggestions                                                ⌘ ,sp',
        \'normal ,sp'],
    \['▷ add word to dictionary                                     ⌘ ,sa',
        \'normal ,sa'],
    \]
nnoremap <silent>[menu]s :Unite -silent menu:spelling<CR>
" }}}

" text edition menu {{{
let g:unite_source_menu_menus.text = {
    \ 'description' : '           text edition
        \                                          ⌘ [space]e',
    \}
let g:unite_source_menu_menus.text.command_candidates = [
    \['▷ toggle search results highlight                            ⌘ ,eq',
        \'set invhlsearch'],
    \['▷ toggle line numbers                                        ⌘ ,l',
        \'call ToggleRelativeAbsoluteNumber()'],
    \['▷ toggle wrapping                                            ⌘ ,ew',
        \'call ToggleWrap()'],
    \['▷ toggle auto-completion state (manual → disabled → auto)    ⌘ ,ea',
        \'call ToggleNeoCompleteAutoSelect()'],
    \['▷ show hidden chars                                          ⌘ ,eh',
        \'set list!'],
    \['▷ toggle fold                                                ⌘ /',
        \'normal za'],
    \['▷ open all folds                                             ⌘ zR',
        \'normal zR'],
    \['▷ close all folds                                            ⌘ zM',
        \'normal zM'],
    \['▷ copy to the clipboard                                      ⌘ ,y',
        \'normal ,y'],
    \['▷ paste from the clipboard                                   ⌘ ,p',
        \'normal ,p'],
    \['▷ toggle paste mode                                          ⌘ ,P',
        \'normal ,P'],
    \['▷ remove trailing whitespaces                                ⌘ ,et',
        \'normal ,et'],
    \['▷ text statistics                                            ⌘ ,es',
        \'Unite output:normal\ ,es -no-cursor-line'],
    \['▷ show word frequency                                        ⌘ ,ef',
        \'Unite output:WordFrequency'],
    \['▷ show available digraphs',
        \'digraphs'],
    \['▷ insert lorem ipsum text',
        \'exe "Loremipsum" input("numero de palabras: ")'],
    \['▷ show current char info                                     ⌘ ga',
        \'normal ga'],
    \]
nnoremap <silent>[menu]e :Unite -silent -winheight=20 menu:text <CR>
" }}}

" neobundle menu {{{
let g:unite_source_menu_menus.neobundle = {
    \ 'description' : '      plugins administration with neobundle
        \                 ⌘ [space]n',
    \}
let g:unite_source_menu_menus.neobundle.command_candidates = [
    \['▷ neobundle',
        \'Unite neobundle'],
    \['▷ neobundle log',
        \'Unite neobundle/log'],
    \['▷ neobundle lazy',
        \'Unite neobundle/lazy'],
    \['▷ neobundle update',
        \'Unite neobundle/update'],
    \['▷ neobundle search',
        \'Unite neobundle/search'],
    \['▷ neobundle install',
        \'Unite neobundle/install'],
    \['▷ neobundle check',
        \'Unite -no-empty output:NeoBundleCheck'],
    \['▷ neobundle docs',
        \'Unite output:NeoBundleDocs'],
    \['▷ neobundle clean',
        \'NeoBundleClean'],
    \['▷ neobundle rollback',
        \'exe "NeoBundleRollback" input("plugin: ")'],
    \['▷ neobundle list',
        \'Unite output:NeoBundleList'],
    \['▷ neobundle direct edit',
        \'NeoBundleExtraEdit'],
    \]
nnoremap <silent>[menu]n :Unite -silent -start-insert menu:neobundle<CR>
" }}}

" git menu {{{
let g:unite_source_menu_menus.git = {
    \ 'description' : '            admin git repositories
        \                                ⌘ [space]g',
    \}
let g:unite_source_menu_menus.git.command_candidates = [
    \['▷ tig                                                        ⌘ ,gt',
        \'normal ,gt'],
    \['▷ git viewer             (gitv)                              ⌘ ,gv',
        \'normal ,gv'],
    \['▷ git viewer - buffer    (gitv)                              ⌘ ,gV',
        \'normal ,gV'],
    \['▷ git status             (fugitive)                          ⌘ ,gs',
        \'Gstatus'],
    \['▷ git diff               (fugitive)                          ⌘ ,gd',
        \'Gdiff'],
    \['▷ git commit             (fugitive)                          ⌘ ,gc',
        \'Gcommit'],
    \['▷ git log                (fugitive)                          ⌘ ,gl',
        \'exe "silent Glog | Unite -no-quit quickfix"'],
    \['▷ git log - all          (fugitive)                          ⌘ ,gL',
        \'exe "silent Glog -all | Unite -no-quit quickfix"'],
    \['▷ git blame              (fugitive)                          ⌘ ,gb',
        \'Gblame'],
    \['▷ git add/stage          (fugitive)                          ⌘ ,gw',
        \'Gwrite'],
    \['▷ git checkout           (fugitive)                          ⌘ ,go',
        \'Gread'],
    \['▷ git rm                 (fugitive)                          ⌘ ,gR',
        \'Gremove'],
    \['▷ git mv                 (fugitive)                          ⌘ ,gm',
        \'exe "Gmove " input("destino: ")'],
    \['▷ git push               (fugitive, buffer output)           ⌘ ,gp',
        \'Git! push'],
    \['▷ git pull               (fugitive, buffer output)           ⌘ ,gP',
        \'Git! pull'],
    \['▷ git command            (fugitive, buffer output)           ⌘ ,gi',
        \'exe "Git! " input("comando git: ")'],
    \['▷ git edit               (fugitive)                          ⌘ ,gE',
        \'exe "command Gedit " input(":Gedit ")'],
    \['▷ git grep               (fugitive)                          ⌘ ,gg',
        \'exe "silent Ggrep -i ".input("Pattern: ") | Unite -no-quit quickfix'],
    \['▷ git grep - messages    (fugitive)                          ⌘ ,ggm',
        \'exe "silent Glog --grep=".input("Pattern: ")." | Unite -no-quit quickfix"'],
    \['▷ git grep - text        (fugitive)                          ⌘ ,ggt',
        \'exe "silent Glog -S".input("Pattern: ")." | Unite -no-quit quickfix"'],
    \['▷ git init                                                   ⌘ ,gn',
        \'Unite output:echo\ system("git\ init")'],
    \['▷ git cd                 (fugitive)',
        \'Gcd'],
    \['▷ git lcd                (fugitive)',
        \'Glcd'],
    \['▷ git browse             (fugitive)                          ⌘ ,gB',
        \'Gbrowse'],
    \['▷ github dashboard       (github-dashboard)                  ⌘ ,gD',
        \'exe "GHD! " input("Username: ")'],
    \['▷ github activity        (github-dashboard)                  ⌘ ,gA',
        \'exe "GHA! " input("Username or repository: ")'],
    \['▷ github issues & PR                                         ⌘ ,gS',
        \'normal ,gS'],
    \]
nnoremap <silent>[menu]g :Unite -silent -winheight=29 -start-insert menu:git<CR>
" }}}

" code menu {{{
let g:unite_source_menu_menus.code = {
    \ 'description' : '           code tools
        \                                            ⌘ [space]p',
    \}
let g:unite_source_menu_menus.code.command_candidates = [
    \['▷ run python code                            (pymode)        ⌘ ,r',
        \'PymodeRun'],
    \['▷ show docs for the current word             (pymode)        ⌘ K',
        \'normal K'],
    \['▷ insert a breakpoint                        (pymode)        ⌘ ,B',
        \'normal ,B'],
    \['▷ pylint check                               (pymode)        ⌘ ,n',
        \'PymodeLint'],
    \['▷ run with python2 in tmux panel             (vimux)         ⌘ ,rr',
        \'normal ,rr'],
    \['▷ run with python3 in tmux panel             (vimux)         ⌘ ,r3',
        \'normal ,r3'],
    \['▷ run with python2 & time in tmux panel      (vimux)         ⌘ ,rt',
        \'normal ,rt'],
    \['▷ run with pypy & time in tmux panel         (vimux)         ⌘ ,rp',
        \'normal ,rp'],
    \['▷ command prompt to run in a tmux panel      (vimux)         ⌘ ,rc',
        \'VimuxPromptCommand'],
    \['▷ repeat last command                        (vimux)         ⌘ ,rl',
        \'VimuxRunLastCommand'],
    \['▷ stop command execution in tmux panel       (vimux)         ⌘ ,rs',
        \'VimuxInterruptRunner'],
    \['▷ inspect tmux panel                         (vimux)         ⌘ ,ri',
        \'VimuxInspectRunner'],
    \['▷ close tmux panel                           (vimux)         ⌘ ,rq',
        \'VimuxCloseRunner'],
    \['▷ sort imports                               (isort)',
        \'Isort'],
    \['▷ go to definition                           (pymode-rope)   ⌘ C-C g',
        \'call pymode#rope#goto_definition()'],
    \['▷ find where a function is used              (pymode-rope)   ⌘ C-C f',
        \'call pymode#rope#find_it()'],
    \['▷ show docs for current word                 (pymode-rope)   ⌘ C-C d',
        \'call pymode#rope#show_doc()'],
    \['▷ reorganize imports                         (pymode-rope)   ⌘ C-C r o',
        \'call pymode#rope#organize_imports()'],
    \['▷ refactorize - rename                       (pymode-rope)   ⌘ C-C r r',
        \'call pymode#rope#rename()'],
    \['▷ refactorize - inline                       (pymode-rope)   ⌘ C-C r i',
        \'call pymode#rope#inline()'],
    \['▷ refactorize - move                         (pymode-rope)   ⌘ C-C r v',
        \'call pymode#rope#move()'],
    \['▷ refactorize - use function                 (pymode-rope)   ⌘ C-C r u',
        \'call pymode#rope#use_function()'],
    \['▷ refactorize - change signature             (pymode-rope)   ⌘ C-C r s',
        \'call pymode#rope#signature()'],
    \['▷ refactorize - rename current module        (pymode-rope)   ⌘ C-C r 1 r',
        \'PymodeRopeRenameModule'],
    \['▷ refactorize - module to package            (pymode-rope)   ⌘ C-C r 1 p',
        \'PymodeRopeModuleToPackage'],
    \['▷ syntastic toggle                           (syntastic)',
        \'SyntasticToggleMode'],
    \['▷ syntastic check & errors                   (syntastic)     ⌘ ,N',
        \'normal ,N'],
    \['▷ list virtualenvs                           (virtualenv)',
        \'Unite output:VirtualEnvList'],
    \['▷ activate virtualenv                        (virtualenv)',
        \'VirtualEnvActivate'],
    \['▷ deactivate virtualenv                      (virtualenv)',
        \'VirtualEnvDeactivate'],
    \['▷ run coverage2                              (coveragepy)',
        \'call system("coverage2 run ".bufname("%")) | Coveragepy report'],
    \['▷ run coverage3                              (coveragepy)',
        \'call system("coverage3 run ".bufname("%")) | Coveragepy report'],
    \['▷ toggle coverage report                     (coveragepy)',
        \'Coveragepy session'],
    \['▷ toggle coverage marks                      (coveragepy)',
        \'Coveragepy show'],
    \['▷ coffeewatch                                (coffeescript)  ⌘ ,rw',
        \'CoffeeWatch vert'],
    \['▷ count lines of code',
        \'Unite -default-action= output:call\\ LinesOfCode()'],
    \['▷ toggle indent lines                                        ⌘ ,L',
        \'IndentLinesToggle'],
    \]
nnoremap <silent>[menu]p :Unite -silent -winheight=42 menu:code<CR>
" }}}

" markdown menu {{{
let g:unite_source_menu_menus.markdown = {
    \ 'description' : '       preview markdown extra docs
        \                           ⌘ [space]k',
    \}
let g:unite_source_menu_menus.markdown.command_candidates = [
    \['▷ preview',
        \'Me'],
    \['▷ refresh',
        \'Mer'],
    \]
nnoremap <silent>[menu]k :Unite -silent menu:markdown<CR>
" }}}
 
" reST menu {{{
let g:unite_source_menu_menus.rest = {
    \ 'description' : '           reStructuredText
    \                                      ⌘ [space]r',
    \}
let g:unite_source_menu_menus.rest.command_candidates = [
    \['▷ CheatSheet',
        \'RivCheatSheet'],
    \['▷ reStructuredText Specification',
        \'RivSpecification'],
    \]
nnoremap <silent>[menu]r :Unite -silent menu:rest<CR>
" }}}
 
" bookmarks menu {{{
let g:unite_source_menu_menus.bookmarks = {
    \ 'description' : '      bookmarks
        \                                             ⌘ [space]m',
    \}
let g:unite_source_menu_menus.bookmarks.command_candidates = [
    \['▷ open bookmarks',
        \'Unite bookmark:*'],
    \['▷ add bookmark',
        \'UniteBookmarkAdd'],
    \]
nnoremap <silent>[menu]m :Unite -silent menu:bookmarks<CR>
" }}}

" colorv menu {{{
function! GetColorFormat()
    let formats = {'r' : 'RGB',
                  \'n' : 'NAME',
                  \'s' : 'HEX',
                  \'ar': 'RGBA',
                  \'pr': 'RGBP',
                  \'pa': 'RGBAP',
                  \'m' : 'CMYK',
                  \'l' : 'HSL',
                  \'la' : 'HSLA',
                  \'h' : 'HSV',
                  \}
    let formats_menu = ["\n"]
    for [k, v] in items(formats)
        call add(formats_menu, "  ".k."\t".v."\n")
    endfor
    let fsel = get(formats, input('Choose a format: '.join(formats_menu).'? '))
    return fsel
endfunction

function! GetColorMethod()
    let methods = {
                   \'h' : 'Hue',
                   \'s' : 'Saturation',
                   \'v' : 'Value',
                   \'m' : 'Monochromatic',
                   \'a' : 'Analogous',
                   \'3' : 'Triadic',
                   \'4' : 'Tetradic',
                   \'n' : 'Neutral',
                   \'c' : 'Clash',
                   \'q' : 'Square',
                   \'5' : 'Five-Tone',
                   \'6' : 'Six-Tone',
                   \'2' : 'Complementary',
                   \'p' : 'Split-Complementary',
                   \'l' : 'Luma',
                   \'g' : 'Turn-To',
                   \}
    let methods_menu = ["\n"]
    for [k, v] in items(methods)
        call add(methods_menu, "  ".k."\t".v."\n")
    endfor
    let msel = get(methods, input('Choose a method: '.join(methods_menu).'? '))
    return msel
endfunction

let g:unite_source_menu_menus.colorv = {
    \ 'description' : '         color management
        \                                      ⌘ [space]c',
    \}
let g:unite_source_menu_menus.colorv.command_candidates = [
    \['▷ open colorv                                                ⌘ ,cv',
        \'ColorV'],
    \['▷ open colorv with the color under the cursor                ⌘ ,cw',
        \'ColorVView'],
    \['▷ preview colors                                             ⌘ ,cpp',
        \'ColorVPreview'],
    \['▷ color picker                                               ⌘ ,cd',
        \'ColorVPicker'],
    \['▷ edit the color under the cursor                            ⌘ ,ce',
        \'ColorVEdit'],
    \['▷ edit the color under the cursor (and all the concurrences) ⌘ ,cE',
        \'ColorVEditAll'],
    \['▷ insert a color                                             ⌘ ,cii',
        \'exe "ColorVInsert " .GetColorFormat()'],
    \['▷ color list relative to the current                         ⌘ ,cgh',
        \'exe "ColorVList " .GetColorMethod() "
        \ ".input("number of colors? (optional): ")
        \ " ".input("number of steps?  (optional): ")'],
    \['▷ show colors list (Web W3C colors)                          ⌘ ,cn',
        \'ColorVName'],
    \['▷ choose color scheme (ColourLovers, Kuler)                  ⌘ ,css',
        \'ColorVScheme'],
    \['▷ show favorite color schemes                                ⌘ ,csf',
        \'ColorVSchemeFav'],
    \['▷ new color scheme                                           ⌘ ,csn',
        \'ColorVSchemeNew'],
    \['▷ create hue gradation between two colors',
        \'exe "ColorVTurn2 " " ".input("Color 1 (hex): ")
        \" ".input("Color 2 (hex): ")'],
    \]
nnoremap <silent>[menu]c :Unite -silent menu:colorv<CR>
" }}}

" vim menu {{{
let g:unite_source_menu_menus.vim = {
    \ 'description' : '            vim
        \                                                   ⌘ [space]v',
    \}
let g:unite_source_menu_menus.vim.command_candidates = [
    \['▷ choose colorscheme',
        \'Unite colorscheme -auto-preview'],
    \['▷ mappings',
        \'Unite mapping -start-insert'],
    \['▷ edit configuration file (vimrc)',
        \'edit $MYVIMRC'],
    \['▷ choose filetype',
        \'Unite -start-insert filetype'],
    \['▷ vim help',
        \'Unite -start-insert help'],
    \['▷ vim commands',
        \'Unite -start-insert command'],
    \['▷ vim functions',
        \'Unite -start-insert function'],
    \['▷ vim runtimepath',
        \'Unite -start-insert runtimepath'],
    \['▷ vim command output',
        \'Unite output'],
    \['▷ unite sources',
        \'Unite source'],
    \['▷ kill process',
        \'Unite -default-action=sigkill -start-insert process'],
    \['▷ launch executable (dmenu like)',
        \'Unite -start-insert launcher'],
    \]
nnoremap <silent>[menu]v :Unite menu:vim -silent -start-insert<CR>
" }}}

" db menu {{{
let g:unite_source_menu_menus.db = {
    \ 'description' : '             database (SQL)
        \                                        ⌘ [space]S',
    \}
let g:unite_source_menu_menus.db.command_candidates = [
    \['▷ Execute SQL',
        \'exe "DBExecSQL" " ".input("SQL?: ")'],
    \['▷ Execute SQL (with limit of n rows)',
        \'exe "DBExecSQL" " ".input("SQL?: ")'],
    \['▷ SQL SELECT statement',
        \'exe "Select" " ".input("SELECT ")'],
    \['▷ SQL UPDATE statement',
        \'exe "Update" " ".input("UPDATE")'],
    \['▷ SQL INSERT statement',
        \'exe "Insert" " ".input("INSERT")'],
    \['▷ SQL DELETE statement',
        \'exe "Delete" " ".input("DELETE")'],
    \['▷ SQL CALL statement',
        \'exe "Call" " ".input("CALL")'],
    \['▷ SQL DROP statement',
        \'exe "Drop" " ".input("DROP")'],
    \['▷ SQL ALTER statement',
        \'exe "Alter" " ".input("ALTER")'],
    \['▷ SQL CREATE statement',
        \'exe "Create" " ".input("CREATE")'],
    \['▷ List all Tables                                            ⌘ ,Slt',
        \'DBListTable'],
    \['▷ List all Procedures                                        ⌘ ,Slp',
        \'DBListProcedure'],
    \['▷ List all Views                                             ⌘ ,Slv',
        \'DBListView'],
    \['▷ List all Variables                                         ⌘ ,Svr',
        \'DBListVar'],
    \['▷ DBext Get Options',
        \'DBGetOption'],
    \['▷ DBext Set Option',
        \'exe "DBSetOption" " ".input("Option: ")'],
    \['▷ DBext Set Var',
        \'exe "DBSetVar" " ".input("Var: ")'],
    \['▷ DBext Set Buffer Parameters',
        \'DBPromptForBufferParameters'],
    \['▷ List all Connections       (only DBI/ODBC)',
        \'DBListConnections'],
    \['▷ Commit                     (only DBI/ODBC)',
        \'DBCommit'],
    \['▷ Rollback                   (only DBI/ODBC)',
        \'DBRollback'],
    \['▷ Connect                    (only DBI/ODBC)',
        \'DBConnect'],
    \['▷ Disconnect                 (only DBI/ODBC)',
        \'DBDisconnect'],
    \]

nnoremap <silent>[menu]S :Unite menu:db -silent -winheight=25 -start-insert<CR>

" }}}

" }}}

call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_mru,file_rec,file_rec/async,grep,locate',
            \ 'ignore_pattern', join(['\.git/', 'tmp/', 'bundle/'], '\|'))

let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 0
let g:unite_enable_short_source_mes = 0
let g:unite_force_overwrite_statusline = 0
let g:unite_prompt = '>>> '
let g:unite_marked_icon = '✓'
" let g:unite_candidate_icon = '∘'
let g:unite_winheight = 15
let g:unite_update_time = 200
let g:unite_split_rule = 'botright'
let g:unite_data_directory = $HOME.'/.vim/tmp/unite'
let g:unite_source_buffer_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_file_mru_time_format = '(%d-%m-%Y %H:%M:%S) '
let g:unite_source_directory_mru_time_format = '(%d-%m-%Y %H:%M:%S) '

if executable('ag')
    let g:unite_source_grep_command='ag'
    let g:unite_source_grep_default_opts='--nocolor --nogroup -a -S'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
elseif executable('ack')
    let g:unite_source_grep_command='ack'
    let g:unite_source_grep_default_opts='--no-group --no-color'
    let g:unite_source_grep_recursive_opt=''
    let g:unite_source_grep_search_word_highlight = 1
endif

let g:junkfile#directory=expand($HOME."/.vim/tmp/junk")

" }}}

" Utl {{{

map <Leader>j :Utl <CR><Bar>:redraw!<CR>

let g:utl_cfg_hdl_scm_http_system = "silent !firefox %u &"
let g:utl_cfg_hdl_mt_application_pdf = 'silent :!zathura %p &'
let g:utl_cfg_hdl_mt_image_jpeg = 'silent :!sxiv %p &'
let g:utl_cfg_hdl_mt_image_gif = 'silent :!sxiv %p &'
let g:utl_cfg_hdl_mt_image_png = 'silent :!sxiv %p &'

" }}}

" VimFiler {{{

nnoremap <silent><Leader>X :VimFiler<CR>

let g:vimfiler_as_default_explorer = 1

let g:vimfiler_tree_leaf_icon = '├'
let g:vimfiler_tree_opened_icon = '┐'
let g:vimfiler_tree_closed_icon = '─'
let g:vimfiler_file_icon = '┄'
let g:vimfiler_marked_file_icon = '✓'
let g:vimfiler_readonly_file_icon = '✗'

let g:vimfiler_force_overwrite_statusline = 0

let g:vimfiler_time_format = '%d-%m-%Y %H:%M:%S'
let g:vimfiler_data_directory = $HOME.'/.vim/tmp/vimfiler'

" }}}

" Vim-markdown-extra-preview {{{

" map <LocalLeader>mp :Me<CR>
" map <LocalLeader>mr :Mer<CR>

" let g:VMEPextensions = ['extra', 'codehilite']
" let g:VMEPhtmlreader= '/usr/bin/chromium'

" }}}

" vimux {{{

let g:VimuxUseNearestPane = 1

map <Leader>rr :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;python2 '.bufname("%"))<CR>
map <Leader>r3 :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;python3 '.bufname("%"))<CR>
map <Leader>rt :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;time python2 '.bufname("%"))<CR>
map <Leader>rp :call VimuxRunCommand('clear;cd '.expand("%:p:h") .' ;time pypy '.bufname("%"))<CR>

map <Leader>rc :VimuxPromptCommand<CR>
map <Leader>rl :VimuxRunLastCommand<CR>
map <Leader>rs :VimuxInterruptRunner<CR>
map <Leader>ri :VimuxInspectRunner<CR>
map <Leader>rq :VimuxCloseRunner<CR>

" }}}

" Vinarise {{{

map <F6> :Vinarise<CR>

let g:vinarise_enable_auto_detect = 1

au FileType vinarise let g:airline_section_warning = ''

" }}}

" Virtualenv {{{

let g:virtualenv_auto_activate = 1
let g:virtualenv_stl_format = '(%n)'

" }}}

" winresizer {{{

let g:winresizer_start_key = '<C-C><C-W>'
" cancelar pulsando ESC
" let g:winresizer_finish_with_escape = 1
let g:winresizer_keycode_finish = 27

" }}}

" zoomwintab {{{

map <Leader>z :ZoomWinTabToggle<CR>

" }}}

" END PLUGINS SETUP }}}

" FILETYPES  {{{ ==============================================================

" DJANGO HTML (Templates) {{{

au BufRead,BufNewFile */templates/*.html setlocal filetype=htmldjango.html

" }}}

" JSON {{{ -------------------------------------------------------------------

augroup json_autocmd
  autocmd FileType json set foldmethod=syntax
augroup END

" }}}

" LUA {{{

au BufRead,BufNewFile rc.lua setlocal foldmethod=marker

" }}}

" PYTHON {{{

au FileType python setlocal foldlevel=1000

" }}}

" MARKDOWN {{{

" markdown filetype file
au BufRead,BufNewFile *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=markdown
autocmd FileType markdown NeoBundleSource vim-markdown
autocmd FileType markdown NeoBundleSource vim-markdown-extra-preview

" }}}

" RUBY {{{

au FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2

" }}}

" Ronny
" JAVASCRIPT {{{

au FileType javascript setlocal tabstop=2 softtabstop=2 shiftwidth=2

" }}}

" SQL {{{

autocmd FileType sql DBCheckModeline

" }}}

" END FILETYPES }}}

" Other Customizations {{{ ====================================================

let s:vimcustomfile = $HOME.'/.vim/custom.vim'

if filereadable(s:vimcustomfile)
    exec 'source '.s:vimcustomfile
endif

" }}}

" vim:foldmethod=marker
" Ronny
" Ronny
" Se debe agregar, para quitar el problema
" link http://unix.stackexchange.com/questions/72086/ctrl-s-hang-terminal-emulator
"so as not to be disturbed by Ctrl-S ctrl-Q in terminals:
"stty -ixon
map <C-s> :w <CR>
map <F8> :q <CR>
map <F9> :w <CR>
imap <F9> <ESC> :w <CR>
map <F12> :NERDTreeToggle<CR>
map <F10> :Unite buffer<CR>
map <F7> :Goyo<CR>
let g:goyo_width=105
" Conf Ronny, eruby
autocmd BufNewFile,BufRead *.html.erb set filetype=html.eruby
autocmd BufNewFile,BufRead *.rb UltiSnipsAddFiletypes rails.ruby
" autocmd BufNewFile,BufRead *.rb set filetype=rails.ruby
nmap <C-F>f <Plug>CtrlSFPrompt
"Probando
" Maps Alt-[h,j,k,l] to resizing a window split
map ħ <C-w><
map & <C-w>-
map ĸ <C-w>+
map ł <C-w>>
" Alt t
let g:tagbar_autofocus= 1
map ŧ :TagbarOpen fjc <cr>
nnoremap þ :call QuickTabToggle()<cr>

let g:tab_is_next= 0

function! QuickTabToggle()
    if g:tab_is_next
        tabn
        let g:tab_is_next= 0
    else
        tabp
        let g:tab_is_next= 1
    endif
endfunction
"
" Transparencia
" fuente: http://blog.desdelinux.net/la-configuracion-para-vim-definitiva/
" Para el resaltado de la linea que tiene el foco
"hi CursorLine guifg=NONE guibg=#121212 gui=NONE ctermfg=NONE ctermbg=NONE cterm=BOLD
"hi CursorColumn guifg=NONE guibg=#121212 gui=NONE ctermfg=NONE ctermbg=NONE cterm=BOLD
"colorscheme slate "Anterior
let g:base16_shell_path="/home/ronny/.ronny/_ins/vim/base16-shell"
let base16colorspace=256
set t_Co=256
set background=dark
" colorscheme base16-tomorrow
" colorscheme BusyBee_2_transparency
" set background=dark            " set a dark background
highlight clear SignColumn
set nu
" Usa un motor de expresiones regulares anterior, que es mas eficaz, a la hora
" del resaltado de sintaxis con ruby :D, porque ya se me hacía algo lento!
set re=1
" Corrijo error de pintado de background, no se hacía completamente
set t_ut=
" Vim no soporta fish, como shell
set shell=/bin/zsh
" https://www.destroyallsoftware.com/file-navigation-in-vim.html
" Sizes, setea dimensiones al cambiar de ventanas
" set winwidth=90
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set will
" fail.
"set winheight=999
" set winheight=25
" set winminheight=5
" Por defecto winheight=1, winwidth=20, winminwidth=1, winminwidth=1
let g:ronny_use_window_resize= 0

function! Dimensiones2Resize()
    :set winheight=25
    :set winwidth=90
    :set winminwidth=5
    " :set winminheight=1
endfunction

function! Dimensiones2Default()
    :set winheight=1
    :set winwidth=20
    :set winminwidth=1
    :set winminheight=1
endfunction

function! DimensionesToggle()
    if g:ronny_use_window_resize
        let g:ronny_use_window_resize= 0
        :call Dimensiones2Default()
    else
        let g:ronny_use_window_resize= 1
        :call Dimensiones2Resize()
    end
endfunction

map <leader>dt :call DimensionesToggle()<cr>
:call DimensionesToggle()

" Config ctrlp
let g:ctrlp_match_window = 'botton,order:btt,min:1,max:25,results:25'
let g:ctrlp_use_caching = 0
"""""""""""""""""""""""""""""""""""
" CtrlP Config ( Ronny 05/feb/2017
"
"""""""""""""""""""""""""""""""""""
"
"  Ignore for nodejs
set wildignore+=*/node_modules/*
"  Ignore for Laravel
set wildignore+=*/vendor/*
" https://www.destroyallsoftware.com/file-navigation-in-vim.html
" Tomo la idea que en el link hace con CommandT, el original era con 'g'
" pero este prefijo lo esta usando git, ex: gs : git status
" Cambiado para laravel 30/ene/2017
"
if findfile('Gemfile', '.') == "Gemfile"
" Rails
    map <leader>pv :CtrlP<cr>app/views/
    map <leader>pc :CtrlP<cr>app/controllers/
    map <leader>pm :CtrlP<cr>db/migrate/
    map <leader>pM :CtrlP<cr>app/models/

    map <leader>ph :CtrlP<cr>app/helpers/
    map <leader>pS :CtrlP<cr>app/assets/
    map <leader>ps :CtrlP<cr>spec/
    map <leader>pa :CtrlP<cr>spec/factories
    map <leader>pf :CtrlP<cr>spec/features
    map <leader>pr :topleft :split config/routes.rb<cr>
    map <leader>pg :topleft 100 :split Gemfile<cr>

else
" Laravel

    map <leader>pv :CtrlP<cr>resources/views/
    map <leader>pc :CtrlP<cr>app/Http/Controllers/
    map <leader>pm :CtrlP<cr>database/migrations
    map <leader>pF :CtrlP<cr>database/factories
    map <leader>pM :CtrlP<cr>app/
endif
" provoca error, al buscar app/COntrollers?
map <leader>Lo :colorscheme base16-tomorrow<cr>
map <leader>L :colorscheme BusyBee_2_transparency<cr>
map <leader>Lad :colorscheme base16-atelierdune <cr>
map <leader>Laf :colorscheme base16-atelierforest<cr>
map <leader>Lw :set bg=light<cr>
map <leader>r :NERDTreeFind<cr>
let g:vitality_always_assume_iterm = 1
" Remapeo <leader>n , antes era:
" E492: No es una orden del editor PymodeLint
map <leader>n :nohl<cr>
" Toggle Wrap
map <leader>N :set wrap!<cr>
map <leader>w :w<cr>
map <leader>q :q<cr>
" Ronny::For test
" Corre rspec para el archivo actual
map <leader>t :w \| :!rspec --format=doc % <cr>
map <leader>e :e! <cr>
map <leader>q :q! <cr>
" Corre rspec para todas las pruebas
map <leader>T :w \| :!rspec <cr>
map <leader>Ss :mksession! my_session.vim <cr>
map <leader>Sr :source my_session.vim \| :colorscheme BusyBee_2_transparency <cr>
" colorscheme hybrid
" For rake test
" Rake test con mensajes de error comenzando
" en el encabezado
" map <leader>t :w \| :!rake >&1 > /dev/null \| less -r <cr><cr>
" Simple test
map <leader>t :w \| :!rspec % <cr>
map <leader>T :w \| :!rspec <cr>
" map <leader>T :w \| :!rake 2>&1 > /dev/null \| less -r <cr><cr>
" Buscar las ocurrencias en la linea y reemplazar con 
map <leader>ok :s/*/✔/ \| :nohl<cr>
map <leader>bi  :!bundle install<cr>
map <leader>bil :!bundle install --local<cr>
map <leader>ru :!ruby %<cr>
" Ronny:Easymotion 
" Ver la documentacion la mayoría ya esta incluido! :help easymotion
map <Leader><Leader>l <Plug>(easymotion-lineforward)
" map <Leader><Leader>j <Plug>(easymotion-j)
" map <Leader><Leader>k <Plug>(easymotion-k)
map <Leader><Leader>h <Plug>(easymotion-linebackward)

" map <Leader><Leader>s <Plug>(easymotion-s2)
" map <Leader><Leader>t <Plug>(easymotion-t2)
"
function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>pR :call ShowRoutes()<cr><cr>
map <leader>u :UltiSnipsAddFiletypes rails.ruby <cr>
map gp :tabprevious <cr>
" Android java classpath
let g:syntastic_java_javac_classpath = '/opt/android-sdk/platforms/android-17/android.jar'

autocmd BufNewFile,BufRead *.ron set filetype=ron
" }}}
" Desahabilita automatic checking, deshabilidtado proque hace las lento vim
let g:JSHintUpdateWriteOnly=1
" let g:JSHintHighlightErrorLine=0
let jshint_highlight_color = 'DarkGray'

" autocmd VimEnter,VimLeave * silent !tmux set status
" Copiar y Pegar entre distintas sesiones
" vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
" nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
" map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
" map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P")"
au FileType go nmap <leader>r <Plug>(go-run)

function! DBextPostResult(db_type, buf_nr)
    " If dealing with a MYSQL database
        " Assuming the first column is an integer
        " highlight it using the WarningMsg color
    syn match logWarn '\d\*'
    " hi def link logWarn cyan
    hi logWarn ctermfg=cyan
endfunction
set nowrap 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ignore filetypes from NERDTreeToggle
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeIgnore = ['\.ctxt$', '\.bluej$'] "Filetypes from files bluej

command Hardcopy call Hardcopy()
function! Hardcopy()
  let colors_save = g:colors_name
  colorscheme default
  hardcopy > %.ps
  execute 'colorscheme' colors_save
endfun

if has('termguicolors')
" Cuando activo los 2 (t_8f, t_8b) aparece el código de los colores
" todo se llena de simbolos extranios, caracteres de escape para colores,
" supongo
"  let &t_8f = "\<Esc>[38:2:%lu:%lu:%lum"
"  let &t_8b = "\<Esc>[48:2:%lu:%lu:%lum"
"  let &t_8f = "\[[38:2:%lu:%lu:%lum"
"  let &t_8b = "\[[48:2:%lu:%lu:%lum"
 set termguicolors
"  hi Normal guibg=NONE ctermbg=NONE
 " colorscheme breezy_t_transparente
 colorscheme base16-eighties
endif
noremap <C-a> :CtrlP :pwd
noremap <C-e> :!chmod +x "%" <cr><cr>
map <C-t> :map ,t :!tmux send-keys -t 1 "%" Enter \<lt>cr>\<lt>cr><cr>
" Vim-commentary configs ron
autocmd FileType matlab setlocal commentstring=%\ %s

hi Normal ctermbg=NONE guibg=NONE
hi LineNr ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi CursorLine ctermbg=NONE guibg=NONE cterm=underline gui=underline
hi CursorLine ctermbg=NONE guibg=NONE cterm=underline gui=underline
hi GitGutterAdd ctermbg=NONE guibg=NONE 
hi GitGutterChange ctermbg=NONE guibg=NONE
hi GitGutterDelete ctermbg=NONE guibg=NONE
hi GitGutterChangeDelete ctermbg=NONE guibg=NONE
hi CursorColumnNr ctermbg=NONE guibg=NONE gui=bold cterm=bold
hi CursorLineNr ctermbg=NONE guibg=NONE gui=bold cterm=bold
