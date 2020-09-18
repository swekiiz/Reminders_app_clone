import 'package:flutter/material.dart';
import 'package:my_app/class/Data_format.dart';
import 'package:my_app/class/Icon_table.dart';
import 'package:my_app/class/Scolor.dart';
import 'package:my_app/class/DataAccessObject.dart';
import 'package:my_app/API.dart';
import 'dart:math';

class BuildListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _BuildListPageState();
  }
}

class _BuildListPageState extends State<BuildListPage> {
  var _mes = TextEditingController();
  Color _bColor = Colors.red;
  String _sIcon = 'view_headline';
  List<Widget> _temp = [];
  List<Widget> _allItem = [];
  List<Color> _listOfColor = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.blue[100],
    Colors.blue,
    Colors.purple[800],
    Colors.pink,
    Colors.purple,
    Colors.brown[700],
    Colors.blueGrey,
    Colors.red[200],
  ];
  List<List<String>> _listIcon = [
    [
      'access_alarm',
      'accessibility',
      'accessible',
      'account_balance',
      'account_box',
      'add'
    ],
    [
      'add_a_photo',
      'add_call',
      'airplanemode_active',
      'airport_shuttle',
      'alarm_on',
      'all_inclusive'
    ],
    [
      'assessment',
      'attach_file',
      'block',
      'border_color',
      'subject',
      'brightness_medium'
    ],
    ['calendar_today', 'build', 'cake', 'security', 'call', 'description'],
    [
      'device_hub',
      'directions_bike',
      'directions_transit',
      'email',
      'done',
      'extension'
    ],
    [
      'error',
      'favorite',
      'filter_drama',
      'flash_on',
      'watch_later',
      'view_headline'
    ]
  ];
  initState() {
    super.initState();
    for (int i = 0; i < 2; i++) {
      for (int j = 0; j < 6; j++) {
        _temp.add(
          GestureDetector(
            onTap: () {
              setState(() {
                _bColor = _listOfColor[i * 6 + j];
              });
            },
            child: Container(
              width: 45.0,
              height: 45.0,
              decoration: BoxDecoration(
                color: _listOfColor[i * 6 + j],
                shape: BoxShape.circle,
              ),
            ),
          ),
        );
      }
      _allItem.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _temp,
      ));
      _temp = [];
    }
    for (int i = 0; i < _listIcon.length; i++) {
      for (int j = 0; j < 6; j++) {
        _temp.add(GestureDetector(
          onTap: () {
            setState(() {
              this._sIcon = _listIcon[i][j];
            });
            // print(_sIcon);
          },
          child: Container(
            child: getIcon(_listIcon[i][j], 30, '#4B555F'),
            width: 45.0,
            height: 45.0,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              shape: BoxShape.circle,
            ),
          ),
        ));
      }
      _allItem.add(Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: _temp,
      ));
      _temp = [];
    }
  }

  final _chars =
      'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
  Random _rnd = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));

  @override
  Widget build(BuildContext context) {
    final DataCallback args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 241, 246, 1),
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Expanded(
                    child: Stack(
                      children: <Widget>[
                        Icon(
                          Icons.arrow_back_ios,
                          color: Colors.blue,
                          size: 26,
                        ),
                        Positioned(
                          left: 20,
                          top: 2.2,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Cancel',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          right: 10,
                          top: 2.2,
                          child: GestureDetector(
                            onTap: () async {
                              String st = getRandomString(20);
                              var data = AllListData(
                                id: st,
                                title: this._mes.text,
                                color: colorsToHex(this._bColor),
                                icon: this._sIcon,
                                list: [],
                              );
                              st = '';
                              var resuit = await sendingData(data);
                              if (resuit) {
                                print('Add list suscess!');
                                args.fetch();
                              }
                              Navigator.pop(context);
                            },
                            child: Text(
                              'Done',
                              style: TextStyle(
                                color: Colors.blue,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 40, bottom: 40),
              child: Container(
                child: getIcon(_sIcon, 76, '#FFFFFF'),
                width: 112.0,
                height: 112.0,
                decoration: BoxDecoration(
                  color: _bColor,
                  shape: BoxShape.circle,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(16, 6, 16, 0),
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.black,
                ),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey[300],
                  contentPadding: EdgeInsets.only(
                    left: 14.0,
                    bottom: 8.0,
                    top: 8.0,
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[400]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey[300]),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                controller: _mes,
              ),
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: _allItem,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
