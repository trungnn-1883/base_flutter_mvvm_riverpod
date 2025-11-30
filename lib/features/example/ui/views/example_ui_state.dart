import 'package:freezed_annotation/freezed_annotation.dart';

part 'example_ui_state.freezed.dart';

@freezed
abstract class ExampleData with _$ExampleData {
  const factory ExampleData({
    required String title,
    required String description,
  }) = _ExampleData;
}
