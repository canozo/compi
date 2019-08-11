package tarea2.ejercicio2;

%%

%unicode
%int
%public
%line
%column
%class Lexer
%state PERSONA

%{
  private StringBuffer infoPersona = new StringBuffer();
  public static String archivoInput = "inputs/personas.txt";
%}

%eof{
  // imprimir la ultima persona si queda
  System.out.println(infoPersona.toString());
%eof}

nombre = [a-zA-Z]+
nombreE = (" "{nombre})?
nombreCompleto = {nombre}{nombreE}{nombreE}{nombreE}

salario = [0-9]+"."[0-9][0-9]

fechaNacimiento = [0-9][0-9]"/"[0-9][0-9]"/"[0-9][0-9][0-9][0-9]

persona = {nombreCompleto}{salario}?{fechaNacimiento}?

finParrafo = \r|\n|\r\n

%%

<YYINITIAL> {
  {persona} {
          yypushback(yylength());
          yybegin(PERSONA);
      }
  .         { }
}

<PERSONA> {
  {nombreCompleto}  {
          if (infoPersona.length() == 0) {
              infoPersona.append("Nombre: " + yytext() + "\n");
          } else {
              // ya encontro un nombre, es otra persona
              System.out.println(infoPersona.toString());
              infoPersona.setLength(0);
              yypushback(yylength());
              yybegin(YYINITIAL);
          }
      }
  {salario}         { infoPersona.append("Salario: " + yytext() + "\n"); }
  {fechaNacimiento} { infoPersona.append("Fecha: " + yytext() + "\n"); }
}

[^] {
  System.out.println("Error!");
  System.out.println("Linea " + yyline);
  System.out.println("Columna " + yycolumn);
  System.out.println("Input " + yytext());

  throw new Error("Error, caracter ilegal!");
}
