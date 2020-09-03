import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/components/homewidget.dart';
import 'package:my_app/components/mylist.dart';

class HomePage extends StatelessWidget {
  final litsOfHomwWidget = [
    [
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
      )
    ],
    [
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
    ]
  ];
  @override
  Widget build(BuildContext context) {
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
                      children: this.litsOfHomwWidget[0],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: this.litsOfHomwWidget[1],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      left: 16,
                      top: 26,
                      bottom: 0,
                    ),
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
                  Mylist(),
                ],
              ),
            ),
          ),
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
  }
}
