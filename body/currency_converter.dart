import 'package:flutter/material.dart';

class CurrencyConverter extends StatefulWidget {
  const CurrencyConverter({super.key});

  @override
  State<CurrencyConverter> createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final TextEditingController _amountController = TextEditingController();
  String _selectedFromCurrency = 'USD';
  String _selectedToCurrency = 'BRL';
  String _result = '';

  final Map<String, String> _currencies = {
    'USD': 'Dólar Americano',
    'EUR': 'Euro',
    'GBP': 'Libra Esterlina',
    'JPY': 'Iene Japonês',
    'BRL': 'Real Brasileiro',
    'CAD': 'Dólar Canadense',
    'AUD': 'Dólar Australiano',
  };

  // Taxas de câmbio fixas (apenas para demonstração)
  final Map<String, double> _exchangeRates = {
    'USD': 1.0,
    'EUR': 0.85,
    'GBP': 0.75,
    'JPY': 110.0,
    'BRL': 5.5,
    'CAD': 1.25,
    'AUD': 1.35,
  };

  void _convertCurrency() {
    if (_amountController.text.isEmpty) {
      setState(() => _result = 'Por favor, insira um valor');
      return;
    }

    try {
      double amount = double.parse(_amountController.text);
      double fromRate = _exchangeRates[_selectedFromCurrency] ?? 1.0;
      double toRate = _exchangeRates[_selectedToCurrency] ?? 1.0;
      
      double convertedAmount = amount * (toRate / fromRate);
      
      setState(() {
        _result = '${amount.toStringAsFixed(2)} $_selectedFromCurrency = ${convertedAmount.toStringAsFixed(2)} $_selectedToCurrency';
      });
    } catch (e) {
      setState(() => _result = 'Erro na conversão');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          TextField(
            controller: _amountController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Valor',
              border: OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedFromCurrency,
                  items: _currencies.keys.map((currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text('$currency - ${_currencies[currency]}'),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() => _selectedFromCurrency = newValue!);
                  },
                  decoration: const InputDecoration(
                    labelText: 'De',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              const Icon(Icons.arrow_forward),
              const SizedBox(width: 10),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedToCurrency,
                  items: _currencies.keys.map((currency) {
                    return DropdownMenuItem<String>(
                      value: currency,
                      child: Text('$currency - ${_currencies[currency]}'),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() => _selectedToCurrency = newValue!);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Para',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _convertCurrency,
            child: const Text('Converter'),
          ),
          const SizedBox(height: 20),
          Text(_result, style: const TextStyle(fontSize: 18)),
          const SizedBox(height: 20),
          const Text(
            'Nota: Esta é uma demonstração com taxas fixas. Em um app real, você precisaria de uma API para obter taxas atualizadas.',
            style: TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}