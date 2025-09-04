import 'package:flutter/material.dart';

class UnitConverter extends StatefulWidget {
  const UnitConverter({super.key});

  @override
  State<UnitConverter> createState() => _UnitConverterState();
}

class _UnitConverterState extends State<UnitConverter> {
  final TextEditingController _inputController = TextEditingController();
  String _selectedFromUnit = 'Metros';
  String _selectedToUnit = 'Quilômetros';
  String _result = '';

  final List<String> _units = [
    'Metros', 'Quilômetros', 'Centímetros', 'Milímetros',
    'Pés', 'Polegadas', 'Jardas', 'Milhas'
  ];

  double _convertUnit(double value, String fromUnit, String toUnit) {
    double valueInMeters;
    
    switch (fromUnit) {
      case 'Metros': valueInMeters = value; break;
      case 'Quilômetros': valueInMeters = value * 1000; break;
      case 'Centímetros': valueInMeters = value / 100; break;
      case 'Milímetros': valueInMeters = value / 1000; break;
      case 'Pés': valueInMeters = value * 0.3048; break;
      case 'Polegadas': valueInMeters = value * 0.0254; break;
      case 'Jardas': valueInMeters = value * 0.9144; break;
      case 'Milhas': valueInMeters = value * 1609.34; break;
      default: valueInMeters = value;
    }
    
    switch (toUnit) {
      case 'Metros': return valueInMeters;
      case 'Quilômetros': return valueInMeters / 1000;
      case 'Centímetros': return valueInMeters * 100;
      case 'Milímetros': return valueInMeters * 1000;
      case 'Pés': return valueInMeters / 0.3048;
      case 'Polegadas': return valueInMeters / 0.0254;
      case 'Jardas': return valueInMeters / 0.9144;
      case 'Milhas': return valueInMeters / 1609.34;
      default: return valueInMeters;
    }
  }

  void _convert() {
    if (_inputController.text.isEmpty) {
      setState(() => _result = 'Por favor, insira um valor');
      return;
    }

    try {
      double inputValue = double.parse(_inputController.text);
      double convertedValue = _convertUnit(inputValue, _selectedFromUnit, _selectedToUnit);
      
      setState(() {
        _result = '${_inputController.text} $_selectedFromUnit = ${convertedValue.toStringAsFixed(6)} $_selectedToUnit';
      });
    } catch (e) {
      setState(() => _result = 'Erro: valor inválido');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Conversor de Unidades',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 8),
          const Text(
            'Converta entre diferentes unidades de medida',
            style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 24),
          TextField(
            controller: _inputController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              labelText: 'Valor para converter',
              prefixIcon: Icon(Icons.numbers_rounded),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedFromUnit,
                  items: _units.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() => _selectedFromUnit = newValue!);
                  },
                  decoration: const InputDecoration(
                    labelText: 'De',
                    prefixIcon: Icon(Icons.arrow_outward_rounded),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedToUnit,
                  items: _units.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() => _selectedToUnit = newValue!);
                  },
                  decoration: const InputDecoration(
                    labelText: 'Para',
                    prefixIcon: Icon(Icons.arrow_circle_up_rounded),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _convert,
              child: const Text('Converter', style: TextStyle(fontSize: 16)),
            ),
          ),
          const SizedBox(height: 24),
          if (_result.isNotEmpty)
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Resultado:',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Color(0xFF1E293B)),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    _result,
                    style: const TextStyle(fontSize: 18, color: Color(0xFF0066CC), fontWeight: FontWeight.w500),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}