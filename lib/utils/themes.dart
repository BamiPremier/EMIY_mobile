import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:umai/utils/assets.dart';

abstract class AppTheme {
  static const Color primaryYellow = Color(0xFFFFCC33);
  static const Color primaryBlack = Color(0xFF090909);
  static const Color primaryRed = Color(0xFFE30613);
  static const Color tertiaryContainer = Color(0xFFFFDAD5);
  static const Color white = Colors.white;
  static const Color black = Colors.black;
  static const Color lightGrey = Color(0xFFF5F5F5);
  static const Color disabledText = Color(0xFF9F9F9F);
  static const Color surfaceGrey = Color(0xFFD9D9D9);
  static const Color errorRed = Color(0xFFFF0717);
  static const Color green = Color(0xFF00F57A);
  static const Color onHighGreen = Color(0xFF002914);
  static const Color midOrange = Color(0xFFFF7A00);
  static const Color onMidOrange = Color(0xFF331400);
  static const Color lowRed = Color(0xFFFF0717);

  static const Color tertiary = Color(0xFF904A42);
  static const Color onTertiaryContainer = Color(0xFF3B0906);
  static const Color mainText = Colors.black;
  static const Color onPrimary = Color(0xFF090909);
  static TextTheme _textTheme(BuildContext context) {
    final arco =
        Theme.of(context).textTheme.apply(fontFamily: Assets.fontsFamilyARCO);
    final jakarta = Theme.of(context)
        .textTheme
        .apply(fontFamily: Assets.fontsPlusJakartaSans);
    return jakarta.copyWith(
      displayLarge: jakarta.displayLarge?.copyWith(
        color: mainText,
        fontSize: 57.0,
      ),
      displayMedium: jakarta.displayMedium?.copyWith(
        color: mainText,
        fontSize: 45.0,
      ),
      displaySmall: arco.displaySmall?.copyWith(
        color: mainText,
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
      ),
      headlineLarge: jakarta.headlineLarge?.copyWith(
        color: mainText,
        fontSize: 32.0,
      ),
      headlineMedium: jakarta.headlineMedium?.copyWith(
        color: mainText,
        fontSize: 28.0,
      ),
      headlineSmall: jakarta.headlineSmall?.copyWith(
        color: mainText,
        fontSize: 24.0,
      ),
      titleLarge: arco.titleLarge?.copyWith(
        color: mainText,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: jakarta.titleMedium?.copyWith(
        color: mainText,
        fontSize: 16.0,
      ),
      titleSmall: jakarta.titleSmall?.copyWith(
        color: mainText,
        fontSize: 14.0,
      ),
      bodyLarge: jakarta.bodyLarge?.copyWith(
          color: mainText, fontSize: 16.0, fontWeight: FontWeight.bold),
      bodyMedium: jakarta.bodyMedium?.copyWith(
        color: mainText,
        fontSize: 14.0,
      ),
      bodySmall: jakarta.bodySmall?.copyWith(
        color: mainText,
        fontSize: 12.0,
      ),
      labelLarge: arco.labelLarge?.copyWith(
        color: mainText,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
      ),
      labelMedium: jakarta.labelMedium?.copyWith(
        color: mainText,
        fontSize: 12.0,
      ),
      labelSmall: jakarta.labelSmall?.copyWith(
        color: mainText,
        fontSize: 11.0,
      ),
    );
  }

  static ColorScheme _colorScheme([Brightness brightness = Brightness.light]) {
    return ColorScheme.fromSeed(
      seedColor: primaryYellow,
      primary: primaryYellow,
      secondary: primaryYellow,
      tertiary: primaryRed,
      onTertiaryContainer: onTertiaryContainer,
      tertiaryContainer: tertiaryContainer,
      error: errorRed,
      errorContainer: errorRed,
      brightness: brightness,
      onPrimary: onPrimary,
    );
  }

  static ThemeData _baseTheme(BuildContext context) {
    final colorScheme = _colorScheme();
    final textTheme = _textTheme(context);
    final theme = Theme.of(context).copyWith(textTheme: textTheme);

    return ThemeData(
      useMaterial3: true,
      colorScheme: colorScheme.copyWith(surface: white),
      primaryColor: primaryYellow,
      appBarTheme: theme.appBarTheme.copyWith(
        elevation: 0,
        scrolledUnderElevation: 0,
        surfaceTintColor: Colors.transparent,
        systemOverlayStyle: const SystemUiOverlayStyle(
            systemNavigationBarColor: white,
            systemNavigationBarDividerColor: white,
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.dark),
      ),
      bottomNavigationBarTheme: theme.bottomNavigationBarTheme.copyWith(
        backgroundColor: colorScheme.surface,
        selectedItemColor: black,
        unselectedItemColor: colorScheme.onSurfaceVariant,
        type: BottomNavigationBarType.shifting,
        showUnselectedLabels: false,
        selectedLabelStyle:
            const TextStyle(color: black, fontSize: 12.0, letterSpacing: 0.4),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: primaryYellow,
      ),
      bottomSheetTheme: theme.bottomSheetTheme.copyWith(
        clipBehavior: Clip.antiAlias,
        backgroundColor: white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.0))),
      ),
      cardTheme: theme.cardTheme.copyWith(
        color: Theme.of(context).colorScheme.surface,
        margin: const EdgeInsets.all(0.0),
        elevation: 1,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      checkboxTheme: theme.checkboxTheme.copyWith(
        fillColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? primaryYellow : null),
      ),
      dividerColor: theme.colorScheme.onSurfaceVariant,
      dividerTheme: theme.dividerTheme.copyWith(thickness: 0.2),
      dialogTheme: DialogTheme(contentTextStyle: textTheme.bodyLarge),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryYellow,
          foregroundColor: mainText,
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(100.0)),
          elevation: 0,
          side: BorderSide.none,
          textStyle: textTheme.labelMedium,
          maximumSize: const Size.fromHeight(40.0),
        ),
      ),
      radioTheme: RadioThemeData(
        fillColor:
            WidgetStateProperty.resolveWith<Color?>((Set<WidgetState> states) {
          if (states.contains(WidgetState.selected)) {
            return colorScheme.surfaceTint;
          }
          return Theme.of(context).colorScheme.onSurface;
        }),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          elevation: 0,
          foregroundColor: mainText,
          padding: const EdgeInsets.only(bottom: 16.0),
        ),
      ),
      tabBarTheme: TabBarTheme(
        labelColor: mainText,
        indicatorColor: primaryYellow,
        labelStyle: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        unselectedLabelStyle: textTheme.titleSmall,
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
      inputDecorationTheme: InputDecorationTheme(
          fillColor: colorScheme.surfaceContainerHighest,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide.none,
          )),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
            foregroundColor: colorScheme.onSurfaceVariant,
            side: const BorderSide(width: 2.0)),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryYellow,
          foregroundColor: mainText,
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          shape: RoundedRectangleBorder(
              side: BorderSide.none,
              borderRadius: BorderRadius.circular(100.0)),
          elevation: 0,
          side: BorderSide.none,
          textStyle: textTheme.labelMedium,
          minimumSize: const Size.fromHeight(40.0),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: Colors.white,
        selectedColor: primaryYellow,
        labelStyle: Theme.of(context).textTheme.labelLarge,
        shape: RoundedRectangleBorder(
            side: const BorderSide(color: black),
            borderRadius: BorderRadius.circular(100.0)),
        side: const BorderSide(color: black),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: primaryYellow,
        foregroundColor: mainText,
        elevation: 4,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: primaryBlack,
        contentTextStyle: textTheme.bodyMedium?.copyWith(color: white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        behavior: SnackBarBehavior.floating,
      ),
      listTileTheme:
          theme.listTileTheme.copyWith(titleTextStyle: textTheme.titleSmall),
      popupMenuTheme: theme.popupMenuTheme.copyWith(
          labelTextStyle: WidgetStatePropertyAll(textTheme.titleMedium),
          textStyle: textTheme.titleMedium),
      switchTheme: theme.switchTheme.copyWith(
        trackColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? theme.colorScheme.outline
                : theme.colorScheme.surfaceContainer),
        thumbColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected)
                ? white
                : theme.colorScheme.outline),
      ),
      textTheme: textTheme,
    );
  }

  static ThemeData lightTheme(BuildContext context) => _baseTheme(context);

  static ThemeData primaryColorTheme(BuildContext context) {
    final baseTheme = lightTheme(context);

    return baseTheme.copyWith(
        scaffoldBackgroundColor: primaryYellow,
        appBarTheme: baseTheme.appBarTheme.copyWith(
            backgroundColor: primaryYellow,
            systemOverlayStyle: const SystemUiOverlayStyle(
              systemNavigationBarColor: primaryYellow,
              systemNavigationBarDividerColor: primaryYellow,
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: Brightness.dark,
            )));
  }

  static ThemeData fullBlackTheme(BuildContext context) {
    final baseTheme = _baseTheme(context);
    final colorScheme = _colorScheme(Brightness.dark);

    return baseTheme.copyWith(
        brightness: Brightness.dark,
        appBarTheme: baseTheme.appBarTheme.copyWith(
            backgroundColor: black,
            foregroundColor: colorScheme.onSurface,
            iconTheme: baseTheme.appBarTheme.iconTheme
                ?.copyWith(color: colorScheme.onSurface),
            titleTextStyle: baseTheme.appBarTheme.titleTextStyle
                ?.copyWith(color: colorScheme.onSurface),
            systemOverlayStyle: const SystemUiOverlayStyle(
                systemNavigationBarColor: black,
                systemNavigationBarDividerColor: black,
                statusBarColor: Colors.transparent,
                statusBarIconBrightness: Brightness.light)),
        scaffoldBackgroundColor: black);
  }
}
