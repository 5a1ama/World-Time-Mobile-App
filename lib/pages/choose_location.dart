import 'package:flutter/material.dart';
import 'package:world_time_app/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  void initState() {
    super.initState();
  }

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Berlin', flag: 'germany.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(2.0, 25.0, 2.0, 15.0),
              child: Text(
                'select a location:',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[200],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: locations.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 4.0),
                    child: Card(
                      child: ListTile(
                        onTap: () {
                          Navigator.pushReplacementNamed(context, '/loading', arguments: {
                            'instance': locations[index]
                          });
                        },
                        tileColor: Colors.grey[200],
                        title: Text(locations[index].location),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage('assets/${locations[index].flag}'),
                        ),
                      ),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      )
    );
  }
}
