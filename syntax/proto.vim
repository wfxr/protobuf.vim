" Quit when a (custom) syntax file was already loaded
if exists("b:current_syntax")
  finish
endif

syn case match

syn keyword pbTodo contained TODO FIXME BUG XXX
syn cluster pbCommentGroup contains=pbTodo

syn keyword pbSyntax  syntax
syn keyword pbImport  import
syn keyword pbPackage package
syn keyword pbOption  option

syn keyword pbOneof   oneof
syn keyword pbMessage message
syn keyword pbService service

syn keyword pbModifier optional required repeated group

syn keyword pbDefault default
syn keyword pbExtend  extend extensions to max reserved
syn keyword pbRPC     rpc
syn keyword pbReturns returns
syn keyword pbStream  stream

syn keyword pbType      int32 int64 uint32 uint64 sint32 sint64
syn keyword pbType      fixed32 fixed64 sfixed32 sfixed64
syn keyword pbType      float double bool string bytes
syn keyword pbTypedef   enum
syn keyword pbBool      true false

syn match pbInt   /-\?\<\d\+\>/
syn match pbInt   /\<0[xX]\x+\>/
syn match pbFloat /\<-\?\d*\(\.\d*\)\?/
syn match pbKey   /\w\+\:/

syn region  pbComment start="\/\*" end="\*\/" contains=@pbCommentGroup
syn region  pbComment start="//" skip="\\$" end="$" keepend contains=@pbCommentGroup
syn region  pbString  start=/"/ skip=/\\./ end=/"/
syn region  pbString  start=/'/ skip=/\\./ end=/'/


command -nargs=+ HiLink hi def link <args>

HiLink pbTodo    Todo
HiLink pbComment Comment

HiLink pbImport  Include
HiLink pbSyntax  Identifer
HiLink pbPackage Statement
HiLink pbOption  Function

HiLink pbOneof   Structure
HiLink pbMessage Structure
HiLink pbService Typedef

HiLink pbModifier StorageClass

HiLink pbRPC     Structure
HiLink pbStream  Structure
HiLink pbReturns Keyword

HiLink pbKey       Special
HiLink pbDefault   Keyword
HiLink pbExtend    Keyword
HiLink pbType      Type
HiLink pbTypedef   Typedef
HiLink pbBool      Boolean

HiLink pbInt       Number
HiLink pbFloat     Float
HiLink pbString    String

delcommand HiLink

let b:current_syntax = "proto"
