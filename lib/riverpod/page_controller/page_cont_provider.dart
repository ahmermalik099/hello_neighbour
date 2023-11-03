import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hello_neighbour/riverpod/page_controller/page_cont_state.dart';

final pageProvider = StateNotifierProvider<PageControllerState, PageController>((ref) { //counter is the value/state, String is the type of the state
  return PageControllerState();
});
