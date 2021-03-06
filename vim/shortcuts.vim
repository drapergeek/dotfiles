" Hide search highlighting
map <Leader>h :set invhls <CR>

"map over the tcomment command
map <leader>cc :TComment<CR>

"This does tcomment for html
map <leader>ch :TCommentAs html<CR>

"Maps f5 in insert and non insert to indent properly all the code
map   <silent> <F5> mmgg=G'm
imap  <silent> <F5> <Esc> mmgg=G'm

"Git Blame Check
vmap <Leader>b :<C-U>!git blame <C-R>=expand("%:p") <CR> \| sed -n <C-R>=line("'<") <CR>,<C-R>=line("'>") <CR>p <CR>

map <Leader>v :vsp ~/.vimrc<CR>
map <Leader>vb :vsp ~/.vimrc.bundles<CR>
map <Leader>vs :vsp ~/.vim/shortcuts.vim<CR>
nnoremap <C-W>z :call MaximizeToggle()<CR>
map <Leader>g :vsp ~/.gitconfig<CR>
map <Leader>rv :source ~/.vimrc<CR>
map <leader>ts :Tmux bin/test_suite<CR>
":PlugInstall<CR>

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction

map <Leader>q :%s/'/"/gc<CR>
map <leader>m :silent !open -a Markoff %<CR>:redraw!<CR>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Index ctags from any project, including those outside Rails
map <Leader>ct :!ctags -R .<CR>

map <Leader>gr :windo e!<CR>

map <Leader>s :Pad ls<CR>
