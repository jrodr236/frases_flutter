import 'package:flutter/material.dart';
import 'frases_viewmodel.dart';

class FrasesView extends StatelessWidget {
  final viewModel = FraseViewModel();

  FrasesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Reacciona als canvis d'estat del ViewModel
              ListenableBuilder(
                listenable: viewModel,
                builder: (context, child) {
                  if (viewModel.isLoading) {
                    return const CircularProgressIndicator();
                  }

                  if (viewModel.errorMessage != null) {
                    return Text(
                      viewModel.errorMessage!,
                      style: const TextStyle(color: Colors.red),
                      textAlign: TextAlign.center,
                    );
                  }

                  if (viewModel.fraseActual != null) {
                    return Column(
                      children: [
                        Text(
                          '"${viewModel.fraseActual!.quote}"',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          '- ${viewModel.fraseActual!.author}',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    );
                  }

                  return const Text('Prem el botó per carregar una frase');
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: viewModel.seguentFrase,
                child: const Text('Nova frase'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}