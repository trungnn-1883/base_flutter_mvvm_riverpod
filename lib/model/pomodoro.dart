class Pomodoro {
  final int focusDuration; // in minutes
  final int shortBreakDuration; // in minutes
  final int longBreakDuration; // in minutes

  final int numberOfCycles;

  bool isInFocus;
  bool isInShortBreak;
  bool isInLongBreak;

  int completedCycles;

  Pomodoro({
    required this.focusDuration,
    required this.shortBreakDuration,
    required this.longBreakDuration,
    required this.numberOfCycles,
    this.isInFocus = true,
    this.isInShortBreak = false,
    this.isInLongBreak = false,
    this.completedCycles = 0,
  });

  void startFocus() {
    // Logic to start focus session
    isInFocus = true;
    isInShortBreak = false;
    isInLongBreak = false;
  }

  void startShortBreak() {
    // Logic to start short break
    isInFocus = false;
    isInShortBreak = true;
    isInLongBreak = false;
  }

  void startLongBreak() {
    // Logic to start long break
    isInFocus = false;
    isInShortBreak = false;
    isInLongBreak = true;
  }
}
