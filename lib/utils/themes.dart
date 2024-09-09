import 'package:umai/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

abstract class ThemeApp {
  static const Color mainOrange = Color(0xFFFE9F05);
  static const Color mainOrangeLight = Color(0xFFFEC569);
  static const Color secondary = Color(0xFFEAF0CE);
  static const Color secondaryLight = Color(0xFFFBFCF5);
  static const Color errorRed = Color(0xFFFF0000);
  static const Color disabledGrey = Color(0xFFDDDEE1);
  static const Color disabledGreySurface = Color(0xFFF5F5F5);
  static const Color scaffoldBackground = Color(0xFFFBFCF5);

  static const Color lightText = Color(0xFFA5ACB8);
  static const Color disabledText = Color(0xFF75788B);
  static const Color boldText = Color(0xFF202C39);
  static const Color primaryYellow = Color(0xFFFFCC33);
  static const Color primaryBlack = Color(0xFF000000);
  static const Color primaryRed = Color(0xFF000000);
  static const Color mainText = primaryBlack;
  static const Color white = Color(0xFFFFFFFF);

  static TextTheme _textTheme(BuildContext context) {
    final TextTheme mainTextTheme = Theme.of(context).textTheme;
    final TextTheme titleTextTheme = Theme.of(context).textTheme.apply();

    return mainTextTheme.copyWith(
      titleLarge: titleTextTheme.titleLarge
          ?.copyWith(color: mainOrange, fontSize: 28.0),
      titleMedium:
          titleTextTheme.titleMedium?.copyWith(color: mainText, fontSize: 28.0),
      titleSmall:
          titleTextTheme.titleSmall?.copyWith(color: mainText, fontSize: 20.0),
      displayLarge: const TextStyle(
          color: primaryYellow, fontSize: 32.0, fontWeight: FontWeight.w600),
      displaySmall: titleTextTheme.displaySmall
          ?.copyWith(color: primaryYellow, fontSize: 20.0),
      bodyLarge: mainTextTheme.bodyLarge?.copyWith(
          color: mainText, fontSize: 16.0, fontWeight: FontWeight.w500),
      labelMedium: mainTextTheme.labelMedium?.copyWith(
          color: mainOrange, fontSize: 16.0, fontWeight: FontWeight.w700),
      labelSmall: const TextStyle(
          color: mainText, fontSize: 16.0, fontWeight: FontWeight.w300),
    );
  }

  static ThemeData _baseTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context).copyWith(useMaterial3: false);
    final TextTheme textTheme = _textTheme(context);

    return ThemeData(
      useMaterial3: false,
      colorScheme: theme.colorScheme.copyWith(
        primary: mainOrange,
        primaryContainer: mainOrangeLight,
        secondary: secondary,
        background: Colors.white,
        error: errorRed,
        surfaceVariant: disabledGreySurface,
      ),
      primaryColor: mainOrange,
      primaryColorLight: mainOrangeLight,
      disabledColor: disabledGrey,
      scaffoldBackgroundColor: scaffoldBackground,
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.white),
        systemOverlayStyle: const SystemUiOverlayStyle(
          systemNavigationBarColor: Colors.white,
        ),
      ),
      bottomNavigationBarTheme: theme.bottomNavigationBarTheme
          .copyWith(backgroundColor: Colors.white),
      bottomSheetTheme: theme.bottomSheetTheme.copyWith(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.0)),
        ),
      ),
      cardTheme: theme.cardTheme.copyWith(
        elevation: 1,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      checkboxTheme: theme.checkboxTheme.copyWith(
        fillColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return mainOrange;
          }
          return null;
        }),
      ),
      dialogTheme: DialogTheme(contentTextStyle: textTheme.bodyLarge),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: mainOrange,
          foregroundColor: mainText,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 0,
          foregroundColor: mainText,
          padding: const EdgeInsets.only(bottom: 16.0),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: mainText),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: theme.disabledColor),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        hintStyle: TextStyle(
          color: mainText.withOpacity(0.5),
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        labelStyle: TextStyle(
          color: mainText,
          fontSize: 12.0,
          fontWeight: FontWeight.w400,
        ),
      ),
      listTileTheme:
          theme.listTileTheme.copyWith(titleTextStyle: textTheme.titleSmall),
      popupMenuTheme:
          theme.popupMenuTheme.copyWith(textStyle: textTheme.labelSmall),
      switchTheme: theme.switchTheme.copyWith(
        thumbColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return mainOrange;
          }
          return null;
        }),
        trackColor: MaterialStateProperty.resolveWith((states) {
          if (states.contains(MaterialState.selected)) {
            return mainOrangeLight;
          }
          return null;
        }),
      ),
      textTheme: textTheme,
    );
  }

  static ThemeData lightTheme(BuildContext context) {
    return _baseTheme(context);
  }
}
