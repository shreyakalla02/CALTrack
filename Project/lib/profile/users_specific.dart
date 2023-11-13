import 'package:flutter/material.dart';
import 'users.dart';

final Map<String, Users> initialData = {
  "sarah02": Users(
    firstName: "Sarah",
    lastName: "John",
    userName: "sarah02",
    password: "securePassword1",
    age: "19",
    height: "67",
    weight: "120",
    gender: "Female",
  ),
  "billy1989": Users(
    firstName: "Billy",
    lastName: "Kole",
    userName: "billy1989",
    password: "securePassword2",
    age: "35",
    height: "69",
    weight: "175",
    gender: "Male",
  ),
  "alice_johnson": Users(
    firstName: "Alice",
    lastName: "Johnson",
    userName: "alice89",
    password: "securePassword3",
    age: "28",
    height: "65",
    weight: "140",
    gender: "Female",
  ),
  "ra_awesome": Users(
    firstName: "Robert",
    lastName: "Anderson",
    userName: "ra_awesome",
    password: "securePass4",
    age: "50",
    height: "70",
    weight: "200",
    gender: "Male",
  ),
};

class UserSpecific with ChangeNotifier {
  final Map<String, Users> _userDatabase = initialData;
  Users? _currentUser;

  bool login(String userName, String password) {
    if (_userDatabase[userName]?.password == password) {
      _currentUser = _userDatabase[userName];
      notifyListeners();
      return true;
    }

    return false;
  }

  List signUp(
      String firstName,
      String lastName,
      String userName,
      String password,
      String confirmPassword,
      String age,
      String height,
      String weight,
      String gender) {
    if (_userDatabase.containsKey(userName)) {
      return [false, "Sorry, an account with this username already exists!"];
    }
    if (password != confirmPassword) {
      return [false, "Passwords do not match. Please try again."];
    }
    if (gender.toLowerCase() != "female" || gender.toLowerCase() != "male") {
      return [false, "Please input either Female or Male."];
    }
    _userDatabase[userName] = Users(
        firstName: firstName,
        lastName: lastName,
        userName: userName,
        password: password,
        age: age,
        height: height,
        weight: weight,
        gender: gender);

    notifyListeners();
    return [true];
  }

  bool editProfile(
    String firstName,
    String lastName,
    String userName,
    String age,
    String password,
    String height,
    String weight,
    String gender,
  ) {
    String oldUserName = currentUser!.userName;

    Users loggedInUserAcc = _userDatabase[oldUserName]!;

    loggedInUserAcc.firstName = firstName;
    loggedInUserAcc.lastName = lastName;
    loggedInUserAcc.userName = userName;
    loggedInUserAcc.password = password;
    loggedInUserAcc.age = age;
    loggedInUserAcc.height = height;
    loggedInUserAcc.weight = weight;
    loggedInUserAcc.gender = gender;

    _userDatabase[userName] = loggedInUserAcc;

    if (userName != oldUserName) {
      _userDatabase.remove(oldUserName);
    }

    currentUser!.firstName = firstName;
    currentUser!.lastName = lastName;
    currentUser!.userName = userName;
    currentUser!.password = password;
    currentUser!.age = age;
    currentUser!.height = height;
    currentUser!.weight = weight;
    currentUser!.gender = gender;

    notifyListeners();

    return true;
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  void deleteAccount() {
    _userDatabase.remove(_currentUser!.userName);
    _currentUser = null;
    notifyListeners();
  }

  Users? get currentUser => _currentUser;
  Map<String, Users> get userDatabase => _userDatabase;
}
