

import 'dart:convert';

List<Person> personFromJson(String str) => List<Person>.from(json.decode(str).map((x) => Person.fromJson(x)));

String personToJson(List<Person> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Person {
    Person({
       required this.firstName,
       required this.lastName,
       required this.avatar,
       required this.employment,
    });

    String firstName;
    String lastName;
    String avatar;
    Employment employment;

    factory Person.fromJson(Map<String, dynamic> json) => Person(
        firstName: json["first_name"],
        lastName: json["last_name"],
        avatar: json["avatar"],
        employment: Employment.fromJson(json["employment"]),
    );

    Map<String, dynamic> toJson() => {
        "first_name": firstName,
        "last_name": lastName,
        "avatar": avatar,
        "employment": employment.toJson(),
    };
}

class Employment {
    Employment({
       required this.title,
       required this.keySkill,
    });

    String title;
    String keySkill;

    factory Employment.fromJson(Map<String, dynamic> json) => Employment(
        title: json["title"],
        keySkill: json["key_skill"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "key_skill": keySkill,
    };
}
