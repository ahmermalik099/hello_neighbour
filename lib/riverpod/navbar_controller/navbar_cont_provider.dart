import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_neighbour/riverpod/navbar_controller/navbar_cont_state.dart';


final navItemProver = StateNotifierProvider<NavItemState, NotchBottomBarController>((ref) { //counter is the value/state, String is the type of the state
  return NavItemState();
});
