import 'dart:math';

import 'package:flutter_mvvm_riverpod/features/example/ui/views/example_ui_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExampleViewModel extends StateNotifier<ExampleData> {
  ExampleViewModel() : super(const ExampleData(title: '', description: '')) {
    _loadData();
  }

  Future<void> _loadData() async {
    // Simulate data fetching
    await Future.delayed(const Duration(seconds: 1));
    state = const ExampleData(
      title: 'Hello, MVVM with Riverpod!',
      description: 'This is an example description.',
    );
  }

  void randomUpdate() {
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
    state = ExampleData(
        title: 'Updated Title at ${listTitle.elementAt(randomIndex)} ',
        description: 'Updated Description at ${DateTime.now()}');
  }
}
