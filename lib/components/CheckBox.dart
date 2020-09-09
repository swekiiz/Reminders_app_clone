import 'package:flutter/material.dart';

class CheckBox extends StatefulWidget {
  final text;
  final bool isCheck;
  final color;
  CheckBox({
    @required this.text,
    @required this.isCheck,
    @required this.color,
  });
  @override
  State<StatefulWidget> createState() {
    return _CheckBoxState();
  }
}

class _CheckBoxState extends State<CheckBox> {
  bool _isCheck = false;
  var _messageController = TextEditingController();
  //_messageController.text

  initState() {
    super.initState();
    this._messageController.text = widget.text;
    this._isCheck = widget.isCheck;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Center(
            child: InkWell(
          onTap: () {
            setState(() {
              _isCheck = !_isCheck;
            });
          },
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
              border: Border.all(
                color: Colors.grey[400],
                width: 1.2,
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(1),
              child: _isCheck
                  ? Icon(
                      Icons.lens,
                      size: 22,
                      color: widget.color,
                    )
                  : Icon(
                      Icons.panorama_fish_eye,
                      size: 22,
                      color: Colors.white,
                    ),
            ),
          ),
        )),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 14),
            child: TextField(
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                ),
                border: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey[400],
                    width: 1,
                  ),
                ),
              ),
              controller: _messageController,
            ),
          ),
        ),
      ],
    );
  }
}
