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
  bool _first;
  List<ListData> _voidList = [];
  List<ListData> _newList = [];
  List<Widget> _list = [];
  List<bool> _isChange = [];
  initState() {
    super.initState();
    this._first = true;
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
        title: args.title,
        color: args.scolor,
        icon: args.icon,
        list: newList,
      );
      result = await sendingData(data);
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
      for (int i = 0; i < args.list.length; i++) {
        _voidList.add(ListData(text: '', isCheck: false));
        _isChange.add(false);
      }
      args.list.asMap().forEach(
        (i, e) {
          _list.add(CheckBox(
            text: e.text,
            isCheck: e.isCheck,
            color: args.color,
            onChange: (dt) {
              _voidList[i] = dt;
              _isChange[i] = true;
              print("$i");
            },
          ));
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
                            sum = sum && !_isChange[i];
                            String selectText = _isChange[i]
                                ? _voidList[i].text
                                : args.list[i].text;
                            bool selectCheck = _isChange[i]
                                ? _voidList[i].isCheck
                                : args.list[i].isCheck;
                            _newList.add(ListData(
                              text: selectText,
                              isCheck: selectCheck,
                            ));
                          }
                          exit(args, _newList, !sum);
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
                                  fontSize: 18,
                                  color: Colors.blue,
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
                child: Text(
                  args.title,
                  style: TextStyle(
                    color: args.color,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
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
