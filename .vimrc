" .vimrc
set encoding=utf-8

" load up pathogen and all bundles
call pathogen#infect()
call pathogen#helptags()

syntax on                         " show syntax highlighting
filetype plugin indent on
set autoindent                    " set auto indent
set ts=2                          " set indent to 2 spaces
set shiftwidth=2
set expandtab                     " use spaces, not tab characters
set nocompatible                  " don't need to be compatible with old vim
if has("autocmd")
  filetype indent plugin on
endif

set relativenumber                " show relative line numbers
set number                        " show current line number

" MJS another hack since
" http://stackoverflow.com/questions/9853584/how-to-use-correct-ruby-in-vim-how-to-modify-path-in-vim/12146694#12146694
set shell=/bin/bash

set showmatch                     " show bracket matches
set ignorecase                    " ignore case in search
set hlsearch                      " highlight all search matches
set cursorline                    " highlight current line
set smartcase                     " pay attention to case when caps are used
set incsearch                     " show search results as I type
set ttimeoutlen=100               " decrease timeout for faster insert with 'O'
set vb                            " enable visual bell (disable audio bell)
set ruler                         " show row and column in footer
set scrolloff=2                   " minimum lines above/below cursor
set laststatus=2                  " always show status bar
set list listchars=tab:»·,trail:· " show extra space characters
set nofoldenable                  " disable code folding
set clipboard=unnamed             " use the system clipboard
set wildmenu                      " enable bash style tab completion
set wildmode=list:longest,full
runtime macros/matchit.vim        " use % to jump between start/end of methods

" put git status, column/row number, total lines, and percentage in status
set statusline=%F%m%r%h%w\ %{fugitive#statusline()}\ [%l,%c]\ [%L,%p%%]
" set statusline=%<[%n]\ %F\ %m%r%y\ %{exists('g:loaded_fugitive')?fugitive#statusline():''}\ %=%-14.(%l,%c%V%)\ %P
" silent! if emoji#available()
"   let s:ft_emoji = map({
"     \ 'c':          'baby_chick',
"     \ 'clojure':    'lollipop',
"     \ 'coffee':     'coffee',
"     \ 'cpp':        'chicken',
"     \ 'css':        'art',
"     \ 'eruby':      'ring',
"     \ 'gitcommit':  'soon',
"     \ 'haml':       'hammer',
"     \ 'help':       'angel',
"     \ 'html':       'herb',
"     \ 'java':       'older_man',
"     \ 'javascript': 'monkey',
"     \ 'make':       'seedling',
"     \ 'markdown':   'book',
"     \ 'perl':       'camel',
"     \ 'python':     'snake',
"     \ 'ruby':       'gem',
"     \ 'scala':      'barber',
"     \ 'sh':         'shell',
"     \ 'slim':       'dancer',
"     \ 'text':       'books',
"     \ 'vim':        'poop',
"     \ 'vim-plug':   'electric_plug',
"     \ 'yaml':       'yum',
"     \ 'yaml.jinja': 'yum'
"   \ }, 'emoji#for(v:val)')

"   function! S_filetype()
"     if empty(&filetype)
"       return emoji#for('grey_question')
"     else
"       return get(s:ft_emoji, &filetype, '['.&filetype.']')
"     endif
"   endfunction

"   function! S_modified()
"     if &modified
"       return emoji#for('kiss').' '
"     elseif !&modifiable
"       return emoji#for('construction').' '
"     else
"       return ''
"     endif
"   endfunction

"   function! S_fugitive()
"     if !exists('g:loaded_fugitive')
"       return ''
"     endif
"     let head = fugitive#head()
"     if empty(head)
"       return ''
"     else
"       return head == 'master' ? emoji#for('crown') : emoji#for('dango').'='.head
"     endif
"   endfunction

"   let s:braille = split('"⠉⠒⠤⣀', '\zs')
"   function! Braille()
"     let len = len(s:braille)
"     let [cur, max] = [line('.'), line('$')]
"     let pos  = min([len * (cur - 1) / max([1, max - 1]), len - 1])
"     return s:braille[pos]
"   endfunction

"   hi def link User1 TablineFill
"   let s:cherry = emoji#for('cherry_blossom')
"   function! MyStatusLine()
"     let mod = '%{S_modified()}'
"     let ro  = "%{&readonly ? emoji#for('lock') . ' ' : ''}"
"     let ft  = '%{S_filetype()}'
"     let fug = ' %{S_fugitive()}'
"     let sep = ' %= '
"     let pos = ' %l,%c%V '
"     let pct = ' %P '

"     return s:cherry.' [%n] %F %<'.mod.ro.ft.fug.sep.pos.'%{Braille()}%*'.pct.s:cherry
"   endfunction
"  " Note that the "%!" expression is evaluated in the context of the
"   " current window and buffer, while %{} items are evaluated in the
"   " context of the window that the statusline belongs to.
"   set statusline=%!MyStatusLine()
" endif

" set dark background and color scheme
set background=dark
colorscheme base16-default-dark

" set up some custom colors
highlight clear SignColumn
highlight VertSplit    ctermbg=236
highlight ColorColumn  ctermbg=237
highlight LineNr       ctermbg=236 ctermfg=240
highlight CursorLineNr ctermbg=236 ctermfg=240
highlight CursorLine   ctermbg=236
highlight StatusLineNC ctermbg=238 ctermfg=0
highlight StatusLine   ctermbg=240 ctermfg=12
highlight IncSearch    ctermbg=3   ctermfg=1
highlight Search       ctermbg=1   ctermfg=3
highlight Visual       ctermbg=3   ctermfg=0
highlight Pmenu        ctermbg=240 ctermfg=12
highlight PmenuSel     ctermbg=3   ctermfg=1
highlight SpellBad     ctermbg=0   ctermfg=1

" highlight the status bar when in insert mode
if version >= 700
  au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
  au InsertLeave * hi StatusLine ctermbg=240 ctermfg=12
endif

" highlight trailing spaces in annoying red
highlight ExtraWhitespace ctermbg=1 guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" excludes
set wildignore+=.final_builds/*,*/tmp/*,*/node_modules/*,*.o,*.obj,*.exe,*.so,*.dll,*.pyc,.svn,.hg,.bzr,.git,.sass-cache,*.class,*.scssc,*/Godeps/*


" set leader key to comma
let mapleader = ","

" ctrlp config
let g:ctrlp_map = '<leader>f'
let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|Godeps\'

" use silver searcher for ctrlp
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

" unmap F1 help
nmap <F1> <nop>
imap <F1> <nop>

" unmap ex mode: 'Type visual to go into Normal mode.'
nnoremap Q <nop>

" map . in visual mode
vnoremap . :norm.<cr>

" map markdown preview
map <leader>m :!open -a Marked %<cr><cr>

" map git commands
map <leader>b :Gblame<cr>
map <leader>l :!clear && git log -p %<cr>
map <leader>d :!clear && git diff %<cr>

" map Silver Searcher
map <leader>a :Ag!<space>

" clear the command line and search highlighting
noremap <C-l> :nohlsearch<CR>
nnoremap <silent> <space> :nohlsearch<CR>

" toggle spell check with <F7>
map <F7> :setlocal spell! spelllang=en_us<cr>
imap <F7> <ESC>:setlocal spell! spelllang=en_us<cr>

" add :Plain command for converting text to plaintext
command! Plain execute "%s/’/'/ge | %s/[“”]/\"/ge | %s/—/-/ge"

" hint to keep lines short
if exists('+colorcolumn')
  set colorcolumn=80
endif

" jump to last position in file
autocmd BufReadPost *
  \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal g`\"" |
  \ endif

" multi-purpose tab key (auto-complete)
function! InsertTabWrapper()
  let col = col('.') - 1
  if !col || getline('.')[col - 1] !~ '\k'
    return "\<tab>"
  else
    return "\<c-p>"
  endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper()<cr>
inoremap <s-tab> <c-n>

" rename current file, via Gary Bernhardt
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'))
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>n :call RenameFile()<cr>

function! RunTests(filename)
  " Write the file and run tests for the given filename
  :w
  :silent !clear
  if match(a:filename, '\.feature$') != -1
    exec ":!bundle exec cucumber " . a:filename
  elseif match(a:filename, '_test\.rb$') != -1
    if filereadable("bin/testrb")
      exec ":!bin/testrb " . a:filename
    else
      exec ":!ruby -Itest " . a:filename
    end
  else
    if filereadable("Gemfile")
      exec ":!bundle exec rspec --color " . a:filename
    else
      exec ":!rspec --color " . a:filename
    end
  end
endfunction

function! SetTestFile()
  " set the spec file that tests will be run for.
  let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
  if a:0
    let command_suffix = a:1
  else
    let command_suffix = ""
  endif

  " run the tests for the previously-marked file.
  let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\|_test.rb\)$') != -1
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

" run test runner
map <leader>t :call RunTestFile()<cr>
map <leader>T :call RunNearestTest()<cr>

" OCD remove trailing spaces
noremap <F5> :%s/\s\+$//e<CR>

" disabling as causes issues if pairing
" force me to use h j k l
" noremap <Up>  <Nop>
" noremap <Down>  <Nop>
" noremap <Left>  <Nop>
" noremap <Right>  <Nop>


" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

" 'ervandew/supertab'
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0

" 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"


" fzf
set rtp+=~/.fzf

" Taken from Luan's since its the Pivotal standard
" https://github.com/luan/vimfiles/blob/master/config/plugin/NERDTree.vim
" ---------------
" NERDTree
" ---------------
nnoremap <leader>nn :NERDTreeToggle<CR>
nnoremap \ :NERDTreeToggle<CR>
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap \| :NERDTreeFind<CR>
let g:NERDTreeShowBookmarks=1
let g:NERDTreeChDirMode=2 " Change the NERDTree directory to the root node
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

set completeopt-=preview

" allow cursor to select
set mouse=a

" change the working directory to the directory of the currently open file
nnoremap ,cd :cd %:p:h<CR>
" change the working directory only for the current window
nnoremap ,lcd :lcd %:p:h<CR>

" try FZF vs. ctrlp
nnoremap <leader>F :FZF<CR>
