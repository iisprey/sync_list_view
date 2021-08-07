import 'package:flutter/material.dart';

class SyncTab {
  final Widget Function(bool isActive) tab;
  final Widget title;
  final ScrollView body;

  SyncTab({
    required this.tab,
    required this.title,
    required this.body,
  }) : assert(body.shrinkWrap && body.physics is NeverScrollableScrollPhysics);
}
