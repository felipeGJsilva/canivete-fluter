import 'package:flutter/material.dart';

class DateTimeTools extends StatefulWidget {
  const DateTimeTools({super.key});

  @override
  State<DateTimeTools> createState() => _DateTimeToolsState();
}

class _DateTimeToolsState extends State<DateTimeTools> {
  DateTime _selectedDate = DateTime.now();
  TimeOfDay _selectedTime = TimeOfDay.now();
  String _result = '';

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() => _selectedDate = picked);
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
    );
    if (picked != null && picked != _selectedTime) {
      setState(() => _selectedTime = picked);
    }
  }

  void _calculateDifference() {
    DateTime now = DateTime.now();
    Duration difference = _selectedDate.difference(now);
    
    int days = difference.inDays;
    int hours = difference.inHours.remainder(24);
    int minutes = difference.inMinutes.remainder(60);
    
    setState(() {
      _result = 'Diferença: $days dias, $hours horas, $minutes minutos';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            children: [
              const Text('Data: '),
              TextButton(
                onPressed: () => _selectDate(context),
                child: Text('${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year}'),
              ),
            ],
          ),
          Row(
            children: [
              const Text('Hora: '),
              TextButton(
                onPressed: () => _selectTime(context),
                child: Text(_selectedTime.format(context)),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: _calculateDifference,
            child: const Text('Calcular Diferença'),
          ),
          const SizedBox(height: 20),
          Text(_result, style: const TextStyle(fontSize: 18)),
        ],
      ),
    );
  }
}