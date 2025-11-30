import 'package:flutter/material.dart';
import 'package:flutter_mvvm_riverpod/base/ui/base_root_view.dart';
import 'package:flutter_mvvm_riverpod/features/example/ui/view_model/new/new_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExampleView extends ConsumerWidget {
  const ExampleView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newViewModel = ref.read(newViewModelProvider.notifier);
    print('Building BaseRootView - parent');

    return BaseRootView(
      viewModelProvider: newViewModelProvider,
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Consumer(builder: (context, ref, data) {
                  print('Building BaseRootView - child');
                  final example = ref.watch((newViewModelProvider)
                      .select((selector) => selector.valueOrNull));
                  if (example == null) {
                    return const SizedBox.shrink();
                  }
                  return Column(
                    children: [
                      Text('Example View ${example.title}'),
                      SizedBox(height: 16.0),
                      Text('This is a placeholder for ${example.description}'),
                    ],
                  );
                }),
                SizedBox(height: 32.0),
                ElevatedButton(
                  onPressed: () {
                    newViewModel.randomUpdate();
                  },
                  child: Text("Click Random"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
