import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';

StyleData _getHeaderStyle(String status) {
  return StyleData({
    'action-sheet-header-$status-background-color': 'color-$status-default',
    'action-sheet-header-$status-text-color': 'text-control-color',
  });
}

final StyleData actionSheetStyle = StyleData({
  'action-sheet-background-color': 'background-basic-color-1',
  'action-sheet-text-color': 'text-basic-color',
  'action-sheet-text-font-family': 'text-paragraph-font-family',
  'action-sheet-text-font-weight': 'text-paragraph-font-weight',
  'action-sheet-text-font-size': 'text-paragraph-font-size',
  'action-sheet-border-width': 0.0,
  'action-sheet-border-color': Colors.transparent,
  'action-sheet-shape': 'widget-shape',
  'action-sheet-padding':
      const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
  'action-sheet-shadow': 'shadow',
  'action-sheet-divider-color': 'divider-color',
  'action-sheet-divider-width': 'divider-width',
  'action-sheet-header-background-color': 'action-sheet-background-color',
  'action-sheet-header-text-color': 'text-basic-color',
  'action-sheet-header-text-font-family': 'text-subtitle-font-family',
  'action-sheet-header-text-font-weight': 'text-subtitle-font-weight',
  'action-sheet-header-text-font-size': 'text-subtitle-font-size',
  'action-sheet-header-sub-text-color': 'text-hint-color',
  'action-sheet-header-sub-text-font-family': 'text-subtitle-2-font-family',
  'action-sheet-header-sub-text-font-weight': 'text-subtitle-2-font-weight',
  'action-sheet-header-sub-text-font-size': 'text-subtitle-2-font-size',
  'action-sheet-footer-space-background-color': 'background-basic-color-2',
  'action-sheet-footer-text-color': 'text-basic-color',
  'action-sheet-footer-text-font-family': 'text-subtitle-font-family',
  'action-sheet-footer-text-font-weight': 'text-subtitle-font-weight',
  'action-sheet-footer-text-font-size': 'text-subtitle-font-size',
  'action-sheet-item-text-color': 'text-basic-color',
  'action-sheet-item-text-font-family': 'text-label-font-family',
  'action-sheet-item-text-font-weight': 'text-label-font-weight',
  'action-sheet-item-text-font-size': 'text-label-font-size',
});
