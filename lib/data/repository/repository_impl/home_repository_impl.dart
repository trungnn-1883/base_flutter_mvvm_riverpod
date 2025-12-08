import 'package:flutter_mvvm_riverpod/data/local/app_share_pref.dart';
import 'package:flutter_mvvm_riverpod/data/local/app_share_provider.dart';
import 'package:flutter_mvvm_riverpod/data/local/quote_source.dart';
import 'package:flutter_mvvm_riverpod/data/local/quote_source_provider.dart';
import 'package:flutter_mvvm_riverpod/data/repository/home_repository.dart';
import 'package:flutter_mvvm_riverpod/model/pomodoro.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_repository_impl.g.dart';

@riverpod
HomeRepository homeRepository(Ref ref) {
  final appSharePref = ref.read(appSharePrefProvider);
  final quoteSource = ref.read(quoteSourceProvider);
  return HomeRepositoryImpl(
    appSharePref,
    quoteSource,
  );
}

class HomeRepositoryImpl extends HomeRepository {
  final AppSharePref appSharePref;
  final QuoteSource quoteSource;

  HomeRepositoryImpl(this.appSharePref, this.quoteSource);

  @override
  Future<String> fetchUserName() async {
    final name = await appSharePref.getUserName();
    // randome username here
    return 'User ${DateTime.now().millisecondsSinceEpoch % 1000}';

    return name ?? '';
  }

  @override
  Future<String> fetchRandomQuote() async {
    return quoteSource.getRandomQuoteForToday();
  }

  @override
  Future<Pomodoro> fetchPomodoro() async {
    final pomodoro = await appSharePref.getPomodoro() ??
        Pomodoro(
          focusDuration: 25,
          shortBreakDuration: 5,
          longBreakDuration: 15,
          numberOfCycles: 4,
          currentType: PomodoroType.focus,
        );
    return pomodoro;
  }
}
