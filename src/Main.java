import java.io.FileReader;
import java.io.IOException;

public class Main {

    public static void main(String[] args) {
        try {
            LexerP lexer = new LexerP(new FileReader("parrafos.txt"));
            lexer.yylex();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
