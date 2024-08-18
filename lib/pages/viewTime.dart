import 'package:flutter/material.dart';

class Viewtime extends StatefulWidget {
  const Viewtime({super.key});

  @override
  State<Viewtime> createState() => _Viewtime();
}

class _Viewtime extends State<Viewtime> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    dynamic args = ModalRoute.of(context)!.settings.arguments as Map?;

    bool isDayTime = args['isDayTime'];
    String bgImage = isDayTime ? 'day.png' : 'night.png';
    Color bgColor = isDayTime ? Colors.blue! : Colors.indigo[700]!;

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 0),
            child: Column(
              children: <Widget>[
                TextButton.icon(
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, '/chooseLocation');
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[400],
                    ),
                    label: Text(
                      'Change Location',
                      style: TextStyle(
                        color: Colors.grey[400],
                      ),
                    )),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      args['location'],
                      style: TextStyle(
                        fontSize: 28.0,
                        letterSpacing: 2.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(args['time'],
                    style: TextStyle(
                      fontSize: 66.0,
                      color: Colors.white,
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
