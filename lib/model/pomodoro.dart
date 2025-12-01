enum PomodoroType { focus, shortBreak, longBreak }

class Pomodoro {
  final int focusDuration; // in minutes
  final int shortBreakDuration; // in minutes
  final int longBreakDuration; // in minutes

  final int numberOfCycles;

  PomodoroType pomodoroType;

  int completedCycles;

  Pomodoro({
    required this.focusDuration,
    required this.shortBreakDuration,
    required this.longBreakDuration,
    required this.numberOfCycles,
    this.pomodoroType = PomodoroType.focus,
    this.completedCycles = 0,
  });

  void startFocus() {
    // Logic to start focus session
    this.pomodoroType = PomodoroType.focus;
  }

  void startShortBreak() {
    // Logic to start short break
    this.pomodoroType = PomodoroType.shortBreak;
  }

  void startLongBreak() {
    // Logic to start long break
    this.pomodoroType = PomodoroType.longBreak;
  }
}
