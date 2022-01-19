import 'dart:math';

class HomeController {
  String calcularIMC(String altura, String peso) {
    double pesoDouble = double.parse(peso);
    double alturaDouble = double.parse(altura);
    alturaDouble = alturaDouble / 100;

    double res = pesoDouble / pow(alturaDouble, 2);
    String grauObesidade = verificarGrau(res);

    return grauObesidade;
  }

  String verificarGrau(double res) {
    String resultado = "";

    if (res < 18.5) {
      resultado = "Abaixo do Peso";
    } else if (res >= 18.5 && res <= 24.9) {
      resultado = "Peso Normal";
    } else if (res >= 25 && res <= 29.9) {
      resultado = "Sobrepeso";
    } else if (res >= 30 && res <= 34.9) {
      resultado = "Obesidade Grau I";
    } else if (res >= 35 && res <= 39.9) {
      resultado = "Obesidade Grau II";
    } else if (res >= 40) {
      resultado = "Obesidade Grau III ou Mórbida";
    }

    return resultado;
  }
}
