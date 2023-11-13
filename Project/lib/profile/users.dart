class Users {
  String firstName;
  String lastName;
  String userName;
  String age;
  String password;
  String height;
  String weight;
  String gender;

  Users({
    required this.firstName,
    required this.lastName,
    required this.userName,
    required this.password,
    required this.age,
    required this.height,
    required this.weight,
    required this.gender,
  });

  factory Users.fromJson(Map<String, dynamic> json) {
    return Users(
      firstName: json["firstName"],
      lastName: json["lastName"],
      userName: json["userName"],
      password: json["password"],
      age: json["age"],
      height: json["height"],
      weight: json["weight"],
      gender: json["gender"],
    );
  }
}
