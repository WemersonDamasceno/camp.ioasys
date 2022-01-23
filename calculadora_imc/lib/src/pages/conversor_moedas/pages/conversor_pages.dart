import '../controllers/conversor_controller.dart';

import '../../components/appbar_widget.dart';
import 'package:flutter/material.dart';

class ConversorMoedasPage extends StatefulWidget {
  const ConversorMoedasPage({Key? key}) : super(key: key);

  @override
  _ConversorMoedasPageState createState() => _ConversorMoedasPageState();
}

class _ConversorMoedasPageState extends State<ConversorMoedasPage> {
  TextEditingController entradaRealController = TextEditingController();
  ConversorController _controller = ConversorController();

  double real = 0.0;
  double dolarCotacao = 0.0;
  double euroCotacao = 0.0;

  @override
  void initState() {
    _controller = ConversorController();
    entradaRealController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    entradaRealController.dispose();
    super.dispose();
  }

  _onChangedReal(String value) async {
    await _controller.buscarCotacao();
    String valor = value;
    real = double.parse(valor);
    //cotação dolar e euro
    dolarCotacao = _controller.dolarCotacao;
    euroCotacao = _controller.euroCotacao;

    double realParaDolar = real / dolarCotacao;
    double realParaEuro = real / euroCotacao;

    // ignore: avoid_print
    print("Real para dolar $realParaDolar");
    // ignore: avoid_print
    print("Real para euro $realParaEuro");

    setState(() {
      _controller.entradaDollarController.text =
          realParaDolar.toStringAsFixed(2);
      _controller.entradaEuroController.text = realParaEuro.toStringAsFixed(2);
    });
  }

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
              inputMoeda(
                entradaRealController,
                size,
                _onChangedReal,
                "Reais",
                "R\$",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputMoeda(entradaRealController, size, _onChangedReal, label, prefix) {
  return TextFormField(
    cursorColor: Colors.white,
    controller: entradaRealController,
    style: TextStyle(
      color: Colors.white,
      fontSize: size.height * 0.02,
    ),
    keyboardType: TextInputType.number,
    onChanged: (value) {
      _onChangedReal(value);
    },
    decoration: InputDecoration(
      prefix: Padding(
        padding: const EdgeInsets.only(right: 4),
        child: Text(
          prefix,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      fillColor: Colors.transparent,
      contentPadding: EdgeInsets.only(right: -size.width * 0.05),
      labelText: label,
      labelStyle: const TextStyle(
        color: Colors.white,
      ),
      alignLabelWithHint: true,
      border: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      prefixIcon: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(
          "assets/images/conversor_moedas/real.png",
          width: 35,
        ),
      ),
    ),
  );
}
