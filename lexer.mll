{
  exception Eof
  exception SyntaxError of string
}

  rule translate = parse
| [' ' '\t' '\r' '\n'] { translate lexbuf }
| '(' { LPAREN }
| ')' { RPAREN }
| "nil" { NIL }
| "true" { TRUE }
| "false" { FALSE }
| ['0'-'9']+ as s { INTEGER(int_of_string s) }
| \"['*']+\" as s { STRING(s) }
| ['a'-'z' 'A'-'Z' '*']+ as s { ID(s)}
| eof { raise Eof }
