class Authhelper {
  static bool checkUserInputs(
      {required String email, required String password}) {
    if (email.isEmpty || password.isEmpty) {
      return false;
    }
    return true;
  }
}

class Registerhelper {
  static bool checkUserInputs(
      {required String email, required String password, required String name}) {
    if (email.isEmpty || password.isEmpty || name.isEmpty) {
      return false;
    }
    return true;
  }
}
