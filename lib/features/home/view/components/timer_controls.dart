part of '../home_view.dart';

extension PomodoroTimerControls on HomeView {
  Widget _buildTimerControls(WidgetRef ref) {
    return Consumer(
      builder: (context, ref, _) {
        final status = ref.watch(
          homeViewModelProvider.select(
            (selector) =>
                selector.valueOrNull?.timerStatus ?? TimerStatus.initial,
          ),
        );
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // initially, only the start button is visible
            if (status == TimerStatus.initial)
              _buildIconButton(
                icon: Icons.play_arrow,
                tooltip: 'Start',
                onPressed: () =>
                    ref.read(homeViewModelProvider.notifier).startTimer(),
              ),
            // when running, show pause button
            if (status == TimerStatus.running)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                spacing: 32,
                children: [
                  _buildIconButton(
                    icon: Icons.pause,
                    tooltip: 'Pause',
                    onPressed: () =>
                        ref.read(homeViewModelProvider.notifier).pauseTimer(),
                  ),
                  _buildIconButton(
                    icon: Icons.skip_next,
                    tooltip: 'Pause',
                    onPressed: () => ref
                        .read(homeViewModelProvider.notifier)
                        .onTimerComplete(),
                  ),
                ],
              ),
            // when paused, show resume button
            if (status == TimerStatus.paused)
              _buildIconButton(
                icon: Icons.play_arrow,
                tooltip: 'Resume',
                onPressed: () =>
                    ref.read(homeViewModelProvider.notifier).resumeTimer(),
              ),
          ],
        );
      },
    );
  }

  Widget _buildIconButton({
    required IconData icon,
    required String tooltip,
    required VoidCallback onPressed,
  }) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white.withOpacity(0.2),
          width: 4,
        ),
        color: Colors.black12,
      ),
      child: IconButton(
        tooltip: tooltip,
        iconSize: 40,
        onPressed: onPressed,
        icon: Icon(icon, color: Colors.lightBlue),
      ),
    );
  }
}
