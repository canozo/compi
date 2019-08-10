package tarea1;

%%

%unicode
%int
%class Lexer
%state TITULO

%{
  StringBuffer string = new StringBuffer();
%}

titleB = <title>
titleE = <\/title>

%%

<YYINITIAL> {
  {titleB} { string.setLength(0); yybegin(TITULO); }
  .        { }
}

<TITULO> {
  {titleE} {
    yybegin(YYINITIAL);
    System.out.println("Titulo: " + string.toString());
  }
  .        { string.append(yytext()); }
}
