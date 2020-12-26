import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_css_style/flutter_css_style.dart';

export 'alert_action.dart';
export 'alert_quick.dart';

const EdgeInsets _defaultInsetPadding =
    EdgeInsets.symmetric(horizontal: 40.0, vertical: 24.0);

class NeAlertDialog extends StatelessWidget {
  /// Creates an alert dialog.
  ///
  /// Typically used in conjunction with [showDialog].
  ///
  /// The [contentPadding] must not be null. The [titlePadding] defaults to
  /// null, which implies a default that depends on the values of the other
  /// properties. See the documentation of [titlePadding] for details.
  const NeAlertDialog({
    Key key,
    this.title,
    this.titlePadding,
    this.titleTextStyle,
    this.content,
    this.contentPadding = const EdgeInsets.fromLTRB(24.0, 20.0, 24.0, 24.0),
    this.contentTextStyle,
    this.actions,
    this.actionsPadding = EdgeInsets.zero,
    this.actionsOverflowDirection,
    this.actionsOverflowButtonSpacing,
    this.buttonPadding,
    this.backgroundColor,
    this.elevation,
    this.semanticLabel,
    this.insetPadding = _defaultInsetPadding,
    this.clipBehavior = Clip.none,
    this.shape,
    this.scrollable = false,
    this.barrierDismissible,
  })  : assert(contentPadding != null),
        assert(clipBehavior != null),
        super(key: key);

  /// The (optional) title of the dialog is displayed in a large font at the top
  /// of the dialog.
  ///
  /// Typically a [Text] widget.
  final Widget title;

  /// Padding around the title.
  ///
  /// If there is no title, no padding will be provided. Otherwise, this padding
  /// is used.
  ///
  /// This property defaults to providing 24 pixels on the top, left, and right
  /// of the title. If the [content] is not null, then no bottom padding is
  /// provided (but see [contentPadding]). If it _is_ null, then an extra 20
  /// pixels of bottom padding is added to separate the [title] from the
  /// [actions].
  final EdgeInsetsGeometry titlePadding;

  /// Style for the text in the [title] of this [MyDialog].
  ///
  /// If null, [DialogTheme.titleTextStyle] is used, if that's null, defaults to
  /// [ThemeData.textTheme.headline6].
  final TextStyle titleTextStyle;

  /// The (optional) content of the dialog is displayed in the center of the
  /// dialog in a lighter font.
  ///
  /// Typically this is a [SingleChildScrollView] that contains the dialog's
  /// message. As noted in the [MyDialog] documentation, it's important
  /// to use a [SingleChildScrollView] if there's any risk that the content
  /// will not fit.
  final Widget content;

  /// Padding around the content.
  ///
  /// If there is no content, no padding will be provided. Otherwise, padding of
  /// 20 pixels is provided above the content to separate the content from the
  /// title, and padding of 24 pixels is provided on the left, right, and bottom
  /// to separate the content from the other edges of the dialog.
  final EdgeInsetsGeometry contentPadding;

  /// Style for the text in the [content] of this [MyDialog].
  ///
  /// If null, [DialogTheme.contentTextStyle] is used, if that's null, defaults
  /// to [ThemeData.textTheme.subtitle1].
  final TextStyle contentTextStyle;

  final bool barrierDismissible;

  /// The (optional) set of actions that are displayed at the bottom of the
  /// dialog.
  ///
  /// Typically this is a list of [FlatButton] widgets.
  ///
  /// These widgets will be wrapped in a [ButtonBar], which introduces 8 pixels
  /// of padding on each side.
  ///
  /// If the [title] is not null but the [content] _is_ null, then an extra 20
  /// pixels of padding is added above the [ButtonBar] to separate the [title]
  /// from the [actions].
  final List<Widget> actions;

  /// Padding around the set of [actions] at the bottom of the dialog.
  ///
  /// Typically used to provide padding to the button bar between the button bar
  /// and the edges of the dialog.
  ///
  /// If are no [actions], then no padding will be included. The padding around
  /// the button bar defaults to zero. It is also important to note that
  /// [buttonPadding] may contribute to the padding on the edges of [actions] as
  /// well.
  ///
  /// {@tool snippet}
  /// This is an example of a set of actions aligned with the content widget.
  /// ```dart
  /// MyDialog(
  ///   title: Text('Title'),
  ///   content: Container(width: 200, height: 200, color: Colors.green),
  ///   actions: <Widget>[
  ///     RaisedButton(onPressed: () {}, child: Text('Button 1')),
  ///     RaisedButton(onPressed: () {}, child: Text('Button 2')),
  ///   ],
  ///   actionsPadding: EdgeInsets.symmetric(horizontal: 8.0),
  /// )
  /// ```
  /// {@end-tool}
  ///
  /// See also:
  ///
  /// * [ButtonBar], which [actions] configures to lay itself out.
  final EdgeInsetsGeometry actionsPadding;

  /// The vertical direction of [actions] if the children overflow
  /// horizontally.
  ///
  /// If the dialog's [actions] do not fit into a single row, then they
  /// are arranged in a column. The first action is at the top of the
  /// column if this property is set to [VerticalDirection.down], since it
  /// "starts" at the top and "ends" at the bottom. On the other hand,
  /// the first action will be at the bottom of the column if this
  /// property is set to [VerticalDirection.up], since it "starts" at the
  /// bottom and "ends" at the top.
  ///
  /// If null then it will use the surrounding
  /// [ButtonBarTheme.overflowDirection]. If that is null, it will
  /// default to [VerticalDirection.down].
  ///
  /// See also:
  ///
  /// * [ButtonBar], which [actions] configures to lay itself out.
  final VerticalDirection actionsOverflowDirection;

  /// The spacing between [actions] when the button bar overflows.
  ///
  /// If the widgets in [actions] do not fit into a single row, they are
  /// arranged into a column. This parameter provides additional
  /// vertical space in between buttons when it does overflow.
  ///
  /// Note that the button spacing may appear to be more than
  /// the value provided. This is because most buttons adhere to the
  /// [MaterialTapTargetSize] of 48px. So, even though a button
  /// might visually be 36px in height, it might still take up to
  /// 48px vertically.
  ///
  /// If null then no spacing will be added in between buttons in
  /// an overflow state.
  final double actionsOverflowButtonSpacing;

  /// The padding that surrounds each button in [actions].
  ///
  /// This is different from [actionsPadding], which defines the padding
  /// between the entire button bar and the edges of the dialog.
  ///
  /// If this property is null, then it will use the surrounding
  /// [ButtonBarTheme.buttonPadding]. If that is null, it will default to
  /// 8.0 logical pixels on the left and right.
  ///
  /// See also:
  ///
  /// * [ButtonBar], which [actions] configures to lay itself out.
  final EdgeInsetsGeometry buttonPadding;

  /// {@macro flutter.material.dialog.backgroundColor}
  final Color backgroundColor;

  /// {@macro flutter.material.dialog.elevation}
  /// {@macro flutter.material.material.elevation}
  final double elevation;

  /// The semantic label of the dialog used by accessibility frameworks to
  /// announce screen transitions when the dialog is opened and closed.
  ///
  /// If this label is not provided, a semantic label will be inferred from the
  /// [title] if it is not null.  If there is no title, the label will be taken
  /// from [MaterialLocalizations.MyDialogLabel].
  ///
  /// See also:
  ///
  ///  * [SemanticsConfiguration.isRouteName], for a description of how this
  ///    value is used.
  final String semanticLabel;

  /// {@macro flutter.material.dialog.insetPadding}
  final EdgeInsets insetPadding;

  /// {@macro flutter.material.dialog.clipBehavior}
  final Clip clipBehavior;

  /// {@macro flutter.material.dialog.shape}
  final ShapeBorder shape;

  /// Determines whether the [title] and [content] widgets are wrapped in a
  /// scrollable.
  ///
  /// This configuration is used when the [title] and [content] are expected
  /// to overflow. Both [title] and [content] are wrapped in a scroll view,
  /// allowing all overflowed content to be visible while still showing the
  /// button bar.
  final bool scrollable;

  @override
  Widget build(BuildContext context) {
    assert(debugCheckHasMaterialLocalizations(context));
    final style = StaticStyle.of(context);
    final ThemeData theme = Theme.of(context);

    String label = semanticLabel;
    if (title == null) {
      switch (theme.platform) {
        case TargetPlatform.iOS:
        case TargetPlatform.macOS:
          label = semanticLabel;
          break;
        case TargetPlatform.android:
        case TargetPlatform.fuchsia:
        case TargetPlatform.linux:
        case TargetPlatform.windows:
          label = semanticLabel ??
              MaterialLocalizations.of(context)?.alertDialogLabel;
      }
    }

    Widget titleWidget;
    Widget contentWidget;
    Widget actionsWidget;
    if (title != null)
      titleWidget = Padding(
        padding: titlePadding ??
            EdgeInsets.fromLTRB(24.0, 18.0, 24.0, content == null ? 20.0 : 0.0),
        child: DefaultTextStyle(
          child: Semantics(
            child: Center(
              child: title,
            ),
            namesRoute: true,
            container: true,
          ),
          style: titleTextStyle ??
              TextStyle(
                fontFamily: style.get('alert-dialog-header-text-font-family'),
                fontSize: style.get('alert-dialog-header-text-font-size'),
                fontWeight: style.get('alert-dialog-header-text-font-weight'),
                color: style.get('alert-dialog-header-text-color'),
              ),
        ),
      );

    if (content != null)
      contentWidget = Padding(
        padding: contentPadding,
        child: DefaultTextStyle(
          child: content,
          style: titleTextStyle ??
              TextStyle(
                color: style.get('alert-dialog-text-color'),
                fontFamily: style.get('alert-dialog-text-font-family'),
                fontSize: style.get('alert-dialog-text-font-size'),
                fontWeight: style.get('alert-dialog-text-font-weight'),
              ),
        ),
      );

    if (actions != null)
      actionsWidget = Container(
        // padding: actionsPadding,
        height: 45,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          mainAxisSize: MainAxisSize.max,
          children: actions,
        ),
      );

    final List<Widget> columnChildren = [];
    if (title != null) {
      columnChildren.add(titleWidget);
    }

    if (scrollable) {
      columnChildren.add(Flexible(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              if (content != null) contentWidget,
            ],
          ),
        ),
      ));
    } else {
      if (content != null) {
        columnChildren.add(Flexible(child: contentWidget));
      }
    }

    columnChildren.add(Divider(
      height: 0,
      color: style.get('alert-dialog-divider-color'),
    ));

    if (actions != null) {
      columnChildren.add(actionsWidget);
    }

    Widget dialogChild = IntrinsicWidth(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: columnChildren,
      ),
    );

    if (label != null)
      dialogChild = Semantics(
        namesRoute: true,
        label: label,
        child: dialogChild,
      );

    return WillPopScope(
        onWillPop: () async {
          return barrierDismissible;
        },
        child: Dialog(
          backgroundColor:
              backgroundColor ?? style.get('card-background-color'),
          elevation: elevation,
          insetPadding: insetPadding,
          clipBehavior: clipBehavior,
          shape: shape,
          child: dialogChild,
        ));
  }
}
