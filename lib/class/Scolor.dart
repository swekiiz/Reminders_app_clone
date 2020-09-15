import 'package:flutter/material.dart';

Color strToColors(String s) {
  if (s == 'darkbrown' || s == 'darkBrown') return Color(0xFF654321);
  if (s == 'brown') return Colors.brown;
  if (s == 'purplebrown' || s == 'purpleBrown') return Color(0xFF915673);
  if (s == 'deeppurple' || s == 'deepPurple') return Colors.deepPurple;
  if (s == 'purple') return Colors.purple;
  if (s == 'pinkpurple' || s == 'pinkPurple') return Color(0xFFC0228A);
  if (s == 'pink') return Colors.pink;
  if (s == 'red') return Colors.red;
  if (s == 'deeporange' || s == 'deepOrange') return Colors.deepOrange;
  if (s == 'coral') return Color(0xFFFF7F50);
  if (s == 'orange') return Colors.orange;
  if (s == 'amber') return Colors.amber;
  if (s == 'yellow') return Colors.yellow;
  if (s == 'lime') return Colors.lime;
  if (s == 'lightgreen' || s == 'lightGreen') return Colors.lightGreen;
  if (s == 'green') return Colors.green;
  if (s == 'teal') return Colors.teal;
  if (s == 'cyan') return Colors.cyan;
  if (s == 'lightblue' || s == 'lightBlue') return Colors.lightBlue;
  if (s == 'blue') return Colors.blue;
  if (s == 'indigo') return Colors.indigo;
  if (s == 'bluegrey' || s == 'blueGrey') return Colors.blueGrey;
  if (s == 'white38') return Colors.white38;
  if (s == 'grey') return Colors.grey;
  if (s == 'white70') return Colors.white70;
  if (s == 'white') return Colors.white;
  if (s == 'black') return Colors.black;
  return Colors.black;
}

Color hexToColor(String s) {
  return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
}

String colorToHex(int r, int g, int b) {
  return '#' + r.toRadixString(16) + g.toRadixString(16) + b.toRadixString(16);
}

String colorsToHex(Color color) {
  return '#' + color.value.toRadixString(16).substring(2, 8);
}

String hexNoHashtag(String s) {
  return s.substring(1, 7);
}
