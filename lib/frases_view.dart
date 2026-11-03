import 'package:flutter/material.dart';
import 'frases_viewmodel.dart';

class FrasesView extends StatefulWidget {
  // Si l'estat el gestiona un ViewModel extern (com ChangeNotifier), la vista NO necessita ser StatefulWidget.
  // Amb StatefulWidget podem controlar el cicle de vida (initState i dispose).
  const FrasesView({super.key});

  @override
  State<FrasesView> createState() => _FrasesViewState();
}

class _FrasesViewState extends State<FrasesView> {
  late final FraseViewModel viewModel;

  @override
  void initState() {
    super.initState();
    viewModel = FraseViewModel(); // S'instancia una sola vegada quan es crea la pantalla
  }

  @override
  void dispose() {
    viewModel.dispose(); // S'alliberen recursos si el ViewModel ho requereix
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
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