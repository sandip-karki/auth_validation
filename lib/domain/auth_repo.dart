abstract class Authrepo {
  Future login({
    required String email,
    required String password,
  });
  Future register({
    required String email,
    required String password,
    required String name,
  });
}
