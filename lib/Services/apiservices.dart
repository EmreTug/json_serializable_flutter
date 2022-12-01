import 'dart:convert';

import 'package:json_serializable_flutter/Models/person.dart';
import 'package:http/http.dart' as http;

Future<List<Person>> getPerson() async {
  final response = await http
      .get(Uri.parse('https://random-data-api.com/api/v2/users?size=20'));

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
   
   return [
        for (final item in jsonDecode(response.body))
          Person.fromJson(item),
      ];  
} else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load person');
  }
}