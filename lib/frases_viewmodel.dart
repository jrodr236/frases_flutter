import 'package:flutter/material.dart';
import 'frases_model.dart';

class FraseViewModel extends ChangeNotifier {
  int _indexActual = 0;

  String get fraseActual => FraseModel.llista[_indexActual];

  void seguentFrase() {
    _indexActual = (_indexActual + 1) % FraseModel.llista.length;
    notifyListeners(); // Avisa a la vista que les dades han canviat
  }
}