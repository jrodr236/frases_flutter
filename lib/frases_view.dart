import 'package:flutter/material.dart';
import 'frases_viewmodel.dart';

class FrasesView extends StatelessWidget {
  final viewModel = FraseViewModel();

  FrasesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Reacciona automàticament al notifyListeners() del ViewModel
            ListenableBuilder(
              listenable: viewModel,
              builder: (context, child) {
                return Text(
                  viewModel.fraseActual,
                  textAlign: TextAlign.center,
                );
              },
            ),
            ElevatedButton(
              onPressed: viewModel.seguentFrase,
              child: const Text('Nova frase'),
            ),
          ],
        ),
      ),
    );
  }
}