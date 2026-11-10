import 'package:flutter/material.dart';
import 'frases_model.dart';
import 'frases_service.dart';

class FraseViewModel extends ChangeNotifier {
  final FrasesService _service = FrasesService();

  FraseModel? _fraseActual;
  bool _isLoading = false;
  String? _errorMessage;

  // Getters per accedir a l'estat des de la Vista
  FraseModel? get fraseActual => _fraseActual;
  bool get isLoading => _isLoading;
  String? get errorMessage => _errorMessage;

  Future<void> seguentFrase() async {
    _isLoading = true;
    _errorMessage = null;
    notifyListeners(); // Avisa a la vista que estem carregant

    try {
      _fraseActual = await _service.obtenirFraseAleatoria();
    } catch (e) {
      _errorMessage = 'No s\'ha pogut carregar la frase. Torna-ho a provar.';
    } finally {
      _isLoading = false;
      notifyListeners(); // Avisa a la vista que hem acabat (amb dades o error)
    }
  }
}