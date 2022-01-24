import '../models/conversor_model.dart';

import '../services/conversor_services.dart';
import 'package:flutter/material.dart';

class ConversorController {
  //Controllers dos inputs
  TextEditingController entradaRealController = TextEditingController();
  TextEditingController entradaDollarController = TextEditingController();
  TextEditingController entradaEuroController = TextEditingController();

  //cotacao atual
  double dolarCotacao = 0.0;
  double euroCotacao = 0.0;

  //Services api
  ConversorService service = ConversorService();
  late Results results;

  buscarCotacao() async {
    service.buscarCotacaoAtual().then((res) {
      results = res;
      dolarCotacao = results.currencies!.uSD!.buy!;
      euroCotacao = results.currencies!.eUR!.buy!;
    });
  }
}


//Real pra dolar é =  1 / dolarCotacao;
//Real pra euro é = 1 / euroCotacao;

//Dolar pra real = 1 * (1*dolarCotacao);
//Dolar pra euro = 1 * (1/euroCotacao);

//Euro para real = 1 * (1*euroCotacao);
//Euro para dolar = 1 * (1/dolarCotacao);