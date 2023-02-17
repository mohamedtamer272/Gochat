class MyUser {
  static const String Collection_name = 'Users';
  String id;
  String fName;
  String lName;
  String email;

  MyUser(
      {required this.id,
      required this.fName,
      required this.lName,
      required this.email});

  MyUser.fromJson(Map<String, dynamic> json)
      : this(
          id: json['id'],
          fName: json['fName'],
          lName: json['lName'],
          email: json['email'],
        );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "fName": fName,
      "lName": lName,
      "email": email,
    };
  }
}
