library sync_list_view;

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'controller.dart';
import 'sync_tab.dart';

export 'sync_tab.dart';
export 'sync_list_view.dart';

class SyncListView extends StatelessWidget {
  final List<SyncTab> children;
  const SyncListView({required this.children});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(SyncListViewController());
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 45,
          child: ScrollablePositionedList.builder(
            itemCount: children.length,
            scrollDirection: Axis.horizontal,
            itemScrollController: c.tabScrollController,
            padding: const EdgeInsets.symmetric(vertical: 2.5),
            itemBuilder: (_, index) {
              return GetBuilder<SyncListViewController>(
                builder: (c) {
                  return GestureDetector(
                    child: children[index].tab(c.index == index),
                    onTap: () => c.onTabPressed(index),
                  );
                },
              );
            },
          ),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ScrollablePositionedList.builder(
            itemScrollController: c.bodyScrollController,
            itemPositionsListener: c.bodyPositionsListener,
            physics: const BouncingScrollPhysics(),
            itemCount: children.length,
            itemBuilder: (_, index) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32),
                children[index].title,
                children[index].body,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
