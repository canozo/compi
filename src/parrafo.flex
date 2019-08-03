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
paragraphE = \n

%%

<YYINITIAL> {
  {paragraphB} { string.setLength(0); yybegin(PARAGRAPH); }
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
