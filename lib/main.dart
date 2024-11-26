import 'package:flutter/material.dart';

void main() {
  runApp(const TwoScreenApp());
}

class TwoScreenApp extends StatelessWidget {
  const TwoScreenApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => InputScreen(),
        '/output': (context) => const OutputScreen(),
      },
    );
  }
}

class InputScreen extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  InputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Entrada de Dados')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: controller,
              decoration: const InputDecoration(labelText: 'Digite algo'),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(
                context,
                '/output',
                arguments: controller.text,
              );
            },
            child: const Text('Enviar'),
          ),
        ],
      ),
    );
  }
}

class OutputScreen extends StatelessWidget {
  const OutputScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String input = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text('Exibição')),
      body: Center(
        child:
            Text('Você digitou: $input', style: const TextStyle(fontSize: 24)),
      ),
    );
  }
}
