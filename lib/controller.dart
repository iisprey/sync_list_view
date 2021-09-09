import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SyncListViewController extends GetxController {
  final tabScrollController = ItemScrollController();
  final bodyScrollController = ItemScrollController();
  final bodyPositionsListener = ItemPositionsListener.create();

  int index = 0;

  // update index state
  void _updateIndex(int i) {
    index = i;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    bodyPositionsListener.itemPositions.addListener(_onInnerViewScrolled);
  }

  // listen scroll position and change tab index according to body index
  void _onInnerViewScrolled() async {
    var positions = bodyPositionsListener.itemPositions.value;
    var firstIndex = positions.elementAt(0).index;
    await _handleTabScroll(firstIndex);
  }

  // scroll tabbar to index position
  Future<void> _handleTabScroll(int index) async {
    await tabScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
    );
    _updateIndex(index);
  }

  // scroll listview to index position
  Future<void> _handleBodyScroll(int index) async {
    await bodyScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 150),
      curve: Curves.easeOut,
    );
    _updateIndex(index);
  }

  // on tab pressed scroll tab and listview to index position
  void onTabPressed(int index) async {
    await _handleTabScroll(index);
    await _handleBodyScroll(index);
  }

  @override
  void dispose() {
    bodyPositionsListener.itemPositions.removeListener(_onInnerViewScrolled);
    super.dispose();
  }
}
