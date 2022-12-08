import 'dart:math';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:json_serializable_flutter/Future/HomePage/Services/UserService.dart';
import '../../../Widgets/card.dart';
import '../Model/person_model.dart';
import '../ViewModel/homePage_cubit.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    static BaseOptions options = BaseOptions(baseUrl:"https://random-data-api.com/api/v2");

  final userCubit=UserCubit(UserService(Dio(options)));
  @override
  Widget build(BuildContext context) {
 

    return Scaffold(

      appBar: AppBar(
        
      ),
      body: BlocProvider( create: (context) => userCubit,
      child: BlocConsumer<UserCubit, UserState>(
        listener: (context, state) {
        },
        builder: (context, state) {
          
          if(state is UserCompletedState){
 return ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    leading: CircleAvatar(
                        backgroundImage:
                            NetworkImage(state.model[index].avatar!)),
                    title: Text(state.model[index].email!),
                  ),
                );
              },
              itemCount: state.model.length,
            );          }
            else if(state is UserLoadingState){
              return Center(child: CircularProgressIndicator(),);
            }
            return Center(child: Text("Bir hata oluştu",style: TextStyle(decoration: TextDecoration.none),),);
        },
      ),
      ),
    );
    }
}
