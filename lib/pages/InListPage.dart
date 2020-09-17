import 'package:flutter/material.dart';
import 'package:my_app/class/Data_format.dart';
import 'package:my_app/components/CheckBox.dart';
import 'package:my_app/class/DataAccessObject.dart';
import 'package:my_app/API.dart';

class InListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InListPageState();
  }
}

class _InListPageState extends State<InListPage> {
  var _headController = TextEditingController();
  bool _first;
  bool _isHeadChange = false;
  List<PairKey> _voidList = [];
  List<dynamic> _newList = [];
  List<Widget> _list = [];
  List<PairKey> _isChange = [];
  List<PairKey> _listOfId = [];
  initState() {
    super.initState();
    this._first = true;
  }

  remove(Key kpos) {
    print('--------------');
    for (int i = 0; i < _voidList.length; i++) {
      print(_isChange[i].item);
    }
    _voidList.removeWhere((contact) => contact.key == kpos);
    _isChange.removeWhere((contact) => contact.key == kpos);
    _listOfId.removeWhere((contact) => contact.key == kpos);
    _list.removeWhere((contact) => contact.key == kpos);
    print('++++++++++++++');
    for (int i = 0; i < _voidList.length; i++) {
      print(_isChange[i].item);
    }
    setState(() {});
  }

  exit(
    dynamic args,
    dynamic newList,
    bool re,
  ) async {
    var data;
    dynamic result = false;
    if (args.id.length == 1) {
      // print(ag.id[0]);
      data = AllListData(
        id: args.id[0],
        title: this._headController.text,
        color: args.scolor,
        icon: args.icon,
        list: newList,
      );
      result = await sendingData(data);
    } else {
      List<AllListData> data = [];
      Map<String, int> M = Map();
      result = true;
      for (int i = 0; i < args.id.length; i++) {
        M[args.id[i]] = i;
        dynamic dataTemp = AllListData(
          id: args.id[i],
          list: [],
        );
        data.add(dataTemp);
      }
      for (int i = 0; i < newList.length; i++) {
        data[M[newList[i].id]].list.add(ListData(
              isCheck: newList[i].isCheck,
              text: newList[i].text,
            ));
      }
      for (int i = 0; i < data.length; i++) {
        bool resultTemp = await sendingSomeData(data[i]);
        result = result && resultTemp;
      }
    }
    try {
      if (re) {
        if (result) {
          args.fetch();
        } else {
          print("can't fetch");
        }
      }
    } catch (error) {
      print(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    final DataFromHomeToPage args = ModalRoute.of(context).settings.arguments;
    if (this._first) {
      this._first = false;
      this._headController.text = args.title;
      const NOID = '_NOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOID_';
      for (int i = 0; i < args.list.length; i++) {
        _voidList.add(PairKey(
          key: Key('$i'),
          item: ListData(text: '', isCheck: false),
        ));
        _isChange.add(PairKey(
          key: Key('$i'),
          item: false,
        ));
        if (args.id.length == 1) {
          _listOfId.add(PairKey(item: NOID, key: Key('$i')));
        } else {
          _listOfId.add(PairKey(item: args.list[i].id, key: Key('$i')));
        }
      }
      args.list.asMap().forEach(
        (i, e) {
          if (e is ListData) {
            _list.add(CheckBox(
              key: Key('$i'),
              text: e.text,
              isCheck: e.isCheck,
              color: args.color,
              callBackRemove: remove,
              onChange: (dt) {
                _voidList[i].item = dt;
                _isChange[i].item = true;
                // print("$i");
              },
            ));
          } else if (e is CheckBoxWithId) {
            _list.add(CheckBox(
              key: Key('$i'),
              text: e.text,
              isCheck: e.isCheck,
              color: args.color,
              id: e.id,
              callBackRemove: remove,
              onChange: (dt) {
                _voidList[i].item = dt.listdata;
                _isChange[i].item = true;
                _listOfId[i].item = dt.id;
                // print(dt.id);
                // print("$i");
              },
            ));
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(241, 241, 246, 1),
      body: Container(
        margin: MediaQuery.of(context).padding,
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(20, 10, 20, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          bool sum = true;
                          for (int i = 0; i < _voidList.length; i++) {
                            sum = sum && !_isChange[i].item;
                            String selectText = _isChange[i].item
                                ? _voidList[i].item.text
                                : args.list[i].text;
                            bool selectCheck = _isChange[i].item
                                ? _voidList[i].item.isCheck
                                : args.list[i].isCheck;
                            if (args.id.length == 1) {
                              _newList.add(ListData(
                                text: selectText,
                                isCheck: selectCheck,
                              ));
                            } else {
                              _newList.add(CheckBoxWithId(
                                text: selectText,
                                isCheck: selectCheck,
                                id: _listOfId[i].item,
                              ));
                            }
                          }
                          exit(args, _newList, !sum || _isHeadChange);
                          _newList.clear();
                          Navigator.pop(context);
                        },
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
                              child: Text(
                                'Lists',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 18,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Icon(
                      Icons.more_horiz,
                      size: 28,
                      color: Colors.black45,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
                padding: EdgeInsets.only(left: 20),
                alignment: Alignment.centerLeft,
                child: TextField(
                  controller: this._headController,
                  onChanged: (value) {
                    _isHeadChange = true;
                  },
                  style: TextStyle(
                    color: args.color,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.all(1),
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  children: _list,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
