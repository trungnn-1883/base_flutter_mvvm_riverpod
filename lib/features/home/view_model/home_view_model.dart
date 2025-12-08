import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_mvvm_riverpod/data/local/app_share_pref.dart';
import 'package:flutter_mvvm_riverpod/data/repository/home_repository.dart';
import 'package:flutter_mvvm_riverpod/data/repository/repository_impl/home_repository_impl.dart';
import 'package:flutter_mvvm_riverpod/features/home/view/home_ui_state.dart';
import 'package:flutter_mvvm_riverpod/model/pomodoro.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:step_progress/step_progress.dart';

import '../../../gen/assets.gen.dart';

part 'home_view_model.g.dart';

enum TimerStatus { initial, running, paused, stopped }

@riverpod
class HomeViewModel extends _$HomeViewModel {
  final CountDownController countDownController = CountDownController();
  final StepProgressController stepProgressController =
      StepProgressController(totalSteps: 4);

  bool isAutoAdvanceNext = true; // auto start next session flag

  late final HomeRepository homeRepository;

  late final AppSharePref appSharePref;

  final player = AudioPlayer();

  TimerStatus get timerStatus {
    if (!countDownController.isStarted.value) {
      return TimerStatus.initial;
    } else if (countDownController.isPaused.value) {
      return TimerStatus.paused;
    } else if (countDownController.isResumed.value ||
        countDownController.isStarted.value) {
      return TimerStatus.running;
    } else {
      return TimerStatus.stopped;
    }
  }

  @override
  FutureOr<HomeUiState> build() async {
    // Initial data loading logic can be placed here

    stepProgressController.setCurrentStep(0);
    homeRepository = ref.read(homeRepositoryProvider);

    final userName = await homeRepository.fetchUserName();
    final quote = await homeRepository.fetchRandomQuote();
    final pomodoro = await homeRepository.fetchPomodoro();
    // TODO: update isAutoAdvanceNext based on saved user preference
    return HomeUiState(
      userName: userName,
      quote: quote,
      pomodoro: pomodoro,
      timerStatus: TimerStatus.initial,
    );
  }

  // Toggle / set auto advance
  void setAutoAdvance(bool value) => isAutoAdvanceNext = value;

  int _minutesForType(Pomodoro p, PomodoroType type) {
    switch (type) {
      case PomodoroType.focus:
        return p.focusDuration;
      case PomodoroType.shortBreak:
        return p.shortBreakDuration;
      case PomodoroType.longBreak:
        return p.longBreakDuration;
    }
  }

  int secondsForType(PomodoroType type) {
    final currentState = state as AsyncData<HomeUiState>;
    return _minutesForType(currentState.value.pomodoro, type) * 60;
  }

  void startTimer() {
    countDownController.start();
    final previousState = state as AsyncData<HomeUiState>;
    final newState = previousState.value.copyWith(timerStatus: timerStatus);
    state = AsyncData(newState);
  }

  void pauseTimer() {
    countDownController.pause();
    final previousState = state as AsyncData<HomeUiState>;
    final newState = previousState.value.copyWith(timerStatus: timerStatus);
    state = AsyncData(newState);
  }

  void resumeTimer() {
    countDownController.resume();
    final previousState = state as AsyncData<HomeUiState>;
    final newState = previousState.value.copyWith(timerStatus: timerStatus);
    state = AsyncData(newState);
  }

  Future<void> onTimerComplete() async {
    await player.play(
      AssetSource(Assets.sounds.souDone.replaceFirst('assets/', '')),
      volume: 1,
    );
    final previousState = state as AsyncData<HomeUiState>;
    // what happen if user set new pomodoro settings during running?

    final currentPomodoro = previousState.value.pomodoro;
    final currentType = currentPomodoro.currentType;

    // Determine next type and update step progress
    PomodoroType nextType;
    if (currentType == PomodoroType.focus) {
      // Mark a focus cycle completed

      // Decide between short or long break
      if (stepProgressController.currentStep >=
          stepProgressController.totalSteps) {
        nextType = PomodoroType.longBreak;
      } else {
        nextType = PomodoroType.shortBreak;
      }
    } else if (currentType == PomodoroType.shortBreak) {
      nextType = PomodoroType.focus;
      final currentStep = stepProgressController.currentStep;
      if (currentStep < stepProgressController.totalSteps) {
        stepProgressController.setCurrentStep(currentStep + 1);
      }
    } else {
      // Long break finished -> reset cycles
      stepProgressController.setCurrentStep(0);
      nextType = PomodoroType.focus;
    }

    // what happen if user set new pomodoro settings during running?

    final updatedPomodoro = Pomodoro(
      focusDuration: currentPomodoro.focusDuration,
      shortBreakDuration: currentPomodoro.shortBreakDuration,
      longBreakDuration: currentPomodoro.longBreakDuration,
      numberOfCycles: currentPomodoro.numberOfCycles,
      currentType: nextType,
    );

    if (isAutoAdvanceNext) {
      // Restart timer with new duration and reflect running status
      countDownController.restart(duration: secondsForType(nextType));
      final newState = previousState.value.copyWith(
        pomodoro: updatedPomodoro,
        timerStatus: timerStatus, // will be running after restart
      );
      state = AsyncData(newState);
    } else {
      // Just update pomodoro; wait for user to start manually
      final newState = previousState.value.copyWith(
        pomodoro: updatedPomodoro,
        timerStatus: TimerStatus.initial,
      );
      state = AsyncData(newState);
    }
  }
}
