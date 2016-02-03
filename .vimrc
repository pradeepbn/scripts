set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=/.fzf
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
set runtimepath+=~/.vim/bundle/ctrlp.vim
set rtp+=~/.vim/plugin

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}
" YCM plugin
Plugin 'Valloric/YouCompleteMe'
" CtrlpTags extenstion
Plugin 'ivalkeen/vim-ctrlp-tjump'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
filetype plugin on
""
"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just
"" :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to
"auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"YouCompleteMe key remap
"let mapleader=""
"nnoremap <leader>g :YcmCompleter GoToDefinition<CR>
"nnoremap <leader>s :YcmCompleter GoToDeclaration<CR>
""nnoremap <leader>t :YcImCompleter GoToImprecise<CR>
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

let g:ycm_extra_conf_globlist = ['~/src/*','~/src-p4/*','~/projects/*','!~/*','!/*']
let g:ycm_filetype_whitelist = { 'cpp': 1, 'c': 1, 'python':1 }
"autocmd FileType c      let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"autocmd FileType cpp      let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'

""CtrlPtags extension
"nnoremap <leader>t :CtrlPtjump<cr> 
"
if has("cscope")
    set csprg=/usr/bin/cscope
    " change this to 1 to search ctags DBs first
"    set csto=0
    autocmd BufNewFile,BufRead *.c set csto=0
    autocmd BufNewFile,BufRead *.cpp set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    " else add database pointed to by environment
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif
    set csverb

    " Using 'CTRL-\' then a search type makes the vim window
    " "shell-out", with search results displayed on the bottom

    nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>

    " Using 'CTRL-spacebar' then a search type makes the vim window
    " split horizontally, with search result displayed in
    " the new window.

    nmap <C-[>s :scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>g :scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>c :scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>t :scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>e :scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <C-[>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-[>d :scs find d <C-R>=expand("<cword>")<CR><CR>

    " Hitting CTRL-space *twice* before the search type does a vertical
    " split instead of a horizontal one

    nmap <C-[><C-[>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <C-[><C-[>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <C-[><C-[>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=70

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END
else
  set autoindent
endif " has("autocmd")

"if has("cscope")
"    " add any cscope database in current directory
"    if filereadable("cscope.out")
"        cs add cscope.out  
"    " else add the database pointed to by environment variable 
"    elseif $CSCOPE_DB != ""
"        cs add $CSCOPE_DB
"    endif
"    " show msg when any other cscope db added
"    set cscopeverbose  
"
"endif

set tabstop=4 shiftwidth=4 expandtab

" Nerd Tree
map<> :NERDTreeToggle<CR>

"Code folding
set foldmethod=indent

"Show func
map  <F7>   <Plug>ShowFunc 
map! <F7>   <Plug>ShowFunc 
