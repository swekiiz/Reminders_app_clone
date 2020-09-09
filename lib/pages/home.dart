import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/components/homewidget.dart';
import 'package:my_app/components/mylist.dart';
// import 'package:my_app/class/DataAccessObject.dart';
import 'package:my_app/API.dart';
import 'dart:ui';
// import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  var _post;
  var allList = [];
  initState() {
    super.initState();
    this._post = fetchData();
  }

  dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _post,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          var dataListLength = snapshot.data.length;
          allList.clear();
          for (int i = 0; i < dataListLength; i++) {
            var listLength = snapshot.data[i].list.length;
            for (int j = 0; j < listLength; j++) {
              allList.add(snapshot.data[i].list[j]);
            }
          }
          return Scaffold(
            backgroundColor: Color.fromRGBO(241, 241, 246, 1),
            appBar: AppBar(
              title: Text(
                'My First App',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                ),
              ),
              backgroundColor: Color.fromRGBO(241, 241, 246, 1),
            ),
            body: Stack(
              children: <Widget>[
                SingleChildScrollView(
                  child: Container(
                    color: Color.fromRGBO(241, 241, 246, 1),
                    // margin: MediaQuery.of(context).padding,
                    padding: EdgeInsets.only(
                      top: 20,
                      right: 20,
                      left: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomeWidget(
                                text: 'Today',
                                icon: Icons.calendar_today,
                                count: 0,
                                color: Color.fromRGBO(60, 150, 250, 1),
                                list: allList,
                              ),
                              HomeWidget(
                                text: 'Scheduled',
                                icon: Icons.access_time,
                                count: 0,
                                color: Color.fromRGBO(242, 222, 50, 1),
                                list: allList,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HomeWidget(
                                text: 'All',
                                icon: Icons.inbox,
                                count: 0,
                                color: Colors.grey,
                                list: allList,
                              ),
                              HomeWidget(
                                text: 'Flagged',
                                icon: Icons.flag,
                                count: 0,
                                color: Colors.red,
                                list: allList,
                              )
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(16, 26, 0, 0),
                          child: Text(
                            'My Lists',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 22,
                              fontFamily: 'SF',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Mylist(data: snapshot.data),
                      ],
                    ),
                  ),
                ),
                Container(),
                Positioned(
                  bottom: 0,
                  child: ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 3.5,
                        sigmaY: 3.5,
                      ),
                      child: Container(
                        height: 80,
                        width: MediaQuery.of(context).size.width,
                        color: Color.fromRGBO(241, 241, 246, 0.5),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    height: 80,
                    padding: EdgeInsets.only(top: 12, right: 20),
                    alignment: Alignment.topRight,
                    width: MediaQuery.of(context).size.width,
                    color: Colors.transparent,
                    child: Text(
                      'Add List',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.blue,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (snapshot.hasError) {
          return Text("Error");
        }
        return CircularProgressIndicator();
      },
    );
  }
}
