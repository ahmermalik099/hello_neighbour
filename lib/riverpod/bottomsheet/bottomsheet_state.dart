import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_neighbour/models/user.dart';

class BottomSheetUserState extends StateNotifier<MyUser?> {
  BottomSheetUserState() : super(null);

  void setUser(MyUser user) {
    state = user;
  }
  void emptyUser(){
    state = null;
  }
}