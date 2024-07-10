import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'today.dart';

void main() async {
  await Hive.initFlutter();
  var myBox = await Hive.openBox('mybox');
  runApp(const Today());
}
