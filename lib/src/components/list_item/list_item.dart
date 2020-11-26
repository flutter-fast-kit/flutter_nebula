import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula/src/nebula_internal.dart';

export 'package:flutter_nebula/src/components/list_item/list_item_style.dart';

/// NeListItem is used to display a line of information, typically in a list.
class NeListItem extends StatefulWidget {
  /// Icon to display before the content.
  final IconData icon;

  /// The main information of this item.
  final String title;

  /// Additional information.
  final String subtitle;

  /// Active means that this list item is highlighted (selected).
  final bool active;

  /// Controls the colors.
  final NeWidgetStatus status;

  /// This method is called when user presses the item.
  final VoidCallback onTap;

  /// Padding to use in this list item.
  final EdgeInsets padding;

  const NeListItem({
    Key key,
    this.icon,
    @required this.title,
    @required this.onTap,
    this.subtitle,
    this.status = NeWidgetStatus.primary,
    this.active = false,
    this.padding,
  }) : super(key: key);

  @override
  _NeListItemState createState() => _NeListItemState();
}

class _NeListItemState extends State<NeListItem> {
  bool isPressing = false;

  @override
  Widget build(BuildContext context) {
    final style = StaticStyle.of(context);
    final active = widget.active;
    final focused = isPressing;
    final disabled = widget.onTap == null;
    return OutlinedGestureDetector(
      onTap: widget.onTap,
      onOutlineChange: (v) => setState(() => isPressing = v),
      child: Container(
        padding: widget.padding ?? const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            if (widget.icon != null) ...[
              Icon(widget.icon,
                  color: style.get(generateSelector([
                    'list-item-icon',
                    (disabled) ? 'disabled' : widget.status,
                    (focused)
                        ? 'focused'
                        : (active)
                            ? 'active'
                            : null,
                    'color'
                  ]))),
              SizedBox(width: 16.0),
            ],
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  widget.title,
                  style: TextStyle(
                    fontWeight: style.get('list-item-title-font-weight'),
                    fontSize: style.get('list-item-title-font-size'),
                    fontFamily: style.get('list-item-title-font-family'),
                    color: style.get(generateSelector([
                      'list-item-title',
                      (disabled) ? 'disabled' : widget.status,
                      (focused)
                          ? 'focused'
                          : (active && !disabled)
                              ? 'active'
                              : null,
                      'color'
                    ])),
                  ),
                ),
                if (widget.subtitle != null)
                  Text(
                    widget.subtitle,
                    style: TextStyle(
                      fontWeight: style.get('list-item-subtitle-font-weight'),
                      fontSize: style.get('list-item-subtitle-font-size'),
                      fontFamily: style.get('list-item-subtitle-font-family'),
                      color: style.get(generateSelector([
                        'list-item-subtitle',
                        (disabled) ? 'disabled' : widget.status,
                        (focused)
                            ? 'focused'
                            : (active && !disabled)
                                ? 'active'
                                : null,
                        'color'
                      ])),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
