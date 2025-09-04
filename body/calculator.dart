import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = '0';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';
  String _operationHistory = '';

  void _buttonPressed(String buttonText) {
    if (buttonText == 'C') {
      _output = '0';
      _num1 = 0;
      _num2 = 0;
      _operand = '';
      _operationHistory = '';
    } else if (buttonText == '⌫') {
      if (_output.length > 1) {
        _output = _output.substring(0, _output.length - 1);
      } else {
        _output = '0';
      }
    } else if (buttonText == '=') {
      _num2 = double.parse(_output);
      
      if (_operand == '+') {
        _output = (_num1 + _num2).toString();
        _operationHistory = '$_num1 + $_num2 =';
      }
      if (_operand == '-') {
        _output = (_num1 - _num2).toString();
        _operationHistory = '$_num1 - $_num2 =';
      }
      if (_operand == '×') {
        _output = (_num1 * _num2).toString();
        _operationHistory = '$_num1 × $_num2 =';
      }
      if (_operand == '÷') {
        _output = _num2 != 0 ? (_num1 / _num2).toString() : 'Erro';
        _operationHistory = _num2 != 0 ? '$_num1 ÷ $_num2 =' : 'Divisão por zero';
      }
      
      _num1 = 0;
      _num2 = 0;
      _operand = '';
    } else if (['+', '-', '×', '÷'].contains(buttonText)) {
      _num1 = double.parse(_output);
      _operand = buttonText;
      _output = '0';
    } else {
      if (_output == '0') {
        _output = buttonText;
      } else {
        _output += buttonText;
      }
    }

    setState(() {});
  }

  Widget _buildButton(String buttonText, {Color color = Colors.white, Color textColor = Colors.black, double fontSize = 20}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(6),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            foregroundColor: textColor,
            padding: const EdgeInsets.all(16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 0,
          ),
          child: Text(
            buttonText,
            style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                _operationHistory,
                style: const TextStyle(fontSize: 16, color: Colors.grey),
              ),
              const SizedBox(height: 8),
              Text(
                _output.length > 10 ? double.parse(_output).toStringAsExponential(5) : _output,
                style: TextStyle(
                  fontSize: _output.length > 10 ? 32 : 48,
                  fontWeight: FontWeight.w300,
                  color: const Color(0xFF1E293B),
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        Expanded(
          child: Container(
            color: const Color(0xFFF8FAFC),
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('C', color: const Color(0xFFFEF3F2), textColor: const Color(0xFFD92D20)),
                      _buildButton('⌫', color: const Color(0xFFF8FAFC), textColor: const Color(0xFF1E293B)),
                      _buildButton('%', color: const Color(0xFFF8FAFC), textColor: const Color(0xFF1E293B)),
                      _buildButton('÷', color: const Color(0xFFF1F5F9), textColor: const Color(0xFF0066CC)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('7', color: Colors.white, textColor: const Color(0xFF1E293B)),
                      _buildButton('8', color: Colors.white, textColor: const Color(0xFF1E293B)),
                      _buildButton('9', color: Colors.white, textColor: const Color(0xFF1E293B)),
                      _buildButton('×', color: const Color(0xFFF1F5F9), textColor: const Color(0xFF0066CC)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('4', color: Colors.white, textColor: const Color(0xFF1E293B)),
                      _buildButton('5', color: Colors.white, textColor: const Color(0xFF1E293B)),
                      _buildButton('6', color: Colors.white, textColor: const Color(0xFF1E293B)),
                      _buildButton('-', color: const Color(0xFFF1F5F9), textColor: const Color(0xFF0066CC)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('1', color: Colors.white, textColor: const Color(0xFF1E293B)),
                      _buildButton('2', color: Colors.white, textColor: const Color(0xFF1E293B)),
                      _buildButton('3', color: Colors.white, textColor: const Color(0xFF1E293B)),
                      _buildButton('+', color: const Color(0xFFF1F5F9), textColor: const Color(0xFF0066CC)),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      _buildButton('.', color: Colors.white, textColor: const Color(0xFF1E293B)),
                      _buildButton('0', color: Colors.white, textColor: const Color(0xFF1E293B)),
                      _buildButton('00', color: Colors.white, textColor: const Color(0xFF1E293B), fontSize: 18),
                      _buildButton('=', color: const Color(0xFF0066CC), textColor: Colors.white),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}