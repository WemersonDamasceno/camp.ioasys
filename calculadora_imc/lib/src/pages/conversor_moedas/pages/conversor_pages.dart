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
  TextEditingController entradaDolarController = TextEditingController();
  TextEditingController entradaEuroController = TextEditingController();
  ConversorController _controller = ConversorController();

  double input = 0.0;
  double dolarCotacao = 0.0;
  double euroCotacao = 0.0;

  @override
  void initState() {
    super.initState();
    _controller = ConversorController();
    entradaRealController = TextEditingController();
    entradaDolarController = TextEditingController();
    entradaEuroController = TextEditingController();
    _controller.buscarCotacao();
  }

  @override
  void dispose() {
    entradaRealController.dispose();
    entradaDolarController.dispose();
    entradaEuroController.dispose();
    super.dispose();
  }

  _onChangedReal(String value) {
    if (value == "") {
      setState(() {
        entradaEuroController.text = "";
        entradaDolarController.text = "";
      });
    }
    String valor = value;
    input = double.parse(valor);
    //cotação dolar e euro
    dolarCotacao = _controller.dolarCotacao;
    euroCotacao = _controller.euroCotacao;

    double realParaDolar = input / dolarCotacao;
    double realParaEuro = input / euroCotacao;

    setState(() {
      entradaDolarController.text = realParaDolar.toStringAsFixed(2);
      entradaEuroController.text = realParaEuro.toStringAsFixed(2);
    });
  }

  _onChangedDolar(String value) {
    if (value == "") {
      setState(() {
        entradaRealController.text = "";
        entradaEuroController.text = "";
      });
    }
    String valor = value;
    input = double.parse(valor);

    //cotação dolar e euro
    dolarCotacao = _controller.dolarCotacao;
    euroCotacao = _controller.euroCotacao;

    double dolarParaReal = input * dolarCotacao;
    double dolarParaEuro = dolarParaReal / euroCotacao;

    setState(() {
      entradaRealController.text = dolarParaReal.toStringAsFixed(2);
      entradaEuroController.text = dolarParaEuro.toStringAsFixed(2);
    });
  }

  _onChangedEuro(String value) {
    if (value == "") {
      setState(() {
        entradaRealController.text = "";
        entradaDolarController.text = "";
      });
    }
    String valor = value;
    input = double.parse(valor);
    //cotação dolar e euro
    dolarCotacao = _controller.dolarCotacao;
    euroCotacao = _controller.euroCotacao;

    double euroParaReal = input * euroCotacao;
    double euroParaDolar = euroParaReal / dolarCotacao;

    setState(() {
      entradaRealController.text = euroParaReal.toStringAsFixed(2);
      entradaDolarController.text = euroParaDolar.toStringAsFixed(2);
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
                "assets/images/conversor_moedas/real.png",
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: inputMoeda(
                  entradaDolarController,
                  size,
                  _onChangedDolar,
                  "Dolar",
                  "US\$",
                  "assets/images/conversor_moedas/dollar.png",
                ),
              ),
              inputMoeda(
                entradaEuroController,
                size,
                _onChangedEuro,
                "Euro",
                "€",
                "assets/images/conversor_moedas/euro.png",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget inputMoeda(
    entradaRealController, size, _onChangedReal, label, prefix, pathImg) {
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
      focusedBorder: const OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(7),
        ),
      ),
      enabledBorder: const OutlineInputBorder(
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
          pathImg,
          width: 35,
        ),
      ),
    ),
  );
}
