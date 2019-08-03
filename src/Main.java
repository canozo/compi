import java.io.FileReader;
import java.io.IOException;

public class Main {

    public static void main(String[] args) {
        try {
            Lexer lexer = new Lexer(new FileReader("input.txt"));
            lexer.yylex();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
