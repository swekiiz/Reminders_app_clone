import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/components/homewidget.dart';
import 'package:my_app/components/mylist.dart';

class HomePage extends StatelessWidget {
  final litsOfHomwWidget = [
    Homewidget(
      text: 'Today',
      icon: Icons.calendar_today,
      count: 0,
      color: Colors.blue,
    ),
    Homewidget(
      text: 'Scheduled',
      icon: Icons.access_time,
      count: 0,
      color: Colors.yellow,
    ),
    Homewidget(
      text: 'All',
      icon: Icons.inbox,
      count: 0,
      color: Colors.grey,
    ),
    Homewidget(
      text: 'Flagged',
      icon: Icons.flag,
      count: 0,
      color: Colors.red,
    )
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
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
      body: Container(
        color: Color.fromRGBO(241, 241, 246, 1),
        // margin: MediaQuery.of(context).padding,
        padding: EdgeInsets.only(
          top: 20,
          right: 20,
          left: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 260,
              child: GridView.count(
                mainAxisSpacing: 24,
                crossAxisSpacing: 24,
                crossAxisCount: 2,
                childAspectRatio: (200 / 100),
                children: this.litsOfHomwWidget,
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 16),
              child: Text(
                'My Lists',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'SF',
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Mylist(),
          ],
        ),
      ),
    );
  }
}
