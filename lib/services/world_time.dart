import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'dart:convert';

class WorldTime {
  String location;
  String time = "";
  String flag;
  String url;
  bool isDayTime = false;

  WorldTime({required this.location, required this.flag, required this.url});

  Future<String> getTime() async {
    try {
      // make the request
      Response response =
          await get(Uri.parse(('http://worldtimeapi.org/api/timezone/$url')));
      Map data = jsonDecode(response.body);

      // get properties from json
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // create DateTime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // check is it day or night
      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;

      // set the time property
      time = DateFormat('jm').format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time';
    }
    return time;
  }
}
