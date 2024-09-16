import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class ThemeApp {
  static const Color primaryYellow = Color(0xFFFFCC33);
  static const Color primaryBlack = Color(0xFF090909);
  static const Color primaryRed = Color(0xFFE30613);
  static const Color mainText = primaryBlack;
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color secondaryLight = Color(0xFF745B0B);
  static const Color tertiary = Color(0xFF904A42);
  static const Color errorRed = Color(0xFFFF0000);
  static const Color disabledGrey = Color(0xFFDDDEE1);
  static const Color disabledGreySurface = Color(0xFFF5F5F5);
  static const Color scaffoldBackground = Color(0xFFFBFCF5);
  static const Color lightText = Color(0xFFA5ACB8);
  static const Color disabledText = Color(0xFF75788B);
  static const Color boldText = Color(0xFF202C39);

  static TextTheme _textTheme(BuildContext context) {
    final baseTextTheme = Theme.of(context).textTheme;
    final robotoTextTheme = GoogleFonts.robotoTextTheme(baseTextTheme);
    final oswaldTextTheme = GoogleFonts.oswaldTextTheme(baseTextTheme);

    return robotoTextTheme.copyWith(
      displayLarge: robotoTextTheme.displayLarge?.copyWith(
        color: mainText,
        fontSize: 57.0,
        height: 6.4,
        letterSpacing: -0.25,
      ),
      displayMedium: robotoTextTheme.displayMedium?.copyWith(
        color: mainText,
        fontSize: 45.0,
        height: 5.2,
        letterSpacing: 0.0,
      ),
      displaySmall: oswaldTextTheme.displaySmall?.copyWith(
        color: mainText,
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        height: 4.4,
        letterSpacing: 0.0,
      ),
      headlineLarge: robotoTextTheme.headlineLarge?.copyWith(
        color: mainText,
        fontSize: 32.0,
        height: 4.0,
        letterSpacing: 0.0,
      ),
      headlineMedium: robotoTextTheme.headlineMedium?.copyWith(
        color: mainText,
        fontSize: 28.0,
        height: 3.6,
        letterSpacing: 0.0,
      ),
      headlineSmall: robotoTextTheme.headlineSmall?.copyWith(
        color: mainText,
        fontSize: 24.0,
        height: 3.2,
        letterSpacing: 0.0,
      ),
      titleLarge: oswaldTextTheme.titleLarge?.copyWith(
          color: mainText,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0,
          height: 2.8),
      titleMedium: robotoTextTheme.titleMedium?.copyWith(
        color: mainText,
        fontSize: 16.0,
        height: 2.4,
        letterSpacing: 0.15,
      ),
      titleSmall: robotoTextTheme.titleSmall?.copyWith(
        color: mainText,
        fontSize: 14.0,
        height: 2.0,
        letterSpacing: 0.1,
      ),
      bodyLarge: oswaldTextTheme.bodyLarge?.copyWith(
        color: mainText,
        fontSize: 16.0,
        fontWeight: FontWeight.bold,
        height: 2.4,
        letterSpacing: 0.5,
      ),
      bodyMedium: robotoTextTheme.bodyMedium?.copyWith(
        color: mainText,
        fontSize: 14.0,
        height: 2.0,
        letterSpacing: 0.25,
      ),
      bodySmall: robotoTextTheme.bodySmall?.copyWith(
        color: mainText,
        fontSize: 12.0,
        height: 1.6,
        letterSpacing: 0.4,
      ),
      labelLarge: oswaldTextTheme.labelLarge?.copyWith(
          color: mainText,
          fontSize: 14.0,
          fontWeight: FontWeight.bold,
          letterSpacing: 0.1,
          height: 2.0),
      labelMedium: robotoTextTheme.labelMedium?.copyWith(
        color: mainText,
        fontSize: 12.0,
        height: 1.6,
        letterSpacing: 0.5,
      ),
      labelSmall: robotoTextTheme.labelSmall?.copyWith(
        color: mainText,
        fontSize: 11.0,
        height: 1.6,
        letterSpacing: 0.5,
      ),
    );
  }

  static ThemeData _baseTheme(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = _textTheme(context);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryYellow,
        primary: primaryYellow,
        primaryContainer: primaryYellow,
        secondary: secondaryLight,
        tertiary: tertiary,
        error: errorRed,
        // ignore: deprecated_member_use
        surfaceVariant: disabledGreySurface,
      ),
      primaryColor: primaryYellow,
      disabledColor: disabledGrey,
      scaffoldBackgroundColor: Theme.of(context).colorScheme.surface,
      cardColor: Theme.of(context).colorScheme.surface,
      appBarTheme: theme.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        scrolledUnderElevation: 0,
        titleTextStyle:
            textTheme.titleLarge?.copyWith(color: theme.colorScheme.onSurface),
        toolbarTextStyle:
            textTheme.titleLarge?.copyWith(color: theme.colorScheme.onSurface),
        elevation: 0,
        iconTheme: const IconThemeData(color: mainText),
        systemOverlayStyle:
            const SystemUiOverlayStyle(systemNavigationBarColor: white),
      ),
      bottomNavigationBarTheme:
          theme.bottomNavigationBarTheme.copyWith(backgroundColor: white),
      bottomSheetTheme: theme.bottomSheetTheme.copyWith(
        clipBehavior: Clip.antiAlias,
        backgroundColor: white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(24.0))),
      ),
      cardTheme: theme.cardTheme.copyWith(
        color: Theme.of(context).colorScheme.surface,
        elevation: 1,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      ),
      checkboxTheme: theme.checkboxTheme.copyWith(
        fillColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? primaryYellow : null),
      ),
      dividerColor: theme.colorScheme.onSurfaceVariant,
      dialogTheme: DialogTheme(contentTextStyle: textTheme.bodyLarge),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryYellow,
          foregroundColor: mainText,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        ),
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
        unselectedLabelColor: disabledText,
        indicatorColor: primaryYellow,
        labelStyle: textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
        unselectedLabelStyle: textTheme.titleSmall,
        indicatorSize: TabBarIndicatorSize.tab,
        labelPadding: const EdgeInsets.symmetric(horizontal: 16.0),
      ),
      inputDecorationTheme: InputDecorationTheme(
        fillColor: mainText,
        focusColor: mainText,
        hoverColor: mainText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: const BorderSide(color: mainText),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
          borderSide: BorderSide(color: theme.disabledColor),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16.0),
        // hintStyle: textTheme.bodyLarge
        //     ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        labelStyle: textTheme.bodySmall
            ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        suffixIconColor: mainText,
        prefixIconColor: mainText,
        iconColor: mainText,
        floatingLabelStyle: textTheme.bodySmall?.copyWith(color: mainText),
      ),
      textSelectionTheme: const TextSelectionThemeData(
        cursorColor: mainText,
        // selectionColor: mainText.withOpacity(0.3),
        selectionHandleColor: Color.fromARGB(255, 32, 23, 23),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          backgroundColor: primaryYellow,
          side: const BorderSide(color: primaryYellow),
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          textStyle: textTheme.labelMedium,
        ),
      ),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          backgroundColor: primaryYellow,
          padding: const EdgeInsets.symmetric(horizontal: 56.0, vertical: 8.0),
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
        labelStyle: textTheme.labelLarge,
        // padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        shape: RoundedRectangleBorder(
            side: BorderSide.none, borderRadius: BorderRadius.circular(100.0)),
        side: BorderSide.none,
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
      popupMenuTheme:
          theme.popupMenuTheme.copyWith(textStyle: textTheme.labelSmall),
      switchTheme: theme.switchTheme.copyWith(
        thumbColor: WidgetStateProperty.resolveWith((states) =>
            states.contains(WidgetState.selected) ? primaryYellow : null),
      ),
      textTheme: textTheme,
    );
  }

  static ThemeData lightTheme(BuildContext context) => _baseTheme(context);
}
