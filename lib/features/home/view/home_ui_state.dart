import 'package:flutter_mvvm_riverpod/features/home/view_model/home_view_model.dart';
import 'package:flutter_mvvm_riverpod/model/Pomodoro.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'home_ui_state.freezed.dart';

@freezed
abstract class HomeUiState with _$HomeUiState {
  const factory HomeUiState({
    required String userName,
    required String quote,
    required Pomodoro pomodoro,
    required TimerStatus timerStatus,
  }) = _HomeUiState;
}
