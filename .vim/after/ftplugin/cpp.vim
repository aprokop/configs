runtime c.vim

iabbrev <buffer> jci const_iterator
iabbrev <buffer> jit iterator
iabbrev <buffer> jns namespace
iabbrev <buffer> jpr private
iabbrev <buffer> jpu public
iabbrev <buffer> jpro protected
iabbrev <buffer> jsc std::cout <<
iabbrev <buffer> jse std::endl
iabbrev <buffer> jsl std::list
iabbrev <buffer> jsm std::map
iabbrev <buffer> jso std::ostream
iabbrev <buffer> jss std::string
iabbrev <buffer> jsv std::vector
iabbrev <buffer> jsp std::pair
iabbrev <buffer> jssh std::tr1::shared_ptr
iabbrev <buffer> jty typedef
iabbrev <buffer> jun using namespace
iabbrev <buffer> jvi virtual

" Easily switch between source and header file
au! BufEnter *.C,*.cc,*.cpp,*.cxx let b:fswitchdst = 'h,hpp,hxx' | let b:fswitchlocs = '../inc'
au! BufEnter *.h,*.hpp,*.hxx let b:fswitchdst = 'cc,cpp,cxx,C,c' | let b:fswitchlocs = '../inc'
au! BufEnter *_decl.hpp let b:fswitchdst = '_def.hpp'
nmap ,s :FSHere<CR>

function! SSH(filename)
    " update!
    if (expand(a:filename) =~ "_decl.hpp$")
        let l:v =  substitute(expand("%"), "_decl.hpp", "_def.hpp", "")
    elseif (expand(a:filename) =~ "_def.hpp$")
        let l:v = substitute(expand("%"), "_def.hpp", "_decl.hpp", "")
    endif
    return l:v
endfunction
nmap ,S :exec "edit " . SSH('%')<CR>

" For some reason, Syntastic does not work properly with c files for me
" This is a workaround for that
au! BufWritePost *.cc,*.cpp,*.C,*.hpp SyntasticCheck gcc