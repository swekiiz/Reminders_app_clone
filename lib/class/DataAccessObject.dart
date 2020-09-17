import 'package:flutter/material.dart';
// import 'dart:convert';

class ListData {
  String text;
  bool isCheck;
  ListData({this.text, this.isCheck});
  factory ListData.fromJson(Map<String, dynamic> item) => ListData(
        text: item['text'],
        isCheck: item['isCheck'],
      );
  Map<String, dynamic> toJson() => {
        'text': text,
        'isCheck': isCheck,
      };
}

class AllListData {
  String id;
  String title;
  String color;
  String icon;
  var list;
  AllListData({this.id, this.title, this.color, this.icon, this.list});
  factory AllListData.fromJson(Map<String, dynamic> item) => AllListData(
        id: item['id'],
        title: item['title'],
        color: item['color'],
        icon: item['icon'],
        list: item['list']
            .map<ListData>((item) => ListData.fromJson(item))
            .toList(),
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'color': color,
        'icon': icon,
        'list': list.map<dynamic>((item) => item.toJson()).toList(),
      };
  Map<String, dynamic> toSomeJson() => {
        'id': id,
        'list': list.map<dynamic>((item) => item.toJson()).toList(),
      };
}

class CheckBoxWithId {
  String text;
  bool isCheck;
  String id;
  CheckBoxWithId({this.text, this.isCheck, this.id});
  factory CheckBoxWithId.fromJson(Map<String, dynamic> item) => CheckBoxWithId(
        text: item['text'],
        isCheck: item['isCheck'],
        id: item['id'],
      );
  Map<String, dynamic> toJson() => {
        'text': text,
        'isCheck': isCheck,
        'id': id,
      };
  // set setIsCheck(bool b) {
  //   this.isCheck = b;
  // }

  // set setText(String t) {
  //   this.text = t;
  // }

  // set setId(String i) {
  //   this.id = i;
  // }
}

class ForID {
  ListData listdata;
  String id;
  ForID({this.listdata, this.id});
}

class PairKey {
  Key key;
  dynamic item;
  PairKey({this.key, this.item});
}
