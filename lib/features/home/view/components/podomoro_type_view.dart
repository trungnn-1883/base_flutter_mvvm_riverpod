part of '../home_view.dart';

extension PodomoroTypeView on HomeView {
  Widget _buildPomodoroTypView(WidgetRef ref) {
    final pomodoroType = ref.watch(homeViewModelProvider.select((selector) =>
        selector.valueOrNull?.pomodoro.currentType ?? PomodoroType.focus));

    return Consumer(
      builder: (context, ref, child) {
        return Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 40,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: PomodoroStepView(
                  icon: HugeIcons.strokeRoundedFocusPoint,
                  text: LocaleKeys.pomodoroStepFocus.tr(),
                  isEnabled: pomodoroType == PomodoroType.focus,
                ),
              ),
            ),
            PomodoroStepView(
              icon: HugeIcons.strokeRoundedTea,
              text: LocaleKeys.pomodoroStepShortBreak.tr(),
              isEnabled: pomodoroType == PomodoroType.shortBreak,
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerLeft,
                child: PomodoroStepView(
                  icon: HugeIcons.strokeRoundedAlarmClock,
                  text: LocaleKeys.pomodoroStepLongBreak.tr(),
                  isEnabled: pomodoroType == PomodoroType.longBreak,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
