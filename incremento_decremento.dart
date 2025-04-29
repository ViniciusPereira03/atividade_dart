import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: MeuContador(),
  ));
}

class MeuContador extends StatefulWidget {
  const MeuContador({super.key});

  @override
  State<MeuContador> createState() => _MeuContadorState();
}

class _MeuContadorState extends State<MeuContador> {
  int _contador = 0;

  void _incrementar() {
    setState(() {
      _contador++;
    });
  }

  void _subtrair() {
    setState(() {
      _contador--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Contador")),
      body: Center(
        child: Text("Contador: $_contador", style: const TextStyle(fontSize: 24)),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _subtrair,
            child: const Icon(Icons.remove),
          ),
          FloatingActionButton(
            onPressed: _incrementar,
            child: const Icon(Icons.add),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
