
import 'package:json_serializable_flutter/Future/HomePage/Services/IUserService.dart';

import '../Model/person_model.dart';

class UserService extends IUserSercice {
  UserService(super.dio);

  @override
  Future<List<Person>?> getPerson({int size = 20}) async {
    final response = await dio.get('/users', queryParameters: {'size': size});

    if (response.statusCode == 200) {
      return [for (final item in response.data) Person.fromJson(item)];
    } else {
      throw Exception('Failed to load person');
    }
  }
}
