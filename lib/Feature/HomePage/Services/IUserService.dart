import 'package:dio/dio.dart';

import '../Model/person_model.dart';

abstract class IUserSercice{
  final Dio dio;

  IUserSercice(this.dio);
   Future<List<Person>?> getPerson({int size=20});
}