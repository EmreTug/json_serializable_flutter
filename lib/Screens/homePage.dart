import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:json_serializable_flutter/Models/person.dart';
import 'package:json_serializable_flutter/Services/apiservices.dart';

import '../Widgets/card.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    getPerson();
    final Color color1 = Color(0xff1f005c);
    final Color color2 = Color(0xffffb56b);
    final String url =
        "https://robohash.org/cumqueenimomnis.png?size=300x300&set=set1";
        final String title="Müşteri sorumlusu";
        final String name="deneme";
        final String surname="deneme";

    return
     Container(
        color: Colors.white,
        child:FutureBuilder<List<Person>>(
    future: getPerson(),
    builder: (context, snapshot) {
    
      if (snapshot.hasData) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(
          itemCount: snapshot.data!.length,
            itemBuilder:  (BuildContext context, int i){
              return               CustomCard(color1: Colors.primaries[Random().nextInt(Colors.primaries.length)], color2: Colors.primaries[Random().nextInt(Colors.primaries.length)], url: snapshot.data![i].avatar, title: snapshot.data![i].employment.title, name: snapshot.data![i].firstName, surname: snapshot.data![i].lastName);

            }
        )
        );
      } else if (snapshot.hasError) {
        return Text("${snapshot.error}");
      }


      // By default, show a loading spinner.
      return CircularProgressIndicator();
    },
  ),);
  }
}

