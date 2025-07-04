import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../utilities/export.dart';

class ThemeService extends StateNotifier<ThemeMode> {
  ThemeService._() : super(ThemeMode.light);
  static final ThemeService instance = ThemeService._();

  static final DarkPallet _darkPallet = DarkPallet();
  static final ThemeData dark = ThemeData(
    brightness: Brightness.dark,
    primaryColor: _darkPallet.primaryColor,
    scaffoldBackgroundColor: _darkPallet.scaffoldColor,
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: ColorPallet.grey.withValues(alpha: 0.4),
      cursorColor: ColorPallet.white,
      selectionHandleColor: ColorPallet.white,
    ),
    colorScheme: ColorScheme.dark(
      primary: _darkPallet.primaryColor,
      secondary: _darkPallet.accentColor,
    ),
    textTheme: _textTheme,
  );

  static final LightPallet _lightPallet = LightPallet();
  static final ThemeData light = ThemeData(
    brightness: Brightness.light,
    primaryColor: _lightPallet.primaryColor,
    scaffoldBackgroundColor: _lightPallet.scaffoldColor,
    appBarTheme: const AppBarTheme(surfaceTintColor: ColorPallet.transparent),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: ColorPallet.black.withValues(alpha: 0.4),
      cursorColor: ColorPallet.white,
      selectionHandleColor: ColorPallet.white,
    ),
    colorScheme: ColorScheme.light(
      primary: _lightPallet.primaryColor,
      secondary: _lightPallet.accentColor,
    ),
    textTheme: _textTheme,
  );

  static const TextTheme _textTheme = TextTheme(
    displayLarge: headline1,
    displayMedium: headline2,
    displaySmall: headline3,
    headlineMedium: headline4,
    headlineSmall: headline5,
    titleLarge: headline6,
    bodyLarge: bodyText1,
    bodyMedium: bodyText2,
  );

  void changeThemeMode() {
    if (isDark) {
      state = ThemeMode.light;
    } else {
      state = ThemeMode.dark;
    }
  }

  bool get isDark => state == ThemeMode.dark;

  static const TextStyle headline1 = TextStyle(
    fontSize: 33,
    color: ColorPallet.textColor1,
    fontFamily: 'NunitoSans',
  );
  static const TextStyle headline2 = TextStyle(
    fontSize: 30,
    color: ColorPallet.textColor1,
    fontFamily: 'NunitoSans',
  );
  static const TextStyle headline3 = TextStyle(
    fontSize: 27,
    color: ColorPallet.textColor1,
    fontFamily: 'NunitoSans',
  );
  static const TextStyle headline4 = TextStyle(
    fontSize: 24,
    color: ColorPallet.textColor1,
    fontFamily: 'NunitoSans',
  );
  static const TextStyle headline5 = TextStyle(
    fontSize: 21,
    color: ColorPallet.textColor1,
    fontFamily: 'NunitoSans',
  );
  static const TextStyle headline6 = TextStyle(
    fontSize: 18,
    color: ColorPallet.textColor1,
    fontFamily: 'NunitoSans',
  );

  static const TextStyle bodyText1 = TextStyle(
    fontSize: 16,
    color: ColorPallet.textColor1,
    fontWeight: FontWeight.w600,
    fontFamily: 'NunitoSans',
  );

  static const TextStyle buttonText = TextStyle(
    fontSize: 18,
    color: ColorPallet.white,
    fontWeight: FontWeight.w700,
    fontFamily: 'NunitoSans',
  );

  static const TextStyle bodyText2 = TextStyle(
    fontSize: 14,
    color: ColorPallet.textColor1,
    fontWeight: FontWeight.w600,
    fontFamily: 'NunitoSans',
  );

  static const TextStyle formFieldHeader = TextStyle(
    fontSize: 18,
    color: ColorPallet.textColor1,
    fontWeight: FontWeight.w600,
    fontFamily: 'NunitoSans',
  );

  static const TextStyle hintText = TextStyle(
    fontSize: 16,
    color: ColorPallet.textColor1,
    fontWeight: FontWeight.w500,
    fontFamily: 'NunitoSans',
  );

  static final TextStyle boldBlue = headline3.copyWith(
    color: ColorPallet.blueGrey,
    fontWeight: FontWeight.w800,
    fontFamily: 'NunitoSans',
  );

  static final TextStyle titleStyle = headline3.copyWith(
    color: ColorPallet.textColor1,
    fontWeight: FontWeight.w500,
    wordSpacing: 3,
    height: 1.5,
    fontFamily: 'NunitoSans',
  );

  static final TextStyle subTitleStyle = bodyText1.copyWith(
    fontWeight: FontWeight.w500,
    fontSize: 18,
    fontFamily: "NunitoSans",
    color: ColorPallet.subtitleGrey,
  );
}

final themeService =
    StateNotifierProvider<ThemeService, ThemeMode>((ref) => ThemeService._());
