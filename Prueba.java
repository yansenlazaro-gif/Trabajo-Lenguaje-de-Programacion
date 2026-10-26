import java.io.StringReader;

public class Prueba {
    public static void main(String[] args) {
        String[] pruebas = (args.length > 0) ? args : new String[] {
            "3 + 4",
            "(3 + 4) * 5",
            "a * (b - 2) / 7",
            "10 / 2 - 3",
            "x1 + y2 * 3.5",
            "3 + * 4",
            "(3 + 4",
            "3 4",
            "+ 5",
            "3 + 4 )",
            "2 $ 3"
        };

        for (String expresion : pruebas) {
            System.out.println("Expresión: " + expresion);
            try {
                Parser p = new Parser(new Lexer(new StringReader(expresion)));
                p.parse();
            } catch (Throwable t) {
                System.out.println("  -> Expresión INVÁLIDA (" + t.getMessage() + ")");
            }
        }
    }
}
