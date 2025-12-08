enum PomodoroType { focus, shortBreak, longBreak }

class Pomodoro {
  final int focusDuration; // in minutes
  final int shortBreakDuration; // in minutes
  final int longBreakDuration; // in minutes

  final int numberOfCycles;

  PomodoroType currentType;

  int completedCycles;

  Pomodoro({
    required this.focusDuration,
    required this.shortBreakDuration,
    required this.longBreakDuration,
    required this.numberOfCycles,
    this.currentType = PomodoroType.focus,
    this.completedCycles = 0,
  });

  void startFocus() {
    // Logic to start focus session
    this.currentType = PomodoroType.focus;
  }

  void startShortBreak() {
    // Logic to start short break
    this.currentType = PomodoroType.shortBreak;
  }

  void startLongBreak() {
    // Logic to start long break
    this.currentType = PomodoroType.longBreak;
  }

  factory Pomodoro.fromJson(Map<String, dynamic> json) {
    return Pomodoro(
      focusDuration: json['focusDuration'] ?? 25,
      shortBreakDuration: json['shortBreakDuration'] ?? 5,
      longBreakDuration: json['longBreakDuration'] ?? 15,
      numberOfCycles: json['numberOfCycles'] ?? 4,
      currentType: PomodoroType.values[json['currentType'] ?? 0],
      completedCycles: json['completedCycles'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'focusDuration': focusDuration,
      'shortBreakDuration': shortBreakDuration,
      'longBreakDuration': longBreakDuration,
      'numberOfCycles': numberOfCycles,
      'currentType': currentType.index,
      'completedCycles': completedCycles,
    };
  }
}
