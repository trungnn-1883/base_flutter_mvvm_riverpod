part of '../home_view.dart';

extension PomodoroStepProgress on HomeView {
  Widget _buildStepProgress(WidgetRef ref) {
    return StepProgress(
      padding: const EdgeInsets.symmetric(horizontal: 64),
      stepNodeSize: 24,
      visibilityOptions: StepProgressVisibilityOptions.nodeOnly,
      highlightOptions: StepProgressHighlightOptions.highlightCompletedNodes,
      margin: const EdgeInsets.symmetric(horizontal: 64),
      totalSteps: 4,
      controller:
          ref.read(homeViewModelProvider.notifier).stepProgressController,
      theme: StepProgressThemeData(
        activeForegroundColor: Colors.lightBlueAccent,
        stepNodeStyle: StepNodeStyle(
          activeIcon: Container(
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent,
              shape: BoxShape.circle,
            ),
          ),
          icon: Container(
            decoration: BoxDecoration(
              color: Colors.white24,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }
}
