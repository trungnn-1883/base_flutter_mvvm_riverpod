import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod/base/common/ui/widgets/circle_button.dart';
import 'package:flutter_mvvm_riverpod/base/ui/base_root_view.dart';
import 'package:flutter_mvvm_riverpod/features/home/view/widgets/pomodoro_step.dart';
import 'package:flutter_mvvm_riverpod/features/home/view_model/home_view_model.dart';
import 'package:flutter_mvvm_riverpod/generated/locale_keys.g.dart';
import 'package:flutter_mvvm_riverpod/model/pomodoro.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:step_progress/step_progress.dart';

part 'components/count_down_timer.dart';
part 'components/header_view.dart';
part 'components/podomoro_type_view.dart';
part 'components/step_progress.dart';
part 'components/timer_controls.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BaseRootView(
      viewModelProvider: homeViewModelProvider,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildeHeaderView(ref),
                Gap(72),
                _buildStepProgress(ref),
                const Gap(16),
                _buildCircularCountdown(ref),
                const Gap(32),
                _buildTimerControls(ref),
                Gap(32),
                _buildPomodoroTypView(ref)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
