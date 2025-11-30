import 'dart:math';

import 'package:flutter_mvvm_riverpod/base/common/local/app_share_pref.dart';
import 'package:flutter_mvvm_riverpod/base/common/local/app_share_provider.dart';
import 'package:flutter_mvvm_riverpod/features/example/ui/views/example_ui_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'new_view_model.g.dart';

@riverpod
class NewViewModel extends _$NewViewModel {
  late final AppSharePref prefs;

  @override
  FutureOr<ExampleData> build() async {
    await Future.delayed(const Duration(seconds: 1));
    prefs = await ref.read(appSharePrefProvider);

    return const ExampleData(
      title: 'Hello, MVVM with Riverpod!',
      description: 'This is an example description.',
    );
  }

  Future<void> randomUpdate() async {
    state = const AsyncValue.loading();
    await Future.delayed(Duration(seconds: 1));
    final listTitle = [
      'First Title',
      'Second Title',
      'Third Title',
      'Fourth Title',
      'Fifth Title',
      'Sixth Title',
      'Microsoft Title',
      'Lumia '
    ];
    final randomIndex = Random().nextInt(listTitle.length);
    final newData = ExampleData(
      title: 'Random Title at ${listTitle.elementAt(randomIndex)} ',
      description: 'Random Description at ${DateTime.now()}',
    );
    print('New Data: $newData');
    state = AsyncData(newData);
  }
}
