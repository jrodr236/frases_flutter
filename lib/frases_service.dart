import 'dart:convert';
import 'package:http/http.dart' as http;
import 'frases_model.dart';

class FrasesService {
  static const String _url = 'https://programming-quotesapi.vercel.app/api/random';

  Future<FraseModel> obtenirFraseAleatoria() async {
    final response = await http.get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      return FraseModel.fromJson(data);
    } else {
      throw Exception('Error en carregar la frase');
    }
  }
}