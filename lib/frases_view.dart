import 'package:flutter/material.dart';

class FrasesView extends StatelessWidget {
  const FrasesView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('"Hi ha 10 tipus de persones al món: les que entenen el sistema binari i les que no."'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('Nova frase'),
            ),
          ],
        ),
      ),
    );
  }
}