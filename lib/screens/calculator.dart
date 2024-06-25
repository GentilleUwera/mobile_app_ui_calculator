import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String _output = '0';
  String _input = '';
  double _num1 = 0;
  double _num2 = 0;
  String _operand = '';

  void _buttonPressed(String buttonText) {
    setState(() {
      if (buttonText == 'AC') {
        _output = '0';
        _input = '';
        _num1 = 0;
        _num2 = 0;
        _operand = '';
      } else if (buttonText == '+' ||
          buttonText == '-' ||
          buttonText == '×' ||
          buttonText == '÷') {
        _num1 = double.parse(_input);
        _operand = buttonText;
        _input = '';
      } else if (buttonText == '.') {
        if (!_input.contains('.')) {
          _input += buttonText;
        }
      } else if (buttonText == '=') {
        _num2 = double.parse(_input);

        switch (_operand) {
          case '+':
            _output = (_num1 + _num2).toString();
            break;
          case '-':
            _output = (_num1 - _num2).toString();
            break;
          case '×':
            _output = (_num1 * _num2).toString();
            break;
          case '÷':
            _output = (_num1 / _num2).toString();
            break;
        }

        _num1 = 0;
        _num2 = 0;
        _operand = '';
        _input = _output;
      } else {
        _input += buttonText;
      }

      _output = double.parse(_input).toString();
    });
  }

  Widget _buildButton(String buttonText, Color color) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(4.0),
        child: ElevatedButton(
          onPressed: () => _buttonPressed(buttonText),
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(20.0),
            backgroundColor: color,
          ),
          child: Text(
            buttonText,
            style: const TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(24),
              child: Text(
                _output,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 48.0,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton('AC', Colors.grey),
                  _buildButton('+/-', Colors.grey),
                  _buildButton('%', Colors.grey),
                  _buildButton('÷', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('7', Colors.grey[850]!),
                  _buildButton('8', Colors.grey[850]!),
                  _buildButton('9', Colors.grey[850]!),
                  _buildButton('×', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('4', Colors.grey[850]!),
                  _buildButton('5', Colors.grey[850]!),
                  _buildButton('6', Colors.grey[850]!),
                  _buildButton('-', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('1', Colors.grey[850]!),
                  _buildButton('2', Colors.grey[850]!),
                  _buildButton('3', Colors.grey[850]!),
                  _buildButton('+', Colors.orange),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('0', Colors.grey[850]!),
                  _buildButton('.', Colors.grey[850]!),
                  _buildButton('=', Colors.orange),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
