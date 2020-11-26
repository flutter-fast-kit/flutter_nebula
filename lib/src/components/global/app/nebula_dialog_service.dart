import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula/src/nebula_internal.dart';

/// This is used to show dialogs. Use it with [NeDialogService.of()].
class NeDialogService extends StatefulWidget {
  final Widget child;

  const NeDialogService({Key key, this.child}) : super(key: key);

  @override
  NeDialogServiceState createState() => NeDialogServiceState();

  static NeDialogServiceState of(BuildContext context) {
    return (context.inheritFromWidgetOfExactType(_NeDialogServiceInherited)
            as _NeDialogServiceInherited)
        .data;
  }
}

class NeDialogServiceState extends State<NeDialogService> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  /// Pushes a general dialog with title, body, and actions. [title], [body], [context], [actions] must not be null.
  Future<T> pushDialog<T>({
    @required BuildContext context,
    @required String title,
    @required Widget body,
    List<Widget> actions = const [],
    NeWidgetStatus status = NeWidgetStatus.primary,
  }) {
    return Navigator.of(context).push(
      TransparentPageRoute(
        builder: (context) => NeDialog(
          child: body,
          header: Text(title),
          status: status,
          footerPadding: EdgeInsets.zero,
          footer: actions != null
              ? Wrap(
                  spacing: 8.0,
                  runSpacing: 8.0,
                  alignment: WrapAlignment.end,
                  children: actions,
                )
              : null,
        ),
      ),
    );
  }

  /// Pushes a custom dialog. Refer to [NeDialog] for styling info. [dialog] and [context] must not be null.
  Future<T> pushCustomDialog<T>({
    @required BuildContext context,
    @required NeDialog dialog,
  }) {
    return Navigator.of(context).push(
      TransparentPageRoute<T>(
        builder: (_) => dialog,
      ),
    );
  }

  /// Pushes an informational dialog. [title], [body], [context] must not be null. Provides 'close' button on bottom.
  Future pushInformationDialog({
    @required BuildContext context,
    @required String title,
    @required Widget body,
    NeWidgetStatus status = NeWidgetStatus.info,
  }) async {
    return Navigator.of(context).push(
      TransparentPageRoute(
        builder: (context) => NeDialog(
          child: body,
          header: Text(title),
          footerPadding: EdgeInsets.zero,
          status: status,
          footer: NeButton(
            onTap: () => Navigator.of(context).pop(),
            appearance: NeWidgetAppearance.ghost,
            label: Text('Close'),
            status: status,
          ),
        ),
      ),
    );
  }

  /// Pushes a loading dialog. [context] must not be null.
  pushLoadingDialog({
    @required BuildContext context,
    NeWidgetStatus status = NeWidgetStatus.primary,
  }) {
    return Navigator.of(context).push(
      TransparentPageRoute(
        builder: (context) => NeCard(
          shape: NeWidgetShape.round,
          child: NeSpinner(
            status: status,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _NeDialogServiceInherited(
      data: this,
      child: widget.child,
    );
  }
}

class _NeDialogServiceInherited extends InheritedWidget {
  final NeDialogServiceState data;
  final Widget child;

  _NeDialogServiceInherited({Key key, this.child, this.data})
      : super(key: key, child: child);

  @override
  bool updateShouldNotify(_NeDialogServiceInherited oldWidget) => false;
}
