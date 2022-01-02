import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:udemy_clone/services/storage.dart';

class Authentication {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final SecureStorage _secureStorage = SecureStorage();

  Future<String> googleSignIn() async {
    final GoogleSignInAccount? googleSignInAccount =
        await _googleSignIn.signIn();

    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final AuthCredential authCredential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(authCredential);

    final User user = userCredential.user as User;

    assert(user.displayName != null);
    assert(user.email != null);

    final User currentUser = _firebaseAuth.currentUser as User;
    assert(currentUser.uid == user.uid);

    _secureStorage.writeSecureData('email', user.email as String);
    _secureStorage.writeSecureData('name', user.displayName as String);

    return 'Error Occurred';
  }

  Future<String> googleSignOut() async{
    _googleSignIn.signOut();
    return 'Error Occurred';
  }
}
