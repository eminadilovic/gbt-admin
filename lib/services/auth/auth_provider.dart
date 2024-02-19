import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'model/auth_results.dart';
import 'notifiers/auth_state_notifier.dart';

final authStateProvider = StateNotifierProvider<AuthStateNotifier, AuthState>(
  (ref) => AuthStateNotifier(),
);
