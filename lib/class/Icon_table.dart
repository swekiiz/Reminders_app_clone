import 'package:flutter/material.dart';
import 'package:my_app/class/Scolor.dart';

Icon getIcon(String name, double size, String scolor) {
  Map<String, Icon> ic = Map();
  ic['access_alarm'] = Icon(
    Icons.access_alarm,
    size: size,
    color: hexToColor(scolor),
  );
  ic['accessibility'] = Icon(
    Icons.accessibility,
    size: size,
    color: hexToColor(scolor),
  );
  ic['accessible'] = Icon(
    Icons.accessible,
    size: size,
    color: hexToColor(scolor),
  );
  ic['account_balance'] = Icon(
    Icons.account_balance,
    size: size,
    color: hexToColor(scolor),
  );
  ic['account_box'] = Icon(
    Icons.account_box,
    size: size,
    color: hexToColor(scolor),
  );
  ic['add'] = Icon(
    Icons.add,
    size: size,
    color: hexToColor(scolor),
  );
  ic['add_a_photo'] = Icon(
    Icons.add_a_photo,
    size: size,
    color: hexToColor(scolor),
  );
  ic['add_call'] = Icon(
    Icons.add_call,
    size: size,
    color: hexToColor(scolor),
  );
  ic['airplanemode_active'] = Icon(
    Icons.airplanemode_active,
    size: size,
    color: hexToColor(scolor),
  );
  ic['airport_shuttle'] = Icon(
    Icons.airport_shuttle,
    size: size,
    color: hexToColor(scolor),
  );
  ic['alarm_on'] = Icon(
    Icons.alarm_on,
    size: size,
    color: hexToColor(scolor),
  );
  ic['all_inclusive'] = Icon(
    Icons.all_inclusive,
    size: size,
    color: hexToColor(scolor),
  );
  ic['assessment'] = Icon(
    Icons.assessment,
    size: size,
    color: hexToColor(scolor),
  );
  ic['attach_file'] = Icon(
    Icons.attach_file,
    size: size,
    color: hexToColor(scolor),
  );
  ic['block'] = Icon(
    Icons.block,
    size: size,
    color: hexToColor(scolor),
  );
  ic['border_color'] = Icon(
    Icons.border_color,
    size: size,
    color: hexToColor(scolor),
  );
  ic['subject'] = Icon(
    Icons.subject,
    size: size,
    color: hexToColor(scolor),
  );
  ic['brightness_medium'] = Icon(
    Icons.brightness_medium,
    size: size,
    color: hexToColor(scolor),
  );
  ic['build'] = Icon(
    Icons.build,
    size: size,
    color: hexToColor(scolor),
  );
  ic['cake'] = Icon(
    Icons.cake,
    size: size,
    color: hexToColor(scolor),
  );
  ic['calendar_today'] = Icon(
    Icons.calendar_today,
    size: size,
    color: hexToColor(scolor),
  );
  ic['call'] = Icon(
    Icons.call,
    size: size,
    color: hexToColor(scolor),
  );
  ic['security'] = Icon(
    Icons.security,
    size: size,
    color: hexToColor(scolor),
  );
  ic['description'] = Icon(
    Icons.description,
    size: size,
    color: hexToColor(scolor),
  );
  ic['device_hub'] = Icon(
    Icons.device_hub,
    size: size,
    color: hexToColor(scolor),
  );
  ic['directions_bike'] = Icon(
    Icons.directions_bike,
    size: size,
    color: hexToColor(scolor),
  );
  ic['directions_transit'] = Icon(
    Icons.directions_transit,
    size: size,
    color: hexToColor(scolor),
  );
  ic['done'] = Icon(
    Icons.done,
    size: size,
    color: hexToColor(scolor),
  );
  ic['email'] = Icon(
    Icons.email,
    size: size,
    color: hexToColor(scolor),
  );
  ic['error'] = Icon(
    Icons.error,
    size: size,
    color: hexToColor(scolor),
  );
  ic['extension'] = Icon(
    Icons.extension,
    size: size,
    color: hexToColor(scolor),
  );
  ic['favorite'] = Icon(
    Icons.favorite,
    size: size,
    color: hexToColor(scolor),
  );
  ic['flash_on'] = Icon(
    Icons.flash_on,
    size: size,
    color: hexToColor(scolor),
  );
  ic['filter_drama'] = Icon(
    Icons.filter_drama,
    size: size,
    color: hexToColor(scolor),
  );
  ic['view_headline'] = Icon(
    Icons.view_headline,
    size: size,
    color: hexToColor(scolor),
  );
  ic['watch_later'] = Icon(
    Icons.watch_later,
    size: size,
    color: hexToColor(scolor),
  );
  return ic[name];
}
