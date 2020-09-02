import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Homewidget extends StatelessWidget {
  Homewidget(
      {@required this.icon,
      @required this.text,
      @required this.count,
      @required this.color});
  final icon;
  final text;
  final count;
  final color;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 100,
      padding: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Icon(
                this.icon,
                color: this.color,
                size: 30,
              ),
              Text(
                this.text,
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 16,
                  fontFamily: 'SF',
                  fontWeight: FontWeight.w700,
                ),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(
              top: 6,
            ),
            child: Text(
              this.count.toString(),
              style: TextStyle(
                color: Colors.black,
                fontSize: 32,
                fontFamily: 'SF',
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.white, spreadRadius: 3),
        ],
      ),
    );
  }
}
