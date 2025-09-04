import 'package:flutter/material.dart';

class PasswordGenerator extends StatefulWidget {
  const PasswordGenerator({super.key});

  @override
  State<PasswordGenerator> createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  String _password = '';
  int _length = 12;
  bool _includeUppercase = true;
  bool _includeLowercase = true;
  bool _includeNumbers = true;
  bool _includeSymbols = true;

  String _generatePassword() {
    const String uppercase = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    const String lowercase = 'abcdefghijklmnopqrstuvwxyz';
    const String numbers = '0123456789';
    const String symbols = '!@#\$%&*()_-+=[]{}|;:,.<>?';

    String chars = '';
    if (_includeUppercase) chars += uppercase;
    if (_includeLowercase) chars += lowercase;
    if (_includeNumbers) chars += numbers;
    if (_includeSymbols) chars += symbols;

    if (chars.isEmpty) return 'Selecione pelo menos um tipo';

    String password = '';
    for (int i = 0; i < _length; i++) {
      password += chars[(DateTime.now().microsecondsSinceEpoch * i) % chars.length];
    }

    return password;
  }

  void _generate() {
    setState(() {
      _password = _generatePassword();
    });
  }

  @override
  void initState() {
    super.initState();
    _generate();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  _password,
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                IconButton(
                  icon: const Icon(Icons.refresh),
                  onPressed: _generate,
                  tooltip: 'Gerar nova senha',
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          const Text('Comprimento da senha:'),
          Slider(
            value: _length.toDouble(),
            min: 4,
            max: 32,
            divisions: 28,
            label: _length.toString(),
            onChanged: (value) {
              setState(() => _length = value.round());
            },
          ),
          Text('$_length caracteres'),
          const SizedBox(height: 20),
          const Text('Incluir:'),
          CheckboxListTile(
            title: const Text('Letras maiúsculas (A-Z)'),
            value: _includeUppercase,
            onChanged: (value) {
              setState(() => _includeUppercase = value!);
            },
          ),
          CheckboxListTile(
            title: const Text('Letras minúsculas (a-z)'),
            value: _includeLowercase,
            onChanged: (value) {
              setState(() => _includeLowercase = value!);
            },
          ),
          CheckboxListTile(
            title: const Text('Números (0-9)'),
            value: _includeNumbers,
            onChanged: (value) {
              setState(() => _includeNumbers = value!);
            },
          ),
          CheckboxListTile(
            title: const Text('Símbolos (!@#\$%&*)'),
            value: _includeSymbols,
            onChanged: (value) {
              setState(() => _includeSymbols = value!);
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _generate,
            child: const Text('Gerar Nova Senha'),
          ),
        ],
      ),
    );
  }
}