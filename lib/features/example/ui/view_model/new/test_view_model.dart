import 'package:flutter_mvvm_riverpod/base/ui/base_view_model.dart';
import 'package:flutter_mvvm_riverpod/features/example/ui/views/example_ui_state.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_view_model.g.dart';

@riverpod
class TestViewModel extends _$TestViewModel with BaseViewModel<ExampleData> {
  @override
  FutureOr<ExampleData> build() async {
    // Initial data loading logic can be placed here
    return ExampleData(
        title: "Initial Title", description: "Initial Description");
  }
}
