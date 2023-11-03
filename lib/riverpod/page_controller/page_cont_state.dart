import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PageControllerState extends StateNotifier<PageController> {
  PageControllerState() : super(PageController(initialPage: 0));
  
  void updateIndex(int i){
    state.jumpToPage(i);
  }

}