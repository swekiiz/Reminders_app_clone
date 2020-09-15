import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_app/class/Data_format.dart';
import 'package:my_app/class/Scolor.dart';

class HomeWidget extends StatefulWidget {
  final icon;
  final text;
  final count;
  final color;
  final scolor;
  final list;
  final fetch;
  HomeWidget({
    @required this.icon,
    @required this.text,
    @required this.count,
    @required this.color,
    @required this.scolor,
    @required this.list,
    @required this.fetch,
  });
  @override
  State<StatefulWidget> createState() {
    return _HomeWidgetState();
  }
}

class _HomeWidgetState extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          '/inlist',
          arguments: DataFromHomeToPage(
            title: widget.text,
            color: widget.color,
            scolor: widget.scolor,
            list: widget.list,
            icon: widget.icon,
            fetch: widget.fetch,
          ),
        );
      },
      child: Container(
        width: 176,
        height: 80,
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
                  widget.icon,
                  color: widget.color,
                  size: 30,
                ),
                Text(
                  widget.text,
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
                widget.count.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontFamily: 'SF',
                  fontWeight: FontWeight.w700,
                ),
              ),
            )
          ],
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.white, spreadRadius: 3),
          ],
        ),
      ),
    );
  }
}
