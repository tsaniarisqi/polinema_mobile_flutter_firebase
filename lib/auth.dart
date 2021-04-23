import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final FirebaseAuth auth = FirebaseAuth.instance;

  // untuk melakukan login dengan email dan password
  Future<User> handleSignInEmail(String email, String password) async {
    UserCredential result =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    final User user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    final User currentUser = await auth.currentUser;
    assert(user.uid == currentUser.uid);

    print('signInEmail succeeded: $user');

    return user;
  }

  // untuk melakukan register dengan email dan password
  Future<User> handleSignUp(email, password) async {
    UserCredential result = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    final User user = result.user;

    assert(user != null);
    assert(await user.getIdToken() != null);

    return user;
  }

  Future<void> signOut() async {
    await FirebaseAuth.instance.signOut();
    print("User Signed Out");
  }
}
