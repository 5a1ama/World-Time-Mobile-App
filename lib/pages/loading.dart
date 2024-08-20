import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setupWorldTime();
    });
  }

  void setupWorldTime() async {
    try {
      dynamic args = ModalRoute.of(context)!.settings.arguments as Map;
      WorldTime instance = args['instance'];
      String time = await instance.getTime();

      if(mounted) {
        Navigator.pushReplacementNamed(context, '/viewTime', arguments: {
          'location': instance.location,
          'flag': instance.flag,
          'time': time,
          'isDayTime': instance.isDayTime
        });
      }
    } catch (e) {
      print('Error fetching time: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    dynamic args = ModalRoute.of(context)!.settings.arguments as Map;
    WorldTime instance = args['instance'];

    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'getting time in ${instance.location}',
                style: TextStyle(
                  color: Colors.grey[200],
                  fontSize: 28.0,
                  letterSpacing: 2.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 40.0),
              SpinKitCircle(
                color: Colors.grey[200],
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
