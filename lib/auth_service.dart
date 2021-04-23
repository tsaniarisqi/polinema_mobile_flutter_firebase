import 'package:firebase/signInSignUpResult.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;

  // untuk mendaftarkan user dengan input email dan password
  static Future<SignInSignUpResult> createUser(
      {String email, String pass}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email, password: pass);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: (e.message));
    }
  }

  // untuk login menggunakan email dan password yang sudah didaftarkan
  static Future<SignInSignUpResult> signInWithEmail(
      {String email, String pass}) async {
    try {
      UserCredential result =
          await _auth.signInWithEmailAndPassword(email: email, password: pass);
      return SignInSignUpResult(user: result.user);
    } catch (e) {
      return SignInSignUpResult(message: (e.message));
    }
  }

  // untuk logout
  static void signOut() {
    _auth.signOut();
  }
}
