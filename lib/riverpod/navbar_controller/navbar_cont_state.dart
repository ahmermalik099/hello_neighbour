
import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavItemState extends StateNotifier<NotchBottomBarController> {
  NavItemState() : super(NotchBottomBarController(index: 0));

  void updateIndex(int i){
    state.jumpTo(i);
  }

}