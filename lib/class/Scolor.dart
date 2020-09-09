import 'package:flutter/material.dart';

dynamic strToColors(String s) {
  if (s == 'orange') return Colors.orange;
  if (s == 'green') return Colors.green;
  if (s == 'red') return Colors.red;
}

Color hexToColor(String s) {
  return new Color(int.parse(s.substring(1, 7), radix: 16) + 0xFF000000);
}
