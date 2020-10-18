package icarolopes.dev.floating_button_java;

import android.os.Bundle;
import android.widget.ImageView;

import androidx.annotation.Nullable;

import java.io.IOException;
import java.io.InputStreamReader;
import java.io.BufferedReader;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodChannel;

public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "uri_exercicios";

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

        MethodChannel channel = new  MethodChannel(getFlutterEngine().getDartExecutor().getBinaryMessenger(), CHANNEL);

        channel.setMethodCallHandler((call, result) -> {
            switch (call.method) {
                case "exercicio01":
                    int a = Integer.parseInt(call.argument("numero1"));
                    int b = Integer.parseInt(call.argument("numero2"));
                    int x = a + b;
                    System.out.println("X = " + x);
                    result.success(x);
                    break;
                case "exercicio02":
                    String nome = call.argument("nome");
                    double salario = Double.parseDouble(call.argument("salario"));
                    double totalVenda = Double.parseDouble(call.argument("totalVenda"));
                    double comissao = 0.15 * totalVenda;
                    String resultado = String.format("%.2f", (salario + comissao));

                    result.success("TOTAL = R$ " + resultado);
                    break;
                case "exercicio03":
                    int n = Integer.parseInt(call.argument("numero"));
                    int aux;
                    String texto;
                    texto = "" + n + "\n";
                    aux = n / 100;
                    n = n % 100;
                    System.out.println(aux + " nota(s) de R$ 100,00");
                    texto += aux + " nota(s) de R$ 100,00 \n";
                    aux = n / 50;
                    n = n % 50;
                    System.out.println(aux + " nota(s) de R$ 50,00");
                    texto += aux + " nota(s) de R$ 50,00 \n";
                    aux = n / 20;
                    n = n % 20;
                    System.out.println(aux + " nota(s) de R$ 20,00");
                    texto += aux + " nota(s) de R$ 20,00 \n";
                    aux = n / 10;
                    n = n % 10;
                    System.out.println(aux + " nota(s) de R$ 10,00");
                    texto += aux + " nota(s) de R$ 10,00 \n";
                    aux = n / 5;
                    n = n % 5;
                    System.out.println(aux + " nota(s) de R$ 5,00");
                    texto += aux + " nota(s) de R$ 5,00 \n";
                    aux = n / 2;
                    n = n % 2;
                    System.out.println(aux + " nota(s) de R$ 2,00");
                    texto += aux + " nota(s) de R$ 2,00 \n";
                    aux = n / 1;
                    n = n % 1;
                    System.out.println(aux + " nota(s) de R$ 1,00");
                    texto += aux + " nota(s) de R$ 1,00 \n";

                    result.success(texto);
                    break;
                case "exercicio04":
                    int nota = Integer.parseInt(call.argument("numero"));

                    if (nota == 0) {
                        System.out.println("E");
                        result.success("E");
                    }

                    if (nota >= 1 && nota <= 35) {
                        System.out.println("D");
                        result.success("D");
                    }

                    if (nota >= 36 && nota <= 60) {
                        System.out.println("C");
                        result.success("C");
                    }

                    if (nota >= 61 && nota <= 85) {
                        System.out.println("B");
                        result.success("B");
                    }

                    if (nota >= 86) {
                        System.out.println("A");
                        result.success("A");
                    }
                    break;
                    case "exercicio05":
                        int numero = Integer.parseInt(call.argument("dados").toString().split(";")[0]);
                        String[] valores = call.argument("dados").toString().split(";");
                        int index = 1;
                        String resultado2 = "" + numero + "\n";
                        while (numero != 0) {
                            String[] arrayValores2 = valores[index].split(" ");
                            if (Integer.parseInt(arrayValores2[0].trim()) >= 200 && Integer.parseInt(arrayValores2[0].trim()) <= 300) {
                                if (Integer.parseInt(arrayValores2[1].trim()) >= 50) {
                                    if (Integer.parseInt(arrayValores2[2].trim()) >= 150) {
//                                        System.out.println("Sim");
                                        resultado2 += "Sim \n";
                                        numero = numero - 1;
                                        index += 1;
                                        continue;
                                    }
                                }
                            }

                            resultado2 += "Não \n";
                            numero = numero - 1;
                            index += 1;
                        }
                        result.success(resultado2);
                        break;
            }
        });
    }
}
