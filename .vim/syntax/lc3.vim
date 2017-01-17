" Vim syntax file
" Language: LC3 Assembly
" Maintainer: Copywright 2017 Nathaniel Bleier, all rights reserved. 
" Latest Revision: 13 JAN 17

if exists("b:current_syntax")
  finish
endif

" Keywords
syn keyword instructions ADD AND LD LDI LDR LEA NOT ST STI STR TRAP GETC OUT PUTS IN PUTSP HALT
syn keyword regs R1 R2 R3 R4 R5
syn keyword specialRegs R0 R6 R7
syn keyword psuedoOps ORIG END FILL BLKW STRINGZ
syn keyword jumps BR JMP RET JSR JSRR

" Matches
syn match coms / ;.*/
" syn match nums /\v[#|x]\d+/
syn match branch /\v\sBR[n|p|z]{0,3}\s/

" Highlighting
hi link instructions Operator
hi link regs StorageClass
hi link specialRegs Special
hi link coms Comment
hi link psuedoOps PreProc
hi link nums Number
hi link jumps Float
hi link branch Float

let b:current_syntax = "lc3"
