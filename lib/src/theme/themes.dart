import 'package:flutter/material.dart';
import 'package:flutter_nebula/flutter_nebula.dart';
import 'package:flutter_nebula/src/theme/themings/animation_style.dart';
import 'package:flutter_nebula/src/theme/themings/icon_style.dart';
import 'package:flutter_nebula/src/theme/themings/support_style.dart';
import 'package:flutter_nebula/src/theme/themings/text_style.dart';

class NeThemes {
  static final defaultLightTheme = StyleData({
    'color-primary-100': '#f2f6ff',
    'color-primary-200': '#d9e4ff',
    'color-primary-300': '#a6c1ff',
    'color-primary-400': '#598bff',
    'color-primary-500': '#3366ff',
    'color-primary-600': '#274bdb',
    'color-primary-700': '#1a34b8',
    'color-primary-800': '#102694',
    'color-primary-900': '#091c7a',
    'color-success-100': '#f0fff5',
    'color-success-200': '#ccfce3',
    'color-success-300': '#8cfac7',
    'color-success-400': '#2ce69b',
    'color-success-500': '#00d68f',
    'color-success-600': '#00b887',
    'color-success-700': '#00997a',
    'color-success-800': '#007d6c',
    'color-success-900': '#004a42',
    'color-info-100': '#f2f8ff',
    'color-info-200': '#c7e2ff',
    'color-info-300': '#94cbff',
    'color-info-400': '#42aaff',
    'color-info-500': '#0095ff',
    'color-info-600': '#006fd6',
    'color-info-700': '#0057c2',
    'color-info-800': '#0041a8',
    'color-info-900': '#002885',
    'color-warning-100': '#fffdf2',
    'color-warning-200': '#fff1c2',
    'color-warning-300': '#ffe59e',
    'color-warning-400': '#ffc94d',
    'color-warning-500': '#ffaa00',
    'color-warning-600': '#db8b00',
    'color-warning-700': '#b86e00',
    'color-warning-800': '#945400',
    'color-warning-900': '#703c00',
    'color-danger-100': '#fff2f2',
    'color-danger-200': '#ffd6d9',
    'color-danger-300': '#ffa8b4',
    'color-danger-400': '#ff708d',
    'color-danger-500': '#ff3d71',
    'color-danger-600': '#db2c66',
    'color-danger-700': '#b81d5b',
    'color-danger-800': '#94124e',
    'color-danger-900': '#700940',
    'color-basic-100': '#ffffff',
    'color-basic-200': '#f7f9fc',
    'color-basic-300': '#edf1f7',
    'color-basic-400': '#e4e9f2',
    'color-basic-500': '#c5cee0',
    'color-basic-600': '#8f9bb3',
    'color-basic-700': '#2e3a59',
    'color-basic-800': '#222b45',
    'color-basic-900': '#1a2138',
    'color-basic-1000': '#151a30',
    'color-basic-1100': '#101426',
    'color-primary-focus': 'color-primary-700',
    'color-primary-hover': 'color-primary-400',
    'color-primary-default': 'color-primary-500',
    'color-primary-active': 'color-primary-600',
    'color-primary-disabled': 'color-primary-300',
    'color-success-focus': 'color-success-700',
    'color-success-hover': 'color-success-400',
    'color-success-default': 'color-success-500',
    'color-success-active': 'color-success-600',
    'color-success-disabled': 'color-success-200',
    'color-info-focus': 'color-info-700',
    'color-info-hover': 'color-info-400',
    'color-info-default': 'color-info-500',
    'color-info-active': 'color-info-600',
    'color-info-disabled': 'color-info-300',
    'color-warning-focus': 'color-warning-700',
    'color-warning-hover': 'color-warning-400',
    'color-warning-default': 'color-warning-500',
    'color-warning-active': 'color-warning-600',
    'color-warning-disabled': 'color-warning-300',
    'color-danger-focus': 'color-danger-700',
    'color-danger-hover': 'color-danger-400',
    'color-danger-default': 'color-danger-500',
    'color-danger-active': 'color-danger-600',
    'color-danger-disabled': 'color-danger-300',
    'color-basic-focus': 'color-basic-700',
    'color-basic-hover': 'color-basic-400',
    'color-basic-default': 'color-basic-500',
    'color-basic-active': 'color-basic-600',
    'color-basic-disabled': 'color-basic-300',
    'background-basic-color-1': 'color-basic-100',
    'background-basic-color-2': 'color-basic-200',
    'background-basic-color-3': 'color-basic-300',
    'background-basic-color-4': 'color-basic-400',
    'border-basic-color-1': 'color-basic-100',
    'border-basic-color-2': 'color-basic-200',
    'border-basic-color-3': 'color-basic-300',
    'border-basic-color-4': 'color-basic-400',
    'border-basic-color-5': 'color-basic-500',
    'background-alternative-color-1': 'color-basic-800',
    'background-alternative-color-2': 'color-basic-900',
    'background-alternative-color-3': 'color-basic-1000',
    'background-alternative-color-4': 'color-basic-1100',
    'border-alternative-color-1': 'color-basic-800',
    'border-alternative-color-2': 'color-basic-900',
    'border-alternative-color-3': 'color-basic-1000',
    'border-alternative-color-4': 'color-basic-1100',
    'border-alternative-color-5': 'color-basic-1100',
    'background-primary-color-1': 'color-primary-500',
    'background-primary-color-2': 'color-primary-600',
    'background-primary-color-3': 'color-primary-700',
    'background-primary-color-4': 'color-primary-800',
    'border-primary-color-1': 'color-basic-500',
    'border-primary-color-2': 'color-basic-600',
    'border-primary-color-3': 'color-basic-700',
    'border-primary-color-4': 'color-basic-800',
    'border-primary-color-5': 'color-basic-900',
  })
    ..inject(textStyle)
    ..inject(supportStyle)
    ..inject(animationStyle)
    ..inject(iconStyle)
    ..inject(radioStyle)
    ..inject(appBarStyle)
    ..inject(cardStyle)
    ..inject(buttonStyle)
    ..inject(iconButtonStyle)
    ..inject(checkboxStyle)
    ..inject(toggleStyle)
    ..inject(listItemStyle)
    ..inject(spinnerStyle)
    ..inject(toastStyle)
    ..inject(textFieldStyle)
    ..inject(progressBarStyle)
    ..inject(tabStyle)
    ..inject(selectStyle);

  static final defaultDarkTheme = defaultLightTheme.fork()
    ..inject(StyleData(
      {
        'background-basic-color-1': 'color-basic-800',
        'background-basic-color-2': 'color-basic-900',
        'background-basic-color-3': 'color-basic-1000',
        'background-basic-color-4': 'color-basic-1100',
        'border-basic-color-1': 'color-basic-800',
        'border-basic-color-2': 'color-basic-900',
        'border-basic-color-3': 'color-basic-1000',
        'border-basic-color-4': 'color-basic-1100',
        'border-basic-color-5': 'color-basic-1100',
        'background-alternative-color-1': 'color-basic-100',
        'background-alternative-color-2': 'color-basic-200',
        'background-alternative-color-3': 'color-basic-300',
        'background-alternative-color-4': 'color-basic-400',
        'border-alternative-color-1': 'color-basic-100',
        'border-alternative-color-2': 'color-basic-200',
        'border-alternative-color-3': 'color-basic-300',
        'border-alternative-color-4': 'color-basic-400',
        'border-alternative-color-5': 'color-basic-500',
        'text-basic-color': 'color-basic-100',
        'text-alternate-color': 'color-basic-900',
        'text-control-color': 'color-basic-100',
        'text-disabled-color': 'color-basic-700',
        'text-hint-color': 'color-basic-600',
        'outline-color': Colors.white.withOpacity(0.125),
        'shadow': BoxShadow(
            offset: Offset(0.0, 8.0),
            blurRadius: 16.0,
            color: Color.fromRGBO(12, 13, 16, 0.25)),
      },
    ));
}
