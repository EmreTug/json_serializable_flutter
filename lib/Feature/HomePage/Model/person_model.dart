
import 'package:json_annotation/json_annotation.dart';
part 'person_model.g.dart';
@JsonSerializable()
class Person {
  String? first_name;
  String? last_name;
  String? username;
  String? email;
  String? avatar;
  Employment? employment;

  Person(
      {this.first_name,
      this.last_name,
      this.username,
      this.email,
      this.avatar,
      this.employment,
      });

  factory Person.fromJson(Map<String, dynamic> json) {
    return _$PersonFromJson(json);
    }

  Map<String, dynamic> toJson() {
   
    
    return _$PersonToJson(this);
  }
}
@JsonSerializable()

class Employment {
  String? title;
  String? keySkill;

  Employment({this.title, this.keySkill});

  factory Employment.fromJson(Map<String, dynamic> json) {
   return _$EmploymentFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$EmploymentToJson(this);
  }
}
