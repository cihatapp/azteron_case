import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// App-specific text styles based on Figma design system.
///
/// All styles use Poppins font family with specific weights and sizes
/// as defined in the Figma design.
class AppTextStyles {
  AppTextStyles._();

  static String get _fontFamily => GoogleFonts.poppins().fontFamily!;

  // ─────────────────────────────────────────────────
  // Messages Page Styles
  // ─────────────────────────────────────────────────

  /// Page title style - Figma: Poppins Bold, 26px
  /// Used for: "Messages" title
  static TextStyle pageTitle(Color color) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 26,
        letterSpacing: 0,
        color: color,
      );

  /// Search placeholder style - Figma: Poppins Medium, 14px, line height 150%
  /// Used for: Search field hint text
  static TextStyle searchPlaceholder(Color color) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 14,
        height: 1.5,
        color: color,
      );

  /// Conversation name style - Figma: Poppins SemiBold, 15px, line height 150%
  /// Used for: User names in conversation list
  static TextStyle conversationName(Color color) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w600,
        fontSize: 15,
        height: 1.5,
        color: color,
      );

  /// Conversation message style - Figma: Poppins Regular, 12px, line height 150%
  /// Used for: Last message preview in conversation list
  static TextStyle conversationMessage(Color color) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.5,
        color: color,
      );

  /// Time text style - Figma: Poppins Regular, 12px, line height 150%
  /// Used for: Time stamps in conversation list
  static TextStyle timeText(Color color) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        height: 1.5,
        color: color,
      );

  /// Badge text style - Figma: Poppins Medium, 12px
  /// Used for: Unread count badge
  static TextStyle badgeText(Color color) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
        fontSize: 12,
        height: 1,
        color: color,
      );

  // ─────────────────────────────────────────────────
  // Chat Detail Page Styles
  // ─────────────────────────────────────────────────

  /// Chat title style - Figma: Poppins Bold, 18px
  /// Used for: User name in chat app bar
  static TextStyle chatTitle(Color color) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w700,
        fontSize: 18,
        color: color,
      );

  /// Online status style - Figma: Poppins Regular, 12px
  /// Used for: "Online" status text
  static TextStyle onlineStatus(Color color) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: color,
      );

  /// Date separator style - Figma: Poppins Regular, 12px
  /// Used for: "Today", "Yesterday" date separators
  static TextStyle dateSeparator(Color color) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: color,
      );

  /// Message text style - Figma: Poppins Regular, 15px, auto line height
  /// Used for: Message bubble content
  static TextStyle messageText(Color color) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 15,
        height: 1.4,
        color: color,
      );

  /// Message time style - Figma: Poppins Regular, 12px
  /// Used for: Time below message bubbles
  static TextStyle messageTime(Color color) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 12,
        color: color,
      );

  /// Input placeholder style - Figma: Poppins Regular, 14px
  /// Used for: "Enter your message" placeholder
  static TextStyle inputPlaceholder(Color color) => TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
        fontSize: 14,
        color: color,
      );
}
