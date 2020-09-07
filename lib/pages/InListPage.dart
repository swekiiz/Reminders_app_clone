import 'package:flutter/material.dart';
import 'package:my_app/class/Data_format.dart';
import 'package:my_app/components/CheckBox.dart';

class InListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _InListPageState();
  }
}

class _InListPageState extends State<InListPage> {
  @override
  Widget build(BuildContext context) {
    final DataFromHomeToPage args = ModalRoute.of(context).settings.arguments;
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
                    child: GestureDetector(
                      onTap: () {
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
                  color: Colors.orange[600],
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Column(
              children: <Widget>[CheckBox()],
            ),
          ],
        ),
      ),
    );
  }
}
