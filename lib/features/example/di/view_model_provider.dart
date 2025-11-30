import 'package:flutter_mvvm_riverpod/features/example/ui/views/example_ui_state.dart';
import 'package:flutter_mvvm_riverpod/features/example/ui/view_model/old/example_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final exampleViewModelProvider =
    StateNotifierProvider.autoDispose<ExampleViewModel, ExampleData>(
  (ref) => ExampleViewModel(),
);
