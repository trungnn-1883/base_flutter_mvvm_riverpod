import 'package:flutter_mvvm_riverpod/model/profile.dart';
import 'package:freezed_annotation/freezed_annotation.dart';


part 'profile_state.freezed.dart';
part 'profile_state.g.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  const factory ProfileState({
    Profile? profile,
  }) = _ProfileState;

  factory ProfileState.fromJson(Map<String, Object?> json) =>
      _$ProfileStateFromJson(json);
}
