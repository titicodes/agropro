import 'package:flutter/material.dart';

class CamerapageModel extends ChangeNotifier {
  final FocusNode unfocusNode = FocusNode();

  @override
  void dispose() {
    unfocusNode.dispose();
    super.dispose();
  }
}