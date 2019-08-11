package tarea2.ejercicio1;

%%

%unicode
%int
%public
%line
%column
%class Lexer

%{
  int contadorNumeros = 0;
  public static String archivoInput = "inputs/parrafos.txt";
%}

%eof{
  System.out.println("Se encontraron " + new Integer(contadorNumeros).toString() + " numeros.");
%eof}

numeroEntero = [0-9]+
numeroDecimal = [0-9]+"."[0-9]+
numero = {numeroEntero}|{numeroDecimal}
finParrafo = \r|\n|\r\n

%%

<YYINITIAL> {
  {numero}     { contadorNumeros++; System.out.println("Numero encontrado: " + yytext()); }
  {finParrafo} { }
  .            { }
}

[^] {
  System.out.println("Error!");
  System.out.println("Linea " + new Integer(yyline).toString());
  System.out.println("Columna " + new Integer(yycolumn).toString());
  System.out.println("Input " + yytext());

  throw new Error("Illegal character");
}
