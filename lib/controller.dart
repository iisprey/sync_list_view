import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class SyncListViewController extends GetxController {
  final tabScrollController = ItemScrollController();
  final bodyScrollController = ItemScrollController();
  final bodyPositionsListener = ItemPositionsListener.create();

  int index = 0;

  void _updateIndex(int i) {
    index = i;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    bodyPositionsListener.itemPositions.addListener(_onInnerViewScrolled);
  }

  void _onInnerViewScrolled() async {
    var positions = bodyPositionsListener.itemPositions.value;
    if (positions.isEmpty) return;
    var firstIndex = positions.elementAt(0).index;
    if (index == firstIndex) return;
    await _handleTabScroll(firstIndex);
  }

  Future<void> _handleTabScroll(int index) async {
    await tabScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 150),
      curve: Curves.decelerate,
    );
    _updateIndex(index);
  }

  void onTabPressed(int index) async {
    await tabScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeOut,
    );
    await bodyScrollController.scrollTo(
      index: index,
      duration: const Duration(milliseconds: 150),
      curve: Curves.decelerate,
    );
    _updateIndex(index);
  }

  @override
  void dispose() {
    bodyPositionsListener.itemPositions.removeListener(_onInnerViewScrolled);
    super.dispose();
  }
}
