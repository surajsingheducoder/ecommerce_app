import 'dart:convert';

List<UserDetail> userDetailFromJson(String str) => List<UserDetail>.from(json.decode(str).map((x) => UserDetail.fromJson(x)));

String userDetailToJson(List<UserDetail> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserDetail {
  int id;
  String name;
  int age;
  String email;
  int phone;
  String imgeUrl;

  UserDetail({
    required this.id,
    required this.name,
    required this.age,
    required this.email,
    required this.phone,
    required this.imgeUrl,
  });

  factory UserDetail.fromJson(Map<String, dynamic> json) => UserDetail(
    id: json["id"],
    name: json["name"],
    age: json["age"],
    email: json["email"],
    phone: json["phone"],
    imgeUrl: json["imgeUrl"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "age": age,
    "email": email,
    "phone": phone,
    "imgeUrl": imgeUrl,
  };
}
