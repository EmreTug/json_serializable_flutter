import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_serializable_flutter/Future/HomePage/Services/UserService.dart';
import '../ViewModel/homePage_cubit.dart';

class HomePage extends StatelessWidget {
  static BaseOptions options =
      BaseOptions(baseUrl: "https://random-data-api.com/api/v2");

  final userCubit = UserCubit(UserService(Dio(options)));

  HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    return buildScaffold();
  }

  Widget buildScaffold() {
    return Scaffold(
    appBar: AppBar(),
    body: BlocProvider(
      create: (context) => userCubit,
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {},
        builder: (context, state) {
          if (state is UserCompletedState) {
            return ListView.builder(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return CustomCard(
                    color1: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    color2: Colors
                        .primaries[Random().nextInt(Colors.primaries.length)],
                    url: state.model[index].avatar.toString(),
                    title: state.model[index].employment!.title.toString(),
                    name: state.model[index].first_name.toString(),
                    surname: state.model[index].last_name.toString());
              },
              itemCount: state.model.length,
            );
          } else if (state is UserLoadingState) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return const Center(
            child: Text(
              "Bir hata oluştu",
              style: TextStyle(decoration: TextDecoration.none),
            ),
          );
        },
      ),
    ),
  );
  }
}




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

