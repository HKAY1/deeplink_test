import 'package:flutter/material.dart';

// Notes:
// Colors that are common for both the theme mode will be added in the abstract class
// and the colors different for inidividual theme mode will be added to their color pallet
abstract class ColorPallet {
  Color get primaryColor;
  Color get accentColor;
  Color get scaffoldColor;
  static const Color black = Colors.black;
  static const Color white = Colors.white;
  static const Color offWhite =
      Color.from(alpha: 255, red: 253, green: 250, blue: 250);
  static const Color yellow = Color(0xffF2B200);
  static const Color grey = Colors.grey;
  static const Color grey300 = Color(0xFFDADDE3);
  static const Color grey200 = Color(0xFFF5F4F9);
  static const Color grey600 = Color(0xFF234f68);
  static const Color mediumGrey = Color(0xFF53587A);
  static const Color otpBoxUnfocusedColor = Color(0xFF35C2C1);
  static const Color otpBoxFocusedColor = Color(0xFF07A5E1);
  static const Color subtitleGrey = Color(0xFF838BA1);
  static const Color lightGrey = Color(0xFFF5F4F8);
  static const Color red = Colors.red;
  static const Color darkRed = Color(0xFFC43939);
  static const Color orange = Color(0xffEE6C4D);
  static const Color green = Color(0xFF498B42);
  static const Color darkGreen = Color(0xFF388E3D);
  static const Color transparent = Colors.transparent;
  static const Color lightBlueGrey =
      Color.from(alpha: 48, red: 35, green: 79, blue: 104);
  static const Color darkBlueGrey = Color(0XFF252B5C);
  static const Color mediumBlueGrey = Color(0XFF365E75);
  static const Color blueGrey = Color(0xFF204D6C);
  static const Color skyBlue = Color(0xFF00BBFF);
  static const Color darkSkyBlue = Color(0xFF0096cc);
  static const Color blue = Color(0xFF07A5E1);

  static const Color primaryBlue = Color(0xFF335076);
  static const Color primaryBackgroundColor = Color(0xFFF5F7FA);
  static const Color primaryBorderColor = Color(0xFFE4EBF5);

  static const Color rating = Color(0xFFFF9E00);

  static const Color lightPink = Color(0xFFD8A2BF);
  static const Color shimmerHighlight = Color(0xFFDADDE3);
  static const Color drawerIconColor = Color(0xFF71839B);
  static const Color drawerTextColor = Color(0xFF324054);
  static const Color textColor1 = Color(0xFF1D2430);
  static const Color textColor3 = Color(0xFF1D2430);
  static const Color textColor2 = Color(0xFFFAFAFA);
  static const Color headerColor = Color(0xffE4EBF5);

  static const LinearGradient drawerGradient = LinearGradient(
    colors: [
      Color(0xFF42A5F5), // Light sky blue
      Color(0xFF1877F2), // Facebook blue
      Color(0xFF335076), // Your blue
    ],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static final Paint dialogShaderPaint = Paint()
    ..shader = const LinearGradient(
      colors: <Color>[
        Color(0xff628EFF),
        Color(0xffBFD5FF),
        Color(0xffE9A0FE),
      ],
    ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  static final List<BoxShadow> bottomNavBarShadow = <BoxShadow>[
    BoxShadow(
      color: ColorPallet.black.withValues(alpha: 0.3),
      blurRadius: 10,
      offset: const Offset(0, 0),
      spreadRadius: 1.5,
    )
  ];

  static List<BoxShadow> buttonShadow({Color? color}) {
    return <BoxShadow>[
      BoxShadow(
        color: (color ?? Colors.grey).withValues(alpha: 0.5),
        spreadRadius: -5.0,
        blurRadius: 10.0,
        offset: const Offset(0, 5.0),
      )
    ];
  }

  static final List<BoxShadow> drawerShadow = <BoxShadow>[
    BoxShadow(
      color: ColorPallet.black.withValues(alpha: 0.2),
      blurRadius: 20,
      offset: const Offset(0, 0),
      spreadRadius: 2,
    )
  ];

  static final List<BoxShadow> drawerSelectedItemShadow = <BoxShadow>[
    BoxShadow(
      color: ColorPallet.black.withValues(alpha: 0.3),
      blurRadius: 10,
      offset: const Offset(0, 0),
      spreadRadius: 2,
    )
  ];

  static final List<BoxShadow> topDialogShadow = <BoxShadow>[
    BoxShadow(
      color: ColorPallet.black.withValues(alpha: 0.5),
      blurRadius: 20,
      offset: const Offset(0, 0),
      spreadRadius: 4,
    )
  ];
}

class DarkPallet extends ColorPallet {
  @override
  Color get primaryColor => Colors.black;

  @override
  Color get accentColor => Colors.blue.shade700;

  @override
  Color get scaffoldColor => ColorPallet.darkBlueGrey;
}

class LightPallet extends ColorPallet {
  @override
  Color get primaryColor => ColorPallet.primaryBlue;

  @override
  Color get accentColor => ColorPallet.primaryBlue;

  @override
  Color get scaffoldColor => ColorPallet.primaryBackgroundColor;
}
