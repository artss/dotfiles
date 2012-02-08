function! TodoList()
    let bufs = tabpagebuflist()
    perl @bufs = VIM::Buffers();
    perl @strings = ();
    "TODO: find with matchpos
    perl foreach $b (@bufs) {open(B, $b->Name()); @lines=<B>; foreach (0..$#lines) {chomp $lines[$_]; if ($lines[$_] =~ /(TODO|FIXME):/) {push @strings, sprintf("%d:%s:%d    %s", $b->Number, $b->Name, $_+1, $lines[$_]); $n=$n+1;}}; close B;}
    
    10new
    setlocal noswapfile
    perl if (scalar @strings) {$n=2; $curbuf->Append(0, "TODO list"); $curbuf->Append(1, ""); foreach (@strings) {$curbuf->Append($n, $_); $n++}}
    setlocal nomodifiable
    
    map <buffer> <cr> :call TodoJump()<cr>
    map <buffer> <F8> :bd!<cr>
endfunction

function! TodoJump()
    "perl @pos = $curwin->Cursor();
    "perl $line = $curbuf->Get($pos[0]);
    "perl $res = "nores";
    "perl if ($line =~ /(\d+):.+?:(\d)/) {$curbuf->Delete();$res = "$1, $2, $3\n"}
    "perl VIM::Msg($res);
    let res = []
    let line = getline(line("."))
    "TODO: get matched numbers
    let buf = matchstr(line, '\d\+')
    let name = substitute(line, '\d\+:.\{-}:', '', '')
    let l = matchstr(name, '\d\+')
    "let l = matchstr(line, '\d\+')
    "echo [buf, name, l]
    bdelete!
    exec buf."buffer"
    call setpos(".", [buf, l, 1])
endfunction

command! Todo :call TodoList()
