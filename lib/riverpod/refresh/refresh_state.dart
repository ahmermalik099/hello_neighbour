import 'package:flutter_riverpod/flutter_riverpod.dart';

class RefreshState extends StateNotifier<bool>{

  RefreshState() : super(false);

  void refresh(){
    state = !state;
  }

}