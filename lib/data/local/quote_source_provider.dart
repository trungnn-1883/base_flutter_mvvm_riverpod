

import 'package:flutter_mvvm_riverpod/data/local/quote_source.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quote_source_provider.g.dart';

@riverpod
QuoteSource quoteSource(Ref ref) {
  return QuoteSource.instance;
}
