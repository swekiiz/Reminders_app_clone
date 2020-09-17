import 'package:flutter/material.dart';
import 'package:sprintf/sprintf.dart';
import 'package:my_app/class/Data_format.dart';
import 'package:my_app/class/Scolor.dart';

class Mylist extends StatefulWidget {
  final dynamic data;
  final dynamic fetch;
  Mylist({@required this.data,@required this.fetch});
  @override
  State<StatefulWidget> createState() {
    return _MylistState();
  }
}

class _MylistState extends State<Mylist> {
  final li = <Widget>[];

  @override
  Widget build(BuildContext context) {
    li.clear();

    for (int i = 0; i < widget.data.length; i++) {
      String title = widget.data[i].title;
      var color = hexToColor(widget.data[i].color);
      int count = widget.data[i].list.length;
      li.add(
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              '/inlist',
              arguments: DataFromHomeToPage(
                id: [widget.data[i].id],
                title: title,
                color: color,
                scolor: widget.data[i].color,
                icon: widget.data[i].icon,
                list: widget.data[i].list,
                fetch: widget.fetch,
                isHome: false,
              ),
            );
          },
          child: Container(
            height: 44,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 2),
                    child: Icon(
                      Icons.format_list_bulleted,
                      color: color,
                      size: 26,
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 10,
                    ),
                    child: Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.only(right: 2),
                    child: Text(
                      sprintf('%3d', [count]),
                      style: TextStyle(
                        color: Colors.grey[600],
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(left: 8),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[400],
                      size: 16,
                    ),
                  ),
                ),
              ],
            ),
            margin: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            padding: EdgeInsets.only(
              left: 10,
              right: 10,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: [
                BoxShadow(color: Colors.white, spreadRadius: 3),
              ],
            ),
          ),
        ),
      );
    }
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: li,
      ),
    );
  }
}
