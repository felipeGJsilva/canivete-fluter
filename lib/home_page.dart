import 'package:flutter/material.dart';
import 'body/unit_converter.dart';
import 'body/measurement_converter.dart';
import 'body/text_tools.dart';
import 'body/calculator.dart';
import 'body/password_generator.dart';
import 'body/currency_converter.dart';
import 'body/date_time_tools.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _tools = [
    const UnitConverter(),
    const MeasurementConverter(),
    const TextTools(),
    const Calculator(),
    const PasswordGenerator(),
    const CurrencyConverter(),
    const DateTimeTools(),
  ];

  final List<Map<String, dynamic>> _toolItems = [
    {
      'icon': Icons.swap_horiz_rounded,
      'label': 'Unidades',
      'color': const Color(0xFF4361EE),
    },
    {
      'icon': Icons.straighten_rounded,
      'label': 'Medidas',
      'color': const Color(0xFF7209B7),
    },
    {
      'icon': Icons.text_fields_rounded,
      'label': 'Texto',
      'color': const Color(0xFFF72585),
    },
    {
      'icon': Icons.calculate_rounded,
      'label': 'Calculadora',
      'color': const Color(0xFF4CC9F0),
    },
    {
      'icon': Icons.lock_rounded,
      'label': 'Senhas',
      'color': const Color(0xFFF77F00),
    },
    {
      'icon': Icons.currency_exchange_rounded,
      'label': 'Moedas',
      'color': const Color(0xFF2EC4B6),
    },
    {
      'icon': Icons.access_time_rounded,
      'label': 'Data/Hora',
      'color': const Color(0xFF8AC926),
    },
  ];

  final List<String> _toolNames = [
    'Conversor de Unidades',
    'Conversor de Medidas',
    'Ferramentas de Texto',
    'Calculadora',
    'Gerador de Senhas',
    'Conversor de Moedas',
    'Ferramentas de Data e Hora'
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _toolNames[_selectedIndex],
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        actions: [
          if (_selectedIndex == 5) // Apenas para o conversor de moedas
            IconButton(
              icon: const Icon(Icons.info_outline_rounded),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Taxas de Câmbio'),
                    content: const Text(
                      'As taxas de câmbio utilizadas são para demonstração. Em uma aplicação real, você precisaria integrar uma API de câmbio em tempo real.',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () => Navigator.pop(context),
                        child: const Text('Entendi'),
                      ),
                    ],
                  ),
                );
              },
            ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFFF8FAFC), Color(0xFFF1F5F9)],
          ),
        ),
        child: _tools[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, -2),
            ),
          ],
        ),
        child: BottomNavigationBar(
          items: _toolItems.map((item) {
            return BottomNavigationBarItem(
              icon: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: _toolItems.indexOf(item) == _selectedIndex
                      ? item['color'].withOpacity(0.2)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Icon(item['icon'],
                    color: _toolItems.indexOf(item) == _selectedIndex
                        ? item['color']
                        : Colors.grey[600]),
              ),
              label: item['label'],
            );
          }).toList(),
          currentIndex: _selectedIndex,
          selectedItemColor: _toolItems[_selectedIndex]['color'],
          unselectedItemColor: Colors.grey[600],
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
    );
  }
}