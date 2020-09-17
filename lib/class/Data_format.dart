import 'package:flutter/material.dart';

class DataFromHomeToPage {
  final List<String> id;
  final String title;
  final Color color;
  final String scolor;
  final String icon;
  final List list;
  final dynamic fetch;
  final isHome;
  DataFromHomeToPage({
    this.id,
    this.title,
    this.color,
    this.scolor,
    this.icon,
    this.list,
    this.fetch,
    this.isHome,
  });
}
