" Vim syntax file
" Language: eZ Publish INI
" Maintainer:   damien pobel dpobel@free.fr
" Last Change:  Mon Jan  16 21:41:23 CET 2009
" Filenames:    *.ini, *.ini.append, *.ini.append.php
" URL:      http://projects.ez.no/ezvim

if exists("b:current_syntax")
   finish
endif

syn case ignore

syn match  ezpiniLabel      "^.\{-}="
syn match  ezpiniLabel      "^.\{-}\[\]$"
syn region ezpiniHeader     start="^\[" end="\]"
syn match  ezpiniComment    "^[;#].*$"


" PHP stuff around ini data
syn match ezpiniPHP         "^<?php.*"
syn match ezpiniPHP         ".*?>"
syn match ezpiniPHP         "/\*.*"
syn match ezpiniPHP         ".*\*/"



" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
  if version < 508
    let did_ezpini_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

    HiLink ezpiniHeader Special
    HiLink ezpiniComment    Comment
    HiLink ezpiniLabel  Type

    HiLink ezpiniPHP PreProc

  delcommand HiLink

let b:current_syntax = "ezpini"

" vim:ts=4
