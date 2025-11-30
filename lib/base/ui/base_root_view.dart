import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod/base/common/ui/widgets/loading.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BaseRootView<V> extends StatelessWidget {
  final ProviderBase<AsyncValue<V>> viewModelProvider;
  final Widget child;

  const BaseRootView({
    super.key,
    required this.viewModelProvider,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    print('Building BaseRootView - root');
    return Stack(
      children: [
        child,
        Consumer(
          builder: (context, ref, _) {
            final viewModel = ref.watch(viewModelProvider);
            print('Building BaseRootView - loading or error');
            return viewModel.isLoading
                ? Loading()
                : (viewModel.hasError
                    ? _buildErrorView(ref, viewModel.error!)
                    : SizedBox.shrink());
          },
        )
      ],
    );
  }

  Widget _buildErrorView(WidgetRef ref, Object error) {
    if (error is Exception) {
      // You can customize error handling based on exception types
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.error, color: Colors.red, size: 64),
          const SizedBox(height: 16),
          Text(
            'An error occurred:\n${error.toString()}',
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.red),
          ),
        ],
      ),
    );
  }
}
