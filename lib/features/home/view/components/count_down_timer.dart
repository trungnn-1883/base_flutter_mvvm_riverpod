part of '../home_view.dart';

extension PomodoroCountdown on HomeView {
  Widget _buildCircularCountdown(WidgetRef ref) {
    return Center(
      child: CircularCountDownTimer(
        duration: 200,
        initialDuration: 0,
        controller:
            ref.read(homeViewModelProvider.notifier).countDownController,
        width: MediaQuery.of(ref.context).size.width / 2,
        height: 300.0,
        ringColor: Colors.grey[300]!,
        fillColor: Colors.purpleAccent[100]!,
        backgroundColor: Colors.purple[500],
        strokeWidth: 20.0,
        strokeCap: StrokeCap.round,
        textStyle: const TextStyle(
          fontSize: 33.0,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        textFormat: CountdownTextFormat.S,
        isReverse: true,
        isReverseAnimation: false,
        isTimerTextShown: true,
        autoStart: false,
        onStart: () => debugPrint('Countdown Started'),
        onComplete: () {
          ref.read(homeViewModelProvider.notifier).onTimerComplete();
        },
        onChange: (String _) {},
        timeFormatterFunction: (defaultFormatterFunction, duration) {
          if (duration.inSeconds == 0) {
            return "Start";
          } else {
            final minutes =
                duration.inMinutes.remainder(60).toString().padLeft(2, '0');
            final seconds =
                duration.inSeconds.remainder(60).toString().padLeft(2, '0');
            return "$minutes:$seconds";
          }
        },
      ),
    );
  }
}
