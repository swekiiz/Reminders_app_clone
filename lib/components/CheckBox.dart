import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _CheckBoxState();
  }
}

class _CheckBoxState extends State<CheckBox> {
  bool _isCheck = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: this._isCheck,
          onChanged: (newValue) {
            setState(() {
              this._isCheck = newValue;
            });
          },
        ),
        
      ],
    );
  }
}
