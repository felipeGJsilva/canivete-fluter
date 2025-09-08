import 'package:flutter/material.dart';

class TextTools extends StatefulWidget {
  const TextTools({super.key});

  @override
  State<TextTools> createState() => _TextToolsState();
}

class _TextToolsState extends State<TextTools> {
  final TextEditingController _inputController = TextEditingController();
  String _selectedOperation = 'Contar caracteres';
  String _result = '';

  final List<String> _operations = [
    'Contar caracteres',
    'Contar palavras',
    'Inverter texto',
    'Maiúsculas',
    'Minúsculas',
    'Primeira maiúscula',
    'Remover espaços extras',
  ];

  String _processText(String text, String operation) {
    switch (operation) {
      case 'Contar caracteres':
        return 'Número de caracteres: ${text.length}';
      case 'Contar palavras':
        return 'Número de palavras: ${text.split(' ').where((word) => word.isNotEmpty).length}';
      case 'Inverter texto':
        return text.split('').reversed.join();
      case 'Maiúsculas':
        return text.toUpperCase();
      case 'Minúsculas':
        return text.toLowerCase();
      case 'Primeira maiúscula':
        if (text.isEmpty) return text;
        return text[0].toUpperCase() + text.substring(1).toLowerCase();
      case 'Remover espaços extras':
        return text.replaceAll(RegExp(r'\s+'), ' ').trim();
      default:
        return text;
    }
  }

  void _process() {
    if (_inputController.text.isEmpty) {
      setState(() => _result = 'Por favor, insira algum texto');
      return;
    }

    try {
      String processedText = _processText(_inputController.text, _selectedOperation);
      setState(() => _result = processedText);
    } catch (e) {
      setState(() => _result = 'Erro ao processar o texto');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Expanded(
            child: TextField(
              controller: _inputController,
              maxLines: null,
              expands: true,
              decoration: const InputDecoration(
                labelText: 'Digite seu texto',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            value: _selectedOperation,
            items: _operations.map((operation) {
              return DropdownMenuItem<String>(
                value: operation,
                child: Text(operation),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() => _selectedOperation = newValue!);
            },
            decoration: const InputDecoration(
              labelText: 'Operação',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _process,
            child: const Text('Processar Texto'),
          ),
          const SizedBox(height: 20),
          Text('Resultado:', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 10),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: SingleChildScrollView(child: Text(_result)),
            ),
          ),
        ],
      ),
    );
  }
}