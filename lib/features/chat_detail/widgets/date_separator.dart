import 'package:azteron_case/core/extensions/context_extension.dart';
import 'package:azteron_case/core/l10n/generated/app_localizations.dart';
import 'package:flutter/material.dart';

class DateSeparator extends StatelessWidget {
  const DateSeparator({
    required this.date,
    super.key,
  });

  final DateTime date;

  String _getFormattedDate(AppLocalizations l10n) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly == today) {
      return l10n.today;
    } else if (dateOnly == yesterday) {
      return l10n.yesterday;
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 32),
      child: Row(
        children: [
          // Left line
          Expanded(
            child: Container(
              height: 1,
              color: context.appColors.dividerColor,
            ),
          ),
          // Date text - using theme
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              _getFormattedDate(context.l10n),
              style: context.appStyles.dateSeparator,
            ),
          ),
          // Right line
          Expanded(
            child: Container(
              height: 1,
              color: context.appColors.dividerColor,
            ),
          ),
        ],
      ),
    );
  }
}
