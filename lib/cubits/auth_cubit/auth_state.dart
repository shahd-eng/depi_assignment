import 'package:firebase_auth/firebase_auth.dart';




sealed class AuthState {
  const AuthState();
}

final class AuthInitial extends AuthState {
  const AuthInitial();
}


final class AuthLoading extends AuthState {
  const AuthLoading();
}

final class AuthAuthenticated extends AuthState {
  final User user;
  const AuthAuthenticated(this.user);
}


final class AuthUnAuthenticated extends AuthState {
  final String? message;
   AuthUnAuthenticated([this.message]);

}

