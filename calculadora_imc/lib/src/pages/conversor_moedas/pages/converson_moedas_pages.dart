import 'package:calculadora_imc/src/pages/components/app_colors.dart';
import 'package:calculadora_imc/src/pages/components/appbar_widget.dart';
import 'package:calculadora_imc/src/pages/components/input_widget.dart';
import 'package:flutter/material.dart';

class ConversorMoedasPage extends StatefulWidget {
  const ConversorMoedasPage({Key? key}) : super(key: key);

  @override
  _ConversorMoedasPageState createState() => _ConversorMoedasPageState();
}

class _ConversorMoedasPageState extends State<ConversorMoedasPage> {
  TextEditingController entradaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(
        titulo: "Conversor de Moedas",
      ),
      backgroundColor: const Color(0xFF1E1E1E),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 30),
                child: Align(
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/conversor_moedas/logo.png",
                    width: size.width * .4,
                  ),
                ),
              ),
              InputTextoWidget(
                onChanged: () {},
                entradaTipo: TextInputType.number,
                labelInput: "Reais",
                mostrarSenha: false,
                prefixText: "R\$",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/conversor_moedas/real.png",
                    width: 35,
                  ),
                ),
                entradaController: entradaController,
                color: Colors.transparent,
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: size.height * .05),
                child: InputTextoWidget(
                  onChanged: () {},
                  entradaTipo: TextInputType.number,
                  labelInput: "Dollar",
                  mostrarSenha: false,
                  prefixText: "US\$",
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/conversor_moedas/dollar.png",
                      width: 35,
                    ),
                  ),
                  entradaController: entradaController,
                  color: Colors.transparent,
                ),
              ),
              InputTextoWidget(
                onChanged: () {},
                entradaTipo: TextInputType.number,
                labelInput: "Euro",
                mostrarSenha: false,
                prefixText: "€",
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    "assets/images/conversor_moedas/euro.png",
                    width: 35,
                  ),
                ),
                entradaController: entradaController,
                color: Colors.transparent,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
