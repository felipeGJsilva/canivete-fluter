import 'package:flutter/material.dart';

class MeasurementConverter extends StatefulWidget {
  const MeasurementConverter({super.key});

  @override
  State<MeasurementConverter> createState() => _MeasurementConverterState();
}

class _MeasurementConverterState extends State<MeasurementConverter> {
  final TextEditingController _inputController = TextEditingController();
  String _selectedCategory = 'Comprimento';
  String _selectedFromUnit = 'Metro';
  String _selectedToUnit = 'Pé';
  String _result = '';

  final Map<String, List<String>> _categories = {
    'Comprimento': ['Metro', 'Pé', 'Polegada', 'Centímetro', 'Jarda', 'Milha', 'Quilômetro'],
    'Peso': ['Quilograma', 'Libra', 'Onça', 'Grama', 'Tonelada'],
    'Temperatura': ['Celsius', 'Fahrenheit', 'Kelvin'],
    'Volume': ['Litro', 'Galão', 'Metro Cúbico', 'Polegada Cúbica', 'Pinta'],
  };

  // Função para formatar números com casas decimais apropriadas
  String _formatNumber(double value, String unit) {
    // Para temperaturas, usar menos casas decimais
    if (_selectedCategory == 'Temperatura') {
      return value.toStringAsFixed(2);
    }
    
    // Para valores muito pequenos, usar notação científica
    if (value.abs() < 0.0001 && value != 0) {
      return value.toStringAsExponential(4);
    }
    
    // Para valores muito grandes, usar notação científica
    if (value.abs() > 1000000) {
      return value.toStringAsExponential(4);
    }
    
    // Determinar casas decimais com base no valor
    if (value.abs() < 1) {
      return value.toStringAsFixed(6).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
    } else if (value.abs() < 10) {
      return value.toStringAsFixed(4).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
    } else if (value.abs() < 100) {
      return value.toStringAsFixed(3).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
    } else if (value.abs() < 1000) {
      return value.toStringAsFixed(2).replaceAll(RegExp(r'0*$'), '').replaceAll(RegExp(r'\.$'), '');
    } else {
      return value.toStringAsFixed(2).replaceAll(RegExp(r'\.0$'), '');
    }
  }

  double _convertMeasurement(double value, String fromUnit, String toUnit, String category) {
    if (fromUnit == toUnit) return value;
    
    switch (category) {
      case 'Comprimento': return _convertLength(value, fromUnit, toUnit);
      case 'Peso': return _convertWeight(value, fromUnit, toUnit);
      case 'Temperatura': return _convertTemperature(value, fromUnit, toUnit);
      case 'Volume': return _convertVolume(value, fromUnit, toUnit);
      default: return value;
    }
  }

  double _convertLength(double value, String fromUnit, String toUnit) {
    // Converter para metros primeiro (unidade base)
    double valueInMeters;
    
    switch (fromUnit) {
      case 'Metro': valueInMeters = value; break;
      case 'Pé': valueInMeters = value * 0.3048; break;
      case 'Polegada': valueInMeters = value * 0.0254; break;
      case 'Centímetro': valueInMeters = value / 100; break;
      case 'Jarda': valueInMeters = value * 0.9144; break;
      case 'Milha': valueInMeters = value * 1609.344; break;
      case 'Quilômetro': valueInMeters = value * 1000; break;
      default: valueInMeters = value;
    }
    
    // Converter de metros para a unidade de destino
    switch (toUnit) {
      case 'Metro': return valueInMeters;
      case 'Pé': return valueInMeters / 0.3048;
      case 'Polegada': return valueInMeters / 0.0254;
      case 'Centímetro': return valueInMeters * 100;
      case 'Jarda': return valueInMeters / 0.9144;
      case 'Milha': return valueInMeters / 1609.344;
      case 'Quilômetro': return valueInMeters / 1000;
      default: return valueInMeters;
    }
  }

  double _convertWeight(double value, String fromUnit, String toUnit) {
    // Converter para quilogramas primeiro (unidade base)
    double valueInKg;
    
    switch (fromUnit) {
      case 'Quilograma': valueInKg = value; break;
      case 'Libra': valueInKg = value * 0.45359237; break;
      case 'Onça': valueInKg = value * 0.028349523125; break;
      case 'Grama': valueInKg = value / 1000; break;
      case 'Tonelada': valueInKg = value * 1000; break;
      default: valueInKg = value;
    }
    
    // Converter de quilogramas para a unidade de destino
    switch (toUnit) {
      case 'Quilograma': return valueInKg;
      case 'Libra': return valueInKg / 0.45359237;
      case 'Onça': return valueInKg / 0.028349523125;
      case 'Grama': return valueInKg * 1000;
      case 'Tonelada': return valueInKg / 1000;
      default: return valueInKg;
    }
  }

  double _convertTemperature(double value, String fromUnit, String toUnit) {
    // Converter para Celsius primeiro (unidade base)
    double valueInCelsius;
    
    switch (fromUnit) {
      case 'Celsius': valueInCelsius = value; break;
      case 'Fahrenheit': valueInCelsius = (value - 32) * 5 / 9; break;
      case 'Kelvin': valueInCelsius = value - 273.15; break;
      default: valueInCelsius = value;
    }
    
    // Converter de Celsius para a unidade de destino
    switch (toUnit) {
      case 'Celsius': return valueInCelsius;
      case 'Fahrenheit': return (valueInCelsius * 9 / 5) + 32;
      case 'Kelvin': return valueInCelsius + 273.15;
      default: return valueInCelsius;
    }
  }

  double _convertVolume(double value, String fromUnit, String toUnit) {
    // Converter para litros primeiro (unidade base)
    double valueInLiters;
    
    switch (fromUnit) {
      case 'Litro': valueInLiters = value; break;
      case 'Galão': valueInLiters = value * 3.785411784; break;
      case 'Metro Cúbico': valueInLiters = value * 1000; break;
      case 'Polegada Cúbica': valueInLiters = value * 0.016387064; break;
      case 'Pinta': valueInLiters = value * 0.473176473; break;
      default: valueInLiters = value;
    }
    
    // Converter de litros para a unidade de destino
    switch (toUnit) {
      case 'Litro': return valueInLiters;
      case 'Galão': return valueInLiters / 3.785411784;
      case 'Metro Cúbico': return valueInLiters / 1000;
      case 'Polegada Cúbica': return valueInLiters / 0.016387064;
      case 'Pinta': return valueInLiters / 0.473176473;
      default: return valueInLiters;
    }
  }

  void _convert() {
    if (_inputController.text.isEmpty) {
      setState(() => _result = 'Por favor, insira um valor');
      return;
    }

    try {
      double inputValue = double.parse(_inputController.text);
      double convertedValue = _convertMeasurement(inputValue, _selectedFromUnit, _selectedToUnit, _selectedCategory);
      
      // Formatar os números para exibição
      String formattedInput = _formatNumber(inputValue, _selectedFromUnit);
      String formattedOutput = _formatNumber(convertedValue, _selectedToUnit);
      
      setState(() {
        _result = '$formattedInput $_selectedFromUnit = $formattedOutput $_selectedToUnit';
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
            'Conversor de Medidas',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700, color: Color(0xFF1E293B)),
          ),
          const SizedBox(height: 8),
          const Text(
            'Converta entre diferentes sistemas de medida',
            style: TextStyle(fontSize: 16, color: Color(0xFF64748B)),
          ),
          const SizedBox(height: 24),
          DropdownButtonFormField<String>(
            value: _selectedCategory,
            items: _categories.keys.map((category) {
              return DropdownMenuItem<String>(
                value: category,
                child: Text(category),
              );
            }).toList(),
            onChanged: (newValue) {
              setState(() {
                _selectedCategory = newValue!;
                _selectedFromUnit = _categories[newValue]!.first;
                _selectedToUnit = _categories[newValue]!.first;
                _result = ''; // Limpar resultado ao mudar categoria
              });
            },
            decoration: const InputDecoration(
              labelText: 'Categoria',
              prefixIcon: Icon(Icons.category_rounded),
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _inputController,
            keyboardType: TextInputType.numberWithOptions(decimal: true),
            decoration: const InputDecoration(
              labelText: 'Valor para converter',
              prefixIcon: Icon(Icons.numbers_rounded),
              hintText: 'Digite o valor',
            ),
            onChanged: (value) {
              if (_result.isNotEmpty) {
                setState(() => _result = '');
              }
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedFromUnit,
                  items: _categories[_selectedCategory]!.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedFromUnit = newValue!;
                      if (_result.isNotEmpty) _convert(); // Recalcular se já havia resultado
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'De',
                    prefixIcon: Icon(Icons.arrow_circle_down_rounded),
                  ),
                ),
              ),
              const SizedBox(width: 16),
              const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Icon(Icons.compare_arrows_rounded, size: 32, color: Color(0xFF0066CC)),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: DropdownButtonFormField<String>(
                  value: _selectedToUnit,
                  items: _categories[_selectedCategory]!.map((unit) {
                    return DropdownMenuItem<String>(
                      value: unit,
                      child: Text(unit),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedToUnit = newValue!;
                      if (_result.isNotEmpty) _convert(); // Recalcular se já havia resultado
                    });
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
                  const SizedBox(height: 12),
                  Text(
                    _result,
                    style: const TextStyle(fontSize: 18, color: Color(0xFF0066CC), fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 16),
                  if (_selectedCategory == 'Temperatura')
                    const Text(
                      '💡 Dica: Use "." (ponto) para casas decimais',
                      style: TextStyle(fontSize: 12, color: Color(0xFF64748B), fontStyle: FontStyle.italic),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}