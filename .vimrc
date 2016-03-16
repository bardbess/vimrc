
" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
filetype indent on
filetype plugin on

let mapleader = " "

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

  syntax enable


" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden             " Hide buffers when they are abandoned
set mouse=r            " Enable mouse usage (all modes)
set number
set cursorline          " Highlights the currently focused line
set spell

set relativenumber

" For indentation without tabs
set expandtab
set shiftwidth=2
set softtabstop=2


" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

set backup
" where to put backup file (don't forget to make a backup directory)
set backupdir=/var/tmp/vimbackups
" directory is the directory for temp file
set directory=~/tmp,/var/tmp,/tmp

" Horizontal line to set character width"
highlight OverLength ctermfg=darkgrey
match OverLength /\%>99v.\+/

" Gutter background color
highlight LineNr ctermbg=darkgrey

" Highlight current line bg color
hi CursorLine ctermbg=darkgrey cterm=NONE

" resize windows with shift + arrow keys
"
"" Window resizing mappings /*{{{*/
nnoremap <c-h> 3<C-w><
nnoremap <c-j> 3<C-w>-
nnoremap <c-k> 3<C-w>+
nnoremap <c-l> 3<C-w>>

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

nnoremap <up> <c-v>

cnoremap %% <C-R>=expand('%:h').'/'<cr>

" make W save as well as w
command W w
command Wq wq

" taglist
let Tlist_Use_Right_Window = 1
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Highlight_Tag_On_BufEnter = 1
let Tlist_Show_One_File = 1
let Tlist_Auto_Open = 1
let Tlist_Auto_Update = 1
let Tlist_Auto_Update = 1
let Tlist_Exit_OnlyWindow = 1
nnoremap <silent> <F4> :TlistToggle<CR>


"control-t
set wildmode=longest,list
set wildignore+=vendor/*,.git,private/*,public/images/*,script/*,spec/*,test/*,tmp/*,doc/*,public/schema_diagrams/*,*.png,*.dot,*.html,*.pdf,*.xml,public/email_attachment/*,*.jpg,db/*,*~,*xsl,*rtf,db/db_code/*,db/disable_constraints.sql,db/migrate/*,db/schema.rb,db/seeds.rb,db/upgrade/*
let g:CommandTNeverShowDotFiles = 1
let g:CommandTMaxFiles=2000


" removing date to make more room
"set statusline=%<%F%h%m%r%h%w%y\ %{&ff}\ \ \ [%{fugitive#statusline()}]\ \ \ %{strftime(\"%c\",getftime(expand(\"%:p\")))}%=\ lin:%l\,%L\ col:%c%V\ pos:%o\ ascii:%b\ %P
"set statusline=%<%f\ \ %{fugitive#statusline()}\ %{strftime(\"%H:%M\ %d\-%b\",getftime(expand(\"%:p\")))}%=\ lin:%l\ col:%c%V\ %P
" now set it up to change the status color line based on mode
"if version >= 700
"  au InsertEnter * hi StatusLine term=reverse ctermbg=5 gui=undercurl guisp=Magenta
"  au InsertLeave * hi StatusLine term=reverse ctermfg=0 ctermbg=2 gui=bold,reverse
"endif



" 'x only takes you to row, `x takes you to row + col
nnoremap ' `
nnoremap ` '

" Fix highlighting for spell checking
highlight clear SpellBad
highlight SpellBad term=standout term=underline,bold cterm=underline,bold
"highlight SpellBad term=standout ctermfg=3 term=underline,bold cterm=underline,bold
highlight clear SpellCap
highlight SpellCap term=underline cterm=underline
highlight clear SpellRare
highlight SpellRare term=underline cterm=underline
highlight clear SpellLocal
highlight SpellLocal term=underline cterm=underline

" Auto complete colors
"highlight Pmenu ctermbg=3
"highlight PmenuSe1 ctermbg=3
highlight Pmenu ctermbg=1
highlight PmenuSel ctermfg=0



" jump back to old position when opening file - used for irb
if has("autocmd")
  " Enable filetype detection
  filetype plugin indent on
 
  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" call pathogen#infect()
" call pathogen#helptags()

" Powerline vim plugin for fancy styling
"let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set nocompatible
set laststatus=2 
set t_Co=256

" ruby debugger has crap default - conflicks with control-t
"map <Leader>bt  :call g:RubyDebugger.open_frames()<CR>
"
"
" relative line numbers
