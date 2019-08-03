%%

%unicode
%int
%class Lexer

letra = [a-zA-Z]
num = [0-9]
espacio = [ \n\r\t]

title = <title>({letra}|{num}|{espacio})*<\/title>

%%

<YYINITIAL> {
  {title} { System.out.println("Titulo: " + yytext().substring(7, yytext().length() - 8)); }
  .       { }
}
