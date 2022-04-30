import 'package:defender/auth/models/models.dart';
import 'package:firebase_auth/firebase_auth.dart' as firebase_auth;

extension FirebaseAuthUserExtension on firebase_auth.User {
  User get toUser => User(
        id: uid,
        email: email,
        name: displayName,
        photo: photoURL,
      );
}
