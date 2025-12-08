import 'package:flutter_mvvm_riverpod/model/pomodoro.dart';

abstract class HomeRepository {
  Future<String> fetchUserName();

  Future<String> fetchRandomQuote();

  Future<Pomodoro> fetchPomodoro();
}
