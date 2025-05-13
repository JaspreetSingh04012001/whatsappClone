import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// --- Light Theme Colors ---
const Color lightWhatsAppGreen = Color(
  0xFF075E54,
); // Main dark green for light theme
const Color lightLightWhatsAppGreen = Color(
  0xFF128C7E,
); // Lighter green for accents/buttons
const Color lightWhatsAppTeal = Color(
  0xFF25D366,
); // Bright green for FAB and highlights
const Color lightChatBackground = Color(
  0xFFECE5DD,
); // Background color for chat screens
const Color lightBackground = Color(0xFFF5F5F5); // For general backgrounds
const Color lightAppBarColor = lightWhatsAppGreen;
const Color lightOnPrimaryColor =
    Colors.white; // Text/icons on primary elements
const Color lightPrimaryTextColor = Colors.black;
const Color lightSecondaryTextColor = Colors.grey;
const Color lightSurfaceColor = Colors.white; // For cards, dialogs
const Color lightDividerColor = Color(0xFFDCDCDC);

// --- Dark Theme Colors ---
const Color darkPrimaryColor = Color(
  0xFF1F2C34,
); // Darker background for dark theme
const Color darkAppBarColor = Color(0xFF2A3942); // Appbar color for dark theme
const Color darkAccentGreen = Color(
  0xFF00AF9C,
); // Accent green for dark theme (FAB, highlights)
const Color darkChatBackground = Color(
  0xFF0E151A,
); // Very dark blue-grey for chat background
const Color darkBackground = Color(
  0xFF121B22,
); // Main background for dark theme
const Color darkOnPrimaryColor = Colors.white; // Text/icons on primary elements
const Color darkPrimaryTextColor = Colors.white;
const Color darkSecondaryTextColor = Color(
  0xFF8696A0,
); // Lighter grey for secondary text
const Color darkSurfaceColor = Color(0xFF1F2C34); // For cards, dialogs
const Color darkDividerColor = Color(0xFF2A3942); // Darker divider

// --- Common Colors ---
const Color whiteColor = Colors.white;
const Color blackColor = Colors.black;
const Color blueCheck = Color(0xFF34B7F1); // Blue check for read messages
const Color redError = Color(0xFFF44336); // Standard error color

// --- Light Theme Definition ---
ThemeData lightTheme(BuildContext context) {
  final textTheme = Theme.of(context).textTheme;
  return ThemeData(
    brightness: Brightness.light,
    primaryColor: lightWhatsAppGreen,
    primaryColorDark: const Color(0xFF054D44),
    primaryColorLight: lightLightWhatsAppGreen,
    // ignore: deprecated_member_use
    // accentColor: lightWhatsAppTeal, // Kept for older Flutter versions
    colorScheme: ColorScheme.light(
      primary: lightWhatsAppGreen,
      secondary: lightWhatsAppTeal,
      surface: lightSurfaceColor,
      error: redError,
      onPrimary: lightOnPrimaryColor,
      onSecondary: whiteColor,
      onSurface: lightPrimaryTextColor,
      onError: whiteColor,
    ),
    scaffoldBackgroundColor: lightBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: lightAppBarColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: lightOnPrimaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: lightOnPrimaryColor),
      actionsIconTheme: IconThemeData(color: lightOnPrimaryColor),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: lightOnPrimaryColor,
      unselectedLabelColor: lightOnPrimaryColor.withValues(alpha: 0.7),
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: lightOnPrimaryColor, width: 2.0),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: lightWhatsAppTeal,
      foregroundColor: whiteColor,
      elevation: 6.0,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
      displayLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: lightPrimaryTextColor,
      ),
      displayMedium: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: lightPrimaryTextColor,
      ),
      displaySmall: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: lightPrimaryTextColor,
      ),

      headlineLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: lightPrimaryTextColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: lightPrimaryTextColor,
      ), // Chat names
      headlineSmall: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: lightWhatsAppGreen,
      ), // Sub-headers

      titleLarge: TextStyle(
        fontSize: 14.0,
        color: lightSecondaryTextColor,
      ), // Last message preview
      titleMedium: TextStyle(
        fontSize: 12.0,
        color: lightSecondaryTextColor,
      ), // Smaller captions

      bodyLarge: TextStyle(fontSize: 16.0, color: lightPrimaryTextColor),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: lightPrimaryTextColor,
      ), // Message text
      bodySmall: TextStyle(
        fontSize: 12.0,
        color: lightSecondaryTextColor,
      ), // Timestamps

      labelLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: whiteColor,
      ),
      labelSmall: TextStyle(
        fontSize: 10.0,
        letterSpacing: 0.5,
        color: lightSecondaryTextColor,
      ), // Overline
    ),

    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: lightLightWhatsAppGreen,
        foregroundColor: whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: lightLightWhatsAppGreen,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: lightLightWhatsAppGreen,
        side: BorderSide(color: lightLightWhatsAppGreen, width: 1.5),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    cardTheme: CardTheme(
      color: lightSurfaceColor,
      elevation: 1.0,
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: lightSurfaceColor,
      hintStyle: TextStyle(
        color: lightSecondaryTextColor.withValues(alpha: 0.7),
      ),
      labelStyle: TextStyle(color: lightWhatsAppGreen),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: lightSecondaryTextColor.withValues(alpha: 0.5),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: lightSecondaryTextColor.withValues(alpha: 0.6),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: lightWhatsAppGreen, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: redError, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: redError, width: 2.0),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 16.0,
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: lightWhatsAppGreen,
      tileColor: lightSurfaceColor,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: lightSurfaceColor,
      titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: lightPrimaryTextColor,
      ),
      contentTextStyle: TextStyle(
        fontSize: 16.0,
        color: lightSecondaryTextColor,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
    dividerTheme: DividerThemeData(
      color: lightDividerColor,
      thickness: 0.8,
      space: 1,
    ),
    iconTheme: IconThemeData(color: lightWhatsAppGreen, size: 24.0),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    splashColor: lightLightWhatsAppGreen.withValues(alpha: 0.1),
    highlightColor: lightLightWhatsAppGreen.withValues(alpha: 0.05),
  );
}

// --- Dark Theme Definition ---
ThemeData darkTheme(context ) {
  final textTheme = Theme.of(context).textTheme;
  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: darkPrimaryColor, // Main background color
    // ignore: deprecated_member_use
    // accentColor: darkAccentGreen, // Kept for older Flutter versions
    colorScheme: ColorScheme.dark(
      primary:
          darkAccentGreen, // Used for interactive elements like icons, active states
      secondary: darkAccentGreen, // Overall background
      surface: darkSurfaceColor, // Cards, dialogs
      error: redError,
      onPrimary: darkOnPrimaryColor, // Text/icons on accentGreen elements
      onSecondary: whiteColor,
      onSurface: darkPrimaryTextColor, // Text on cards, dialogs
      onError: whiteColor,
    ),
    scaffoldBackgroundColor: darkBackground,
    appBarTheme: AppBarTheme(
      backgroundColor: darkAppBarColor,
      elevation: 0,
      titleTextStyle: TextStyle(
        color: darkOnPrimaryColor,
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
      ),
      iconTheme: IconThemeData(color: darkOnPrimaryColor),
      actionsIconTheme: IconThemeData(color: darkOnPrimaryColor),
    ),
    tabBarTheme: TabBarTheme(
      labelColor: darkAccentGreen, // Active tab label
      unselectedLabelColor: darkSecondaryTextColor, // Inactive tab label
      indicator: const UnderlineTabIndicator(
        borderSide: BorderSide(color: darkAccentGreen, width: 2.0),
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: darkAccentGreen,
      foregroundColor: whiteColor, // Icon color on FAB
      elevation: 6.0,
    ),
    textTheme: GoogleFonts.poppinsTextTheme(textTheme).copyWith(
      displayLarge: TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.bold,
        color: darkPrimaryTextColor,
      ),
      displayMedium: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        color: darkPrimaryTextColor,
      ),
      displaySmall: TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w600,
        color: darkPrimaryTextColor,
      ),
      headlineLarge: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: darkPrimaryTextColor,
      ),
      headlineMedium: TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w600,
        color: darkPrimaryTextColor,
      ), // Chat names
      headlineSmall: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: darkAccentGreen,
      ), // Sub-headers
      titleLarge: TextStyle(
        fontSize: 14.0,
        color: darkSecondaryTextColor,
      ), // Last message preview
      titleMedium: TextStyle(
        fontSize: 12.0,
        color: darkSecondaryTextColor,
      ), // Smaller captions
      bodyLarge: TextStyle(fontSize: 16.0, color: darkPrimaryTextColor),
      bodyMedium: TextStyle(
        fontSize: 14.0,
        color: darkPrimaryTextColor,
      ), // Message text
      bodySmall: TextStyle(
        fontSize: 12.0,
        color: darkSecondaryTextColor,
      ), // Timestamps
      labelLarge: TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w600,
        color: whiteColor,
      ), // Text on buttons
      labelSmall: TextStyle(
        fontSize: 10.0,
        letterSpacing: 0.5,
        color: darkSecondaryTextColor,
      ), // Overline
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: darkAccentGreen,
        foregroundColor: whiteColor,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: darkAccentGreen,
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: darkAccentGreen,
        side: BorderSide(color: darkAccentGreen, width: 1.5),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
      ),
    ),
    cardTheme: CardTheme(
      color: darkSurfaceColor,
      elevation: 1.0, // Dark theme might have less pronounced shadows or none
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor:
          darkSurfaceColor, // Or a slightly different shade like darkAppBarColor
      hintStyle: TextStyle(
        color: darkSecondaryTextColor.withValues(alpha: 0.7),
      ),
      labelStyle: TextStyle(color: darkAccentGreen),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: darkSecondaryTextColor.withValues(alpha: 0.5),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: BorderSide(
          color: darkSecondaryTextColor.withValues(alpha: 0.6),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: darkAccentGreen, width: 2.0),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: redError, width: 1.0),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: redError, width: 2.0),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 14.0,
        horizontal: 16.0,
      ),
    ),
    listTileTheme: ListTileThemeData(
      iconColor: darkAccentGreen,
      tileColor: darkSurfaceColor,
    ),
    dialogTheme: DialogTheme(
      backgroundColor: darkSurfaceColor,
      titleTextStyle: TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: darkPrimaryTextColor,
      ),
      contentTextStyle: TextStyle(
        fontSize: 16.0,
        color: darkSecondaryTextColor,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
    ),
    dividerTheme: DividerThemeData(
      color: darkDividerColor,
      thickness: 0.8,
      space: 1,
    ),
    iconTheme: IconThemeData(
      color: darkAccentGreen,
      size: 24.0,
    ), // Default icon color
    visualDensity: VisualDensity.adaptivePlatformDensity,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: CupertinoPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      },
    ),
    splashColor: darkAccentGreen.withValues(alpha: 0.1),
    highlightColor: darkAccentGreen.withValues(alpha: 0.05),
  );
}

// --- Chat specific colors (apply manually in chat bubble widgets) ---
// Light Theme Chat Bubbles
const Color lightOutgoingChatBubbleColor = Color(0xFFDCF8C6);
const Color lightIncomingChatBubbleColor = whiteColor;
const Color lightChatBubbleTextColor = Colors.black;
const Color lightChatTimestampColor = Colors.grey;

// Dark Theme Chat Bubbles
const Color darkOutgoingChatBubbleColor = Color(
  0xFF005C4B,
); // Darker green for sent messages
const Color darkIncomingChatBubbleColor = Color(
  0xFF2A3942,
); // Dark grey for received messages
const Color darkChatBubbleTextColor = Colors.white;
const Color darkChatTimestampColor = Color(
  0xFF8696A0,
); // Lighter grey for timestamps
