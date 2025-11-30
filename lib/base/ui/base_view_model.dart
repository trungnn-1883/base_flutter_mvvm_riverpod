import 'package:riverpod_annotation/riverpod_annotation.dart';

mixin BaseViewModel<T> on AutoDisposeAsyncNotifier<T> {
  // Add common functionalities for view models here
  void commonFunction() {
    // Implementation of a common function
  }

  void anotherCommonFunction() {
    // Implementation of another common function
  }

}
