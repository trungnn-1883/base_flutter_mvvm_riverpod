import 'package:flutter_mvvm_riverpod/data/local/local_impl/app_share_pref_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_share_provider.g.dart';

@riverpod
AppSharePrefImpl appSharePref(Ref ref) {
  return AppSharePrefImpl.instance;
}
