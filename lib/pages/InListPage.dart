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
  bool _isAddList;
  bool _isHeadChange;
  int count;

  List<Widget> _list = [];
  List<PairKey> _voidList = [];
  List<PairKey> _isChange = [];
  List<PairKey> _listOfId = [];
  List<PairKey> _copyList = [];
  List<dynamic> _newList = [];

  initState() {
    super.initState();
    this._first = true;
    this._isAddList = false;
    this._isHeadChange = false;
    this.count = 0;
  }

  remove(Key kpos) {
    // print('--------------');
    // for (int i = 0; i < _voidList.length; i++) {
    //   print(_isChange[i].item);
    // }

    _voidList.removeWhere((contact) => contact.key == kpos);
    _isChange.removeWhere((contact) => contact.key == kpos);
    _listOfId.removeWhere((contact) => contact.key == kpos);
    _copyList.removeWhere((contact) => contact.key == kpos);
    _list.removeWhere((contact) => contact.key == kpos);

    // print('++++++++++++++');
    // for (int i = 0; i < _voidList.length; i++) {
    //   print(_isChange[i].item);
    // }

    setState(() {});
  }

  exit(
    dynamic args,
    dynamic newList,
    bool re,
  ) async {
    var data;
    dynamic result = false;
    if (!args.isHome) {
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

  searchKey(Key key, dynamic dt, bool isHome) {
    for (int i = 0; i < _voidList.length; i++) {
      // print('${_voidList[i].key}  $key');
      if (_voidList[i].key == key) {
        if (isHome) {
          _voidList[i].item = dt.listdata;
          _listOfId[i].item = dt.id;
        } else {
          _voidList[i].item = dt;
          // print(_voidList[i].item.text);
        }
        // print('$i');
        _isChange[i].item = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final DataFromHomeToPage args = ModalRoute.of(context).settings.arguments;
    const NOID = '_NOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOIDNOID_';
    if (this._first) {
      this._first = false;
      this._headController.text = args.title;
      for (int i = 0; i < args.list.length; i++) {
        _voidList.add(PairKey(
          key: Key('$i'),
          item: ListData(text: '', isCheck: false),
        ));
        _isChange.add(PairKey(
          key: Key('$i'),
          item: false,
        ));
        _copyList.add(PairKey(
          key: Key('$i'),
          item: args.list[i],
        ));
        if (args.isHome) {
          _listOfId.add(PairKey(
            item: args.list[i].id,
            key: Key('$i'),
          ));
        } else {
          _listOfId.add(PairKey(
            item: NOID,
            key: Key('$i'),
          ));
        }
        this.count += 1;
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
                searchKey(Key('$i'), dt, false);
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
                searchKey(Key('$i'), dt, true);
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
        child: Stack(
          children: <Widget>[
            SingleChildScrollView(
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
                                    : _copyList[i].item.text;
                                bool selectCheck = _isChange[i].item
                                    ? _voidList[i].item.isCheck
                                    : _copyList[i].item.isCheck;
                                if (!args.isHome) {
                                  _newList.add(ListData(
                                    text: selectText,
                                    isCheck: selectCheck,
                                  ));
                                } else {
                                  // print('$i : ' +
                                  //     selectText +
                                  //     '  $selectCheck' +
                                  //     '  ${_listOfId[i].item}');
                                  _newList.add(CheckBoxWithId(
                                    text: selectText,
                                    isCheck: selectCheck,
                                    id: _listOfId[i].item,
                                  ));
                                }
                              }
                              exit(args, _newList,
                                  (!sum) || _isHeadChange || _isAddList);
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
                    child: args.isHome
                        ? Text(
                            args.title,
                            style: TextStyle(
                              color: args.color,
                              fontSize: 34,
                              fontWeight: FontWeight.bold,
                            ),
                            textAlign: TextAlign.left,
                          )
                        : TextField(
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
            Container(),
            args.isHome
                ? Container()
                : Positioned(
                    bottom: 0,
                    child: Container(
                      height: 80,
                      padding: EdgeInsets.only(top: 12, left: 20),
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      color: Colors.transparent,
                      child: GestureDetector(
                        onTap: () {
                          int temp = count;
                          // print("$count");
                          _voidList.add(PairKey(
                            key: Key('$temp'),
                            item: ListData(
                              text: 'Edit here',
                              isCheck: false,
                            ),
                          ));
                          _isChange.add(PairKey(
                            key: Key('$temp'),
                            item: false,
                          ));
                          _copyList.add(PairKey(
                            key: Key('$temp'),
                            item: ListData(
                              isCheck: false,
                              text: 'Edit here',
                            ),
                          ));
                          _listOfId.add(PairKey(
                            item: NOID,
                            key: Key('$temp'),
                          ));
                          _list.add(CheckBox(
                            key: Key('$temp'),
                            text: 'Edit here',
                            isCheck: false,
                            color: args.color,
                            callBackRemove: remove,
                            onChange: (dt) {
                              // print(dt.text);
                              searchKey(Key('$temp'), dt, false);
                            },
                          ));

                          setState(() {
                            this._isAddList = true;
                            this.count += 1;
                          });
                        },
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(
                                Icons.add_circle,
                                color: args.color,
                                size: 30,
                              ),
                            ),
                            Text(
                              'New Reminder',
                              style: TextStyle(
                                fontSize: 16,
                                color: args.color,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ],
        ),
      ),
      resizeToAvoidBottomPadding: false,
    );
  }
}
