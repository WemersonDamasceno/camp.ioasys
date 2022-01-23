import '../models/conversor_model.dart';
import 'package:dio/dio.dart';

class ConversorService {
  late Results results;
  Dio dio = Dio();

  Future<Results> buscarCotacaoAtual() async {
    String urlApi = "https://api.hgbrasil.com/finance?format=json";
    final res = await dio.get(urlApi);
    results = Results.fromJson(res.data['results']);

    return results;
  }
}
