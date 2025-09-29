import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../services/firebase_services/auth_repo.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _repo;
  late final StreamSubscription<User?> _sub;



  AuthCubit(this._repo) : super(const AuthInitial()) {
    _sub = _repo.userChanges.listen((user) {
      if (user == null) {
        emit(AuthUnAuthenticated());
      } else {
        emit(AuthAuthenticated(user));
      }
    });
  }


  Future<void> signInWithEmail(String email, String password) async {
    try {
      emit(const AuthLoading());
      await _repo.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

    } on FirebaseAuthException catch (e) {
      emit(AuthUnAuthenticated(e.message));
    }
  }


  Future<void> registerWithEmail(String email, String password) async {
    try {
      emit(const AuthLoading());
      UserCredential userCredential = await _repo.registerWithEmail(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {

        emit(AuthAuthenticated(userCredential.user!));
      }


    } on FirebaseAuthException catch (e) {
      emit(AuthUnAuthenticated(e.message));
    }
  }

  Future<void> signOut() async {
    await _repo.signOut();
  }

  @override
  Future<void> close() {
    _sub.cancel();
    return super.close();
  }


}