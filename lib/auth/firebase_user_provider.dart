import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class HumasInFirebaseUser {
  HumasInFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

HumasInFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<HumasInFirebaseUser> humasInFirebaseUserStream() => FirebaseAuth.instance
    .authStateChanges()
    .debounce((user) => user == null && !loggedIn
        ? TimerStream(true, const Duration(seconds: 1))
        : Stream.value(user))
    .map<HumasInFirebaseUser>(
        (user) => currentUser = HumasInFirebaseUser(user));
