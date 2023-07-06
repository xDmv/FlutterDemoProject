import 'package:example_app/utils/always_disabled_focus_node.dart';
import 'package:flutter/widgets.dart';

mixin DisposablesMixin<T extends StatefulWidget> on State<T> {
  final _ctrls = <TextEditingController>[];
  final _nodes = <FocusNode>[];

  TextEditingController createCtrl({String? text}) {
    final ctrl = TextEditingController(text: text);
    _ctrls.add(ctrl);

    return ctrl;
  }

  FocusNode createNode() {
    final node = FocusNode();
    _nodes.add(node);

    return node;
  }

  FocusNode createDisabledNode() {
    final node = AlwaysDisabledFocusNode();
    _nodes.add(node);

    return node;
  }

  @override
  void dispose() {
    for (final controller in _ctrls) {
      controller.dispose();
    }
    for (final node in _nodes) {
      node.dispose();
    }

    return super.dispose();
  }
}
