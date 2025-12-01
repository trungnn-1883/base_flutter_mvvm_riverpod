import 'dart:math';

import 'package:audioplayers/audioplayers.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter_mvvm_riverpod/features/home/view/home_ui_state.dart';
import 'package:flutter_mvvm_riverpod/model/Pomodoro.dart';
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
    return HomeUiState(
      userName: "Iron man",
      quote: getRandomQuote(),
      pomodoro: Pomodoro(
        focusDuration: 25,
        shortBreakDuration: 5,
        longBreakDuration: 15,
        numberOfCycles: 4,
        pomodoroType: PomodoroType.shortBreak,
      ),
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

  /// Returns a random quote from a predefined list.
  String getRandomQuote() {
    const quotes = [
      "Whatever you are, be a good one.",
      "The best way to get started is to quit talking and begin doing.",
      "Success is not in what you have, but who you are.",
      "Dream bigger. Do bigger.",
      "Don’t watch the clock; do what it does. Keep going.",
      "Great things never come from comfort zones.",
      "Push yourself, because no one else is going to do it for you.",
      "Believe you can and you're halfway there.",
      "It always seems impossible until it’s done."
    ];
    final random = Random();
    return quotes[random.nextInt(quotes.length)];
  }

  /// Updates the state with a new random quote.
  void setRandomQuote() {
    final previousState = state as AsyncData<HomeUiState>;
    final newQuote = getRandomQuote();
    final newState = previousState.value.copyWith(quote: newQuote);
    state = AsyncData(newState);
  }

  Future<void> onTimerComplete() async {
    await player.play(
      AssetSource(Assets.sounds.souTing.replaceFirst('assets/', '')),
      volume: 1,
    );
    final previousState = state as AsyncData<HomeUiState>;
    final currentPomodoro = previousState.value.pomodoro;
    final currentType = currentPomodoro.pomodoroType;

    // Determine next type and update step progress
    PomodoroType nextType;
    if (currentType == PomodoroType.focus) {
      // Mark a focus cycle completed
      final currentStep = stepProgressController.currentStep;
      if (currentStep < stepProgressController.totalSteps) {
        stepProgressController.setCurrentStep(currentStep + 1);
      }
      // Decide between short or long break
      if (stepProgressController.currentStep >=
          stepProgressController.totalSteps) {
        nextType = PomodoroType.longBreak;
      } else {
        nextType = PomodoroType.shortBreak;
      }
    } else if (currentType == PomodoroType.shortBreak) {
      nextType = PomodoroType.focus;
    } else {
      // Long break finished -> reset cycles
      stepProgressController.setCurrentStep(0);
      nextType = PomodoroType.focus;
    }

    final updatedPomodoro = Pomodoro(
      focusDuration: currentPomodoro.focusDuration,
      shortBreakDuration: currentPomodoro.shortBreakDuration,
      longBreakDuration: currentPomodoro.longBreakDuration,
      numberOfCycles: currentPomodoro.numberOfCycles,
      pomodoroType: nextType,
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
