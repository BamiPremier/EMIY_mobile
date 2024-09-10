import 'package:umai/utils/assets.dart';
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
  static const Color secondary = Color(0xFFEAF0CE);
  static const Color secondaryLight = Color(0xFFFBFCF5);
  static const Color errorRed = Color(0xFFFF0000);
  static const Color disabledGrey = Color(0xFFDDDEE1);
  static const Color disabledGreySurface = Color(0xFFF5F5F5);
  static const Color scaffoldBackground = Color(0xFFFBFCF5);

  static const Color lightText = Color(0xFFA5ACB8);
  static const Color disabledText = Color(0xFF75788B);
  static const Color boldText = Color(0xFF202C39);

  static TextTheme _textTheme(BuildContext context) {
    final TextTheme robotoTextTheme =
        GoogleFonts.robotoTextTheme(Theme.of(context).textTheme);
    final TextTheme oswaldTextTheme =
        GoogleFonts.oswaldTextTheme(Theme.of(context).textTheme);

    return robotoTextTheme.copyWith(
      // Display (Les titres d'affichage, typiquement les plus gros textes)
      displayLarge: robotoTextTheme.displayLarge?.copyWith(
        color: mainText,
        fontSize: 57.0,
        height: 6.4,
      ),
      displayMedium: robotoTextTheme.displayMedium?.copyWith(
        color: mainText,
        fontSize: 45.0,
        height: 5.2,
      ),
      displaySmall: oswaldTextTheme.displaySmall?.copyWith(
        color: mainText,
        fontSize: 36.0,
        fontWeight: FontWeight.bold,
        height: 4.4,
      ),

      // Titles (Les titres pour différentes sections ou écrans)
      headlineLarge: robotoTextTheme.headlineLarge?.copyWith(
        color: mainText,
        fontSize: 32.0,
        height: 4.0,
      ),
      headlineMedium: robotoTextTheme.headlineMedium?.copyWith(
        color: mainText,
        fontSize: 28.0,
        height: 3.6,
      ),
      headlineSmall: robotoTextTheme.headlineSmall?.copyWith(
        color: mainText,
        fontSize: 24.0,
        height: 3.2,
      ),

      // Titles (Le titre utilisé principalement pour les éléments plus petits comme les cartes ou widgets)
      titleLarge: oswaldTextTheme.titleLarge?.copyWith(
        color: mainText,
        fontSize: 20.0,
        fontWeight: FontWeight.bold,
        height: 2.8,
      ),
      titleMedium: robotoTextTheme.titleMedium?.copyWith(
        color: mainText,
        fontSize: 16.0,
        height: 2.4,
      ),
      titleSmall: robotoTextTheme.titleSmall?.copyWith(
        color: mainText,
        fontSize: 14.0,
        height: 2.0,
      ),

      // Body Text (Le texte régulier pour le contenu principal)
      bodyLarge: oswaldTextTheme.bodyLarge?.copyWith(
          color: mainText,
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          height: 2.4),
      bodyMedium: robotoTextTheme.bodyMedium?.copyWith(
        color: mainText,
        fontSize: 14.0,
        height: 2.0,
      ),
      bodySmall: robotoTextTheme.bodySmall?.copyWith(
        color: mainText,
        fontSize: 12.0,
        height: 1.6,
      ),

      // Labels (Pour les labels et badges)
      labelLarge: oswaldTextTheme.labelLarge?.copyWith(
        color: mainText,
        fontSize: 14.0,
        fontWeight: FontWeight.bold,
        height: 2.0,
      ),
      labelMedium: robotoTextTheme.labelMedium?.copyWith(
        color: mainText,
        fontSize: 12.0,
        height: 1.6,
      ),
      labelSmall: robotoTextTheme.labelSmall?.copyWith(
        color: mainText,
        fontSize: 11.0,
        height: 1.6,
      ),
    );
  }

  static ThemeData _baseTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context).copyWith(useMaterial3: false);
    final TextTheme textTheme = _textTheme(context);

    return ThemeData(
      useMaterial3: true,
      colorScheme: ColorScheme.fromSeed(
        seedColor: primaryYellow,
        primary: primaryYellow,
        primaryContainer: primaryYellow,
        secondary: secondary,
        background: Colors.white,
        error: errorRed,
        surfaceVariant: disabledGreySurface,
      ),
      primaryColor: primaryYellow,
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
            return primaryYellow;
          }
          return null;
        }),
      ),
      dividerColor: Theme.of(context).colorScheme.onSurfaceVariant,
      dialogTheme: DialogTheme(contentTextStyle: textTheme.bodyLarge),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryYellow,
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
        hintStyle: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
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
            return primaryYellow;
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
