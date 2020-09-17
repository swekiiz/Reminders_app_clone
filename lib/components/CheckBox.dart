import 'package:flutter/material.dart';
import 'package:my_app/class/DataAccessObject.dart';

class CheckBox extends StatefulWidget {
  final ValueChanged<dynamic> onChange;
  final text;
  final id;
  final bool isCheck;
  final color;
  final callBackRemove;
  CheckBox({
    Key key,
    @required this.text,
    @required this.isCheck,
    @required this.color,
    this.id,
    this.onChange,
    this.callBackRemove,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CheckBoxState();
}

class _CheckBoxState extends State<CheckBox> {
  final String noid =
      '_NOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOID_';
  bool _isCheck = false;
  var _messageController = TextEditingController();
  dynamic _listdata = ListData();
  dynamic _listdataid = ForID();
  initState() {
    super.initState();
    this._messageController.text = widget.text;
    // this._messageController.text = widget.id;
    this._isCheck = widget.isCheck;
    this._listdata.isCheck = this._isCheck;
    this._listdata.text = this._messageController.text;
    if (widget.id != null) {
      // print(widget.id);
      this._listdataid.listdata = this._listdata;
      this._listdataid.id = widget.id;
    }
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
              this._listdata.isCheck = this._isCheck;
              if (widget.id == null) {
                widget.onChange(this._listdata);
              } else {
                this._listdataid.listdata = this._listdata;
                widget.onChange(this._listdataid);
              }
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
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.only(left: 14),
            child: TextField(
              onChanged: (dt) {
                this._listdata.text = this._messageController.text;
                if (widget.id == null) {
                  widget.onChange(this._listdata);
                } else {
                  this._listdataid.listdata = this._listdata;
                  widget.onChange(this._listdataid);
                }
              },
              onSubmitted: (dt) {
                if (dt == '') {
                  widget.callBackRemove(widget.key);
                  setState(() {});
                }
              },
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
