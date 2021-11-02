import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class TenCloudFirebaseUser {
  TenCloudFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

TenCloudFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<TenCloudFirebaseUser> tenCloudFirebaseUserStream() =>
    FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<TenCloudFirebaseUser>(
            (user) => currentUser = TenCloudFirebaseUser(user));
