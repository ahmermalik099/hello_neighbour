import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_neighbour/riverpod/refresh/refresh_state.dart';

final refreshProvider = StateNotifierProvider<RefreshState, bool>((ref) {
  return RefreshState();
});
