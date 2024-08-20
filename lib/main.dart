import 'package:flutter/material.dart';
import 'package:world_time_app/pages/choose_location.dart';
import 'package:world_time_app/pages/view_time.dart';
import 'package:world_time_app/pages/loading.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/chooseLocation',
  routes: {
    '/chooseLocation': (context) => ChooseLocation(),
    '/viewTime': (context) => ViewTime(),
    '/loading': (context) => Loading(),
  },
));
