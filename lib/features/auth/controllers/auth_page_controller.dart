import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider = StateNotifierProvider<AuthController, dynamic>((ref) => AuthController(null, null));

class AuthController extends StateNotifier<AsyncValue<User>> {
  final String? email;
  final String? password;

  AuthController(this.email, this.password) : super(const AsyncLoading());
}
