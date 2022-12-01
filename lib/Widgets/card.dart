import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.color1,
    required this.color2,
    required this.url,
    required this.title,
    required this.name,
    required this.surname,
  });

  final Color color1;
  final Color color2;
  final String url;
  final String title;
  final String name;
  final String surname;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 15, right: 5, left: 5),
      height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment(0.8, 1),
          colors: <Color>[color1, color2],
          tileMode: TileMode.mirror,
        ),
      ),
      child: Row(
        children: [
          Center(
            child: CircleAvatar(
              radius: 35,
              backgroundImage: NetworkImage(url),
              backgroundColor: Colors.transparent,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width-120,
                child: Text(
                  
                title,
                textAlign:TextAlign.center,
                maxLines: 2,
                style:const TextStyle(
                  
                  fontSize: 25,
                  decoration: TextDecoration.none,
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                ),
              ),),
              Container(
                width: MediaQuery.of(context).size.width-120,
              height: 1,
              color: Colors.grey,
              ),
               SizedBox(
                width: MediaQuery.of(context).size.width-120,
                child:   Text(
                name+" "+surname,
                maxLines: 2,
                textAlign: TextAlign.center,
                style:const TextStyle(
                  fontSize: 25,
                  decoration: TextDecoration.none,
                  color: Colors.black,
                  fontWeight: FontWeight.normal,
                ),
              ),)
            ],
          )
        ],
      ),
    );
  }
}
