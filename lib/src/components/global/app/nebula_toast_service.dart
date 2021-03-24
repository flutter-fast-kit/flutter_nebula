import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

/// Use this to push toasts using [NeToastService.of()].
///
/// ```dart
/// NeToastService.of(context).pushToast(toast: NeToast(...));
/// ```
class NeToastService extends StatefulWidget {
  final Widget child;

  const NeToastService({Key? key, required this.child}) : super(key: key);

  @override
  NeToastServiceState createState() => NeToastServiceState();

  static NeToastServiceState? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<_NeToastServiceInherited>()?.data;
  }
}

class NeToastServiceState extends State<NeToastService> {
  late List<NeToast> _toastQueue;
  late ScrollController _toastScrollController;

  @override
  void initState() {
    _toastQueue = [];
    _toastScrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _toastScrollController.dispose();
    super.dispose();
  }

  /// Removes a toast from the list. Refer to [NeToast] for styling info.
  void removeToast(NeToast toast) {
    _toastQueue.remove(toast);
    setState(() {});
  }

  /// Pushes a new toast to the list. Refer to [NeToast] for styling info.
  void pushToast({required NeToast toast}) {
    _toastQueue.add(toast);
    _toastScrollController.animateTo(0.0, duration: Duration(milliseconds: 300), curve: Curves.easeInOut);
    setState(() {});
  }

  Widget _buildOverlay(BuildContext context) {
    var children = <Widget>[];
    for (var toast in _toastQueue) {
      children.add(
        NeToastWidget(
          key: ValueKey(toast),
          data: toast,
          padding: const EdgeInsets.only(top: 16.0),
          serviceRemoveToastCallback: () => removeToast(toast),
        ),
      );
    }

    return Container(
      alignment: Alignment.bottomRight,
      padding: const EdgeInsets.only(
        bottom: 48.0,
        top: 128.0,
      ),
      child: SingleChildScrollView(
        controller: _toastScrollController,
        reverse: true,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: children,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _NeToastServiceInherited(
      data: this,
      child: Stack(
        children: <Widget>[
          widget.child,
          Align(
            alignment: Alignment.bottomRight,
            child: _buildOverlay(context),
          ),
        ],
      ),
    );
  }
}

class _NeToastServiceInherited extends InheritedWidget {
  final NeToastServiceState? data;
  final Widget child;

  _NeToastServiceInherited({Key? key, required this.child, this.data}) : super(key: key, child: child);

  @override
  bool updateShouldNotify(_NeToastServiceInherited oldWidget) => false;
}
