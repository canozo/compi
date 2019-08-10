package tarea1;

%%

%unicode
%int
%class LexerP
%state PARAGRAPH
%state SKIP

%{
  StringBuffer string = new StringBuffer();
%}

paragraphB = [a-zA-Z]
paragraphE = \r|\n|\r\n

%%

<YYINITIAL> {
  {paragraphB} { string.setLength(0); string.append(yytext()); yybegin(PARAGRAPH); }
  {paragraphE} {  }
  .            { yybegin(SKIP); }
}

<PARAGRAPH> {
  {paragraphE} {
    yybegin(YYINITIAL);
    System.out.println("Parrafo: " + string.toString());
  }
  . { string.append(yytext()); }
}

<SKIP> {
  {paragraphE} { yybegin(YYINITIAL); }
  .            {  }
}
