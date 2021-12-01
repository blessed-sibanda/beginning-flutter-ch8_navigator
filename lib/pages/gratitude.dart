import 'package:flutter/material.dart';

class Gratitude extends StatefulWidget {
  final int radioGroupValue;

  const Gratitude({Key? key, required this.radioGroupValue}) : super(key: key);

  @override
  State<Gratitude> createState() => _GratitudeState();
}

class _GratitudeState extends State<Gratitude> {
  late int _radioGroupValue;
  final List<String> _gratitudeList = [];
  late String _selectedGratitude;

  void _radioOnChanged(Object? value) {
    final index = int.tryParse(value.toString());
    if (index != null) {
      setState(() {
        _radioGroupValue = index;
        _selectedGratitude = _gratitudeList[index];
        print('_selectedGratitude $_selectedGratitude');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _gratitudeList
      ..add('Family')
      ..add('Friends')
      ..add('Coffee');
    _radioGroupValue = widget.radioGroupValue;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gratitude'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context, _selectedGratitude),
            icon: const Icon(Icons.check),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Radio(
                value: 0,
                groupValue: _radioGroupValue,
                onChanged: (val) => _radioOnChanged(val),
              ),
              const Text('Family'),
              Radio(
                value: 1,
                groupValue: _radioGroupValue,
                onChanged: (val) => _radioOnChanged(val),
              ),
              const Text('Friends'),
              Radio(
                value: 2,
                groupValue: _radioGroupValue,
                onChanged: (val) => _radioOnChanged(val),
              ),
              const Text('Coffee'),
            ],
          ),
        ),
      ),
    );
  }
}
