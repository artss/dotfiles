" Vim syntax file
" Language:     PHP Templates (Solarphp, PHPSavant etc...)
" Maintainer:   Giuliani Sanches (giulianit at gmail dot com)
" URL:          http://giulianisanches.blogspot.com
" Last Change:  2007 Novembro 20
" Version:	0.1.2
"
" ###################################################################################################
" Based on Armin Ronacher mako.vim syntax file (http://www.vim.org/scripts/script.php?script_id=1858)
" ###################################################################################################
"
" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = "html"
endif

"Source the html syntax file
ru! syntax/html.vim
unlet b:current_syntax

"Put the php syntax file in @phpTop
syn include @phpTop syntax/php.vim

" Block rules
syn region phpBlock start=#<?php# end=#?># keepend contains=@phpTop

" Default highlighting links
if version >= 508 || !exists("did_php_syn_inits")
  if version < 508
    let did_php_syn_inits = 1
    com -nargs=+ HiLink hi link <args>
  else
    com -nargs=+ HiLink hi def link <args>
  endif

  delc HiLink
endif

let b:current_syntax = "html"
