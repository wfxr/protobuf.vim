" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

setl comments=s1:/*,mb:*,ex:*/,://

syn case match

syn keyword pbTodo contained TODO FIXME BUG XXX
syn cluster pbCommentGroup contains=pbTodo

syn keyword pbSyntax  syntax
syn keyword pbImport  import
syn keyword pbPackage package
syn keyword pbOption  option

syn keyword pbOneof    oneof
syn keyword pbTypeDecl service message nextgroup=pbTypeName
syn keyword pbEnumDecl enum contained nextgroup=pbTypeName

syn keyword pbModifier optional required repeated group

syn keyword pbDefault default
syn keyword pbExtend  extend extensions to max reserved
syn keyword pbRPCDecl rpc nextgroup=pbFuncName
syn keyword pbReturns returns
syn keyword pbStream  stream

syn keyword pbType int32 int64 uint32 uint64 sint32 sint64
syn keyword pbType fixed32 fixed64 sfixed32 sfixed64
syn keyword pbType float double bool string bytes
syn keyword pbBool true false
syn keyword pbMap  map

syn match pbInt       /-\?\<\d\+\>/
syn match pbInt       /\<0[xX]\x+\>/
syn match pbFloat     /\<-\?\d*\(\.\d*\)\?/
syn match pbKey       /\w\+\:/
syn match pbFuncName  /\s\+\w\+/ contained skipwhite skipnl
syn match pbTypeName  /\s\+\w\+/ contained skipwhite skipnl
syn match pbEnumField /^\s*\w\+/ contained skipwhite skipnl

syn region pbComment  start="\/\*"             end="\*\/" contains=@pbCommentGroup,@Spell
syn region pbComment  start="//"               skip="\\$" end="$" keepend contains=@pbCommentGroup,@Spell
syn region pbString   start=/"/                skip=/\\./ end=/"/ contains=@Spell
syn region pbString   start=/'/                skip=/\\./ end=/'/ contains=@Spell
syn region pbFunction start=/rpc\s/            end=/$/    contains=pbFuncName
syn region pbEnum     start=/enum\s\+\w\+\s*{/ end=/}/    contains=pbEnumField,pbEnumDecl


command -nargs=+ HiLink hi def link <args>

HiLink pbTodo    Todo
HiLink pbComment Comment

HiLink pbImport  Include
HiLink pbSyntax  Keyword
HiLink pbPackage Statement
HiLink pbOption  Operator

HiLink pbOneof    Structure
HiLink pbTypeDecl Keyword
HiLink pbEnumDecl Keyword

HiLink pbModifier StorageClass
HiLink pbRPCDecl  Structure
HiLink pbStream   Structure
HiLink pbReturns  Special

HiLink pbKey       Identifier
HiLink pbFuncName  Function
HiLink pbTypeName  Type
HiLink pbDefault   Tag
HiLink pbExtend    Tag
HiLink pbType      Type
HiLink pbBool      Boolean
HiLink pbInt       Number
HiLink pbFloat     Float
HiLink pbString    String
HiLink pbMap       Type
HiLink pbEnumField Constant

delcommand HiLink

let b:current_syntax = "proto"
" vim: et sw=2 sts=2
