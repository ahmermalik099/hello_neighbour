import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_neighbour/models/user.dart';
import 'package:hello_neighbour/riverpod/bottomsheet/bottomsheet_state.dart';

final bottomSheetUserProvider =
    StateNotifierProvider<BottomSheetUserState, MyUser? >((ref) {

  return BottomSheetUserState();
});
