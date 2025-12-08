import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_mvvm_riverpod/generated/locale_keys.g.dart';

class QuoteSource {
  // Singleton instance
  static final QuoteSource _instance = QuoteSource._internal();

  // Expose the singleton instance
  static QuoteSource get instance => _instance;

  // Private named constructor
  QuoteSource._internal();

  final Map<int, List<List<String>>> _quotesByDay = {
    1: [
      [
        LocaleKeys.quote_monday1_morning.tr(),
        LocaleKeys.quote_monday1_afternoon.tr()
      ],
      [
        LocaleKeys.quote_monday2_morning.tr(),
        LocaleKeys.quote_monday2_afternoon.tr()
      ],
      [
        LocaleKeys.quote_monday3_morning.tr(),
        LocaleKeys.quote_monday3_afternoon.tr()
      ],
      [
        LocaleKeys.quote_monday4_morning.tr(),
        LocaleKeys.quote_monday4_afternoon.tr()
      ],
      [
        LocaleKeys.quote_monday5_morning.tr(),
        LocaleKeys.quote_monday5_afternoon.tr()
      ],
      [
        LocaleKeys.quote_monday6_morning.tr(),
        LocaleKeys.quote_monday6_afternoon.tr()
      ],
      [
        LocaleKeys.quote_monday7_morning.tr(),
        LocaleKeys.quote_monday7_afternoon.tr()
      ],
      [
        LocaleKeys.quote_monday8_morning.tr(),
        LocaleKeys.quote_monday8_afternoon.tr()
      ],
      [
        LocaleKeys.quote_monday9_morning.tr(),
        LocaleKeys.quote_monday9_afternoon.tr()
      ],
      [
        LocaleKeys.quote_monday10_morning.tr(),
        LocaleKeys.quote_monday10_afternoon.tr()
      ],
    ],
    2: [
      [
        LocaleKeys.quote_tuesday1_morning.tr(),
        LocaleKeys.quote_tuesday1_afternoon.tr()
      ],
      [
        LocaleKeys.quote_tuesday2_morning.tr(),
        LocaleKeys.quote_tuesday2_afternoon.tr()
      ],
      [
        LocaleKeys.quote_tuesday3_morning.tr(),
        LocaleKeys.quote_tuesday3_afternoon.tr()
      ],
      [
        LocaleKeys.quote_tuesday4_morning.tr(),
        LocaleKeys.quote_tuesday4_afternoon.tr()
      ],
      [
        LocaleKeys.quote_tuesday5_morning.tr(),
        LocaleKeys.quote_tuesday5_afternoon.tr()
      ],
      [
        LocaleKeys.quote_tuesday6_morning.tr(),
        LocaleKeys.quote_tuesday6_afternoon.tr()
      ],
      [
        LocaleKeys.quote_tuesday7_morning.tr(),
        LocaleKeys.quote_tuesday7_afternoon.tr()
      ],
      [
        LocaleKeys.quote_tuesday8_morning.tr(),
        LocaleKeys.quote_tuesday8_afternoon.tr()
      ],
      [
        LocaleKeys.quote_tuesday9_morning.tr(),
        LocaleKeys.quote_tuesday9_afternoon.tr()
      ],
      [
        LocaleKeys.quote_tuesday10_morning.tr(),
        LocaleKeys.quote_tuesday10_afternoon.tr()
      ],
    ],
    3: [
      [
        LocaleKeys.quote_wednesday1_morning.tr(),
        LocaleKeys.quote_wednesday1_afternoon.tr()
      ],
      [
        LocaleKeys.quote_wednesday2_morning.tr(),
        LocaleKeys.quote_wednesday2_afternoon.tr()
      ],
      [
        LocaleKeys.quote_wednesday3_morning.tr(),
        LocaleKeys.quote_wednesday3_afternoon.tr()
      ],
      [
        LocaleKeys.quote_wednesday4_morning.tr(),
        LocaleKeys.quote_wednesday4_afternoon.tr()
      ],
      [
        LocaleKeys.quote_wednesday5_morning.tr(),
        LocaleKeys.quote_wednesday5_afternoon.tr()
      ],
      [
        LocaleKeys.quote_wednesday6_morning.tr(),
        LocaleKeys.quote_wednesday6_afternoon.tr()
      ],
      [
        LocaleKeys.quote_wednesday7_morning.tr(),
        LocaleKeys.quote_wednesday7_afternoon.tr()
      ],
      [
        LocaleKeys.quote_wednesday8_morning.tr(),
        LocaleKeys.quote_wednesday8_afternoon.tr()
      ],
      [
        LocaleKeys.quote_wednesday9_morning.tr(),
        LocaleKeys.quote_wednesday9_afternoon.tr()
      ],
      [
        LocaleKeys.quote_wednesday10_morning.tr(),
        LocaleKeys.quote_wednesday10_afternoon.tr()
      ],
    ],
    4: [
      [
        LocaleKeys.quote_thursday1_morning.tr(),
        LocaleKeys.quote_thursday1_afternoon.tr()
      ],
      [
        LocaleKeys.quote_thursday2_morning.tr(),
        LocaleKeys.quote_thursday2_afternoon.tr()
      ],
      [
        LocaleKeys.quote_thursday3_morning.tr(),
        LocaleKeys.quote_thursday3_afternoon.tr()
      ],
      [
        LocaleKeys.quote_thursday4_morning.tr(),
        LocaleKeys.quote_thursday4_afternoon.tr()
      ],
      [
        LocaleKeys.quote_thursday5_morning.tr(),
        LocaleKeys.quote_thursday5_afternoon.tr()
      ],
      [
        LocaleKeys.quote_thursday6_morning.tr(),
        LocaleKeys.quote_thursday6_afternoon.tr()
      ],
      [
        LocaleKeys.quote_thursday7_morning.tr(),
        LocaleKeys.quote_thursday7_afternoon.tr()
      ],
      [
        LocaleKeys.quote_thursday8_morning.tr(),
        LocaleKeys.quote_thursday8_afternoon.tr()
      ],
      [
        LocaleKeys.quote_thursday9_morning.tr(),
        LocaleKeys.quote_thursday9_afternoon.tr()
      ],
      [
        LocaleKeys.quote_thursday10_morning.tr(),
        LocaleKeys.quote_thursday10_afternoon.tr()
      ],
    ],
    5: [
      [
        LocaleKeys.quote_friday1_morning.tr(),
        LocaleKeys.quote_friday1_afternoon.tr()
      ],
      [
        LocaleKeys.quote_friday2_morning.tr(),
        LocaleKeys.quote_friday2_afternoon.tr()
      ],
      [
        LocaleKeys.quote_friday3_morning.tr(),
        LocaleKeys.quote_friday3_afternoon.tr()
      ],
      [
        LocaleKeys.quote_friday4_morning.tr(),
        LocaleKeys.quote_friday4_afternoon.tr()
      ],
      [
        LocaleKeys.quote_friday5_morning.tr(),
        LocaleKeys.quote_friday5_afternoon.tr()
      ],
      [
        LocaleKeys.quote_friday6_morning.tr(),
        LocaleKeys.quote_friday6_afternoon.tr()
      ],
      [
        LocaleKeys.quote_friday7_morning.tr(),
        LocaleKeys.quote_friday7_afternoon.tr()
      ],
      [
        LocaleKeys.quote_friday8_morning.tr(),
        LocaleKeys.quote_friday8_afternoon.tr()
      ],
      [
        LocaleKeys.quote_friday9_morning.tr(),
        LocaleKeys.quote_friday9_afternoon.tr()
      ],
      [
        LocaleKeys.quote_friday10_morning.tr(),
        LocaleKeys.quote_friday10_afternoon.tr()
      ],
    ],
    6: [
      [
        LocaleKeys.quote_saturday1_morning.tr(),
        LocaleKeys.quote_saturday1_afternoon.tr()
      ],
      [
        LocaleKeys.quote_saturday2_morning.tr(),
        LocaleKeys.quote_saturday2_afternoon.tr()
      ],
      [
        LocaleKeys.quote_saturday3_morning.tr(),
        LocaleKeys.quote_saturday3_afternoon.tr()
      ],
      [
        LocaleKeys.quote_saturday4_morning.tr(),
        LocaleKeys.quote_saturday4_afternoon.tr()
      ],
      [
        LocaleKeys.quote_saturday5_morning.tr(),
        LocaleKeys.quote_saturday5_afternoon.tr()
      ],
      [
        LocaleKeys.quote_saturday6_morning.tr(),
        LocaleKeys.quote_saturday6_afternoon.tr()
      ],
      [
        LocaleKeys.quote_saturday7_morning.tr(),
        LocaleKeys.quote_saturday7_afternoon.tr()
      ],
      [
        LocaleKeys.quote_saturday8_morning.tr(),
        LocaleKeys.quote_saturday8_afternoon.tr()
      ],
      [
        LocaleKeys.quote_saturday9_morning.tr(),
        LocaleKeys.quote_saturday9_afternoon.tr()
      ],
      [
        LocaleKeys.quote_saturday10_morning.tr(),
        LocaleKeys.quote_saturday10_afternoon.tr()
      ],
    ],
    7: [
      [
        LocaleKeys.quote_sunday1_morning.tr(),
        LocaleKeys.quote_sunday1_afternoon.tr()
      ],
      [
        LocaleKeys.quote_sunday2_morning.tr(),
        LocaleKeys.quote_sunday2_afternoon.tr()
      ],
      [
        LocaleKeys.quote_sunday3_morning.tr(),
        LocaleKeys.quote_sunday3_afternoon.tr()
      ],
      [
        LocaleKeys.quote_sunday4_morning.tr(),
        LocaleKeys.quote_sunday4_afternoon.tr()
      ],
      [
        LocaleKeys.quote_sunday5_morning.tr(),
        LocaleKeys.quote_sunday5_afternoon.tr()
      ],
      [
        LocaleKeys.quote_sunday6_morning.tr(),
        LocaleKeys.quote_sunday6_afternoon.tr()
      ],
      [
        LocaleKeys.quote_sunday7_morning.tr(),
        LocaleKeys.quote_sunday7_afternoon.tr()
      ],
      [
        LocaleKeys.quote_sunday8_morning.tr(),
        LocaleKeys.quote_sunday8_afternoon.tr()
      ],
      [
        LocaleKeys.quote_sunday9_morning.tr(),
        LocaleKeys.quote_sunday9_afternoon.tr()
      ],
      [
        LocaleKeys.quote_sunday10_morning.tr(),
        LocaleKeys.quote_sunday10_afternoon.tr()
      ],
    ],
  };

  String getRandomQuoteForToday() {
    final now = DateTime.now();
    final dayOfWeek = now.weekday; // 1 = Monday, 7 = Sunday
    final quotes = _quotesByDay[dayOfWeek] ?? [];
    if (quotes.isEmpty) return LocaleKeys.quote_monday1_morning.tr();
    final randomIndex = Random().nextInt(quotes.length);
    final quoteList = quotes[randomIndex];
    final period = now.hour < 12 ? 0 : 1; // 0 for morning, 1 for afternoon
    return quoteList[period];
  }
}
