part of '../home_view.dart';

extension HeaderView on HomeView {
  Widget _buildeHeaderView(WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 24,
            ),
            Gap(24),
            Text('Hello ${getUserName(ref)}'),
          ],
        ),
        Gap(32),
        Center(
          child: Text(
            textAlign: TextAlign.center,
            '"${getQuote(ref)}"',
            style: TextStyle(fontSize: 20),
          ),
        ),
      ],
    );
  }

  String getUserName(WidgetRef ref) {
    final userName = ref.watch(
        homeViewModelProvider.select((selector) => selector.valueOrNull));
    return userName?.userName ?? '';
  }

  String getQuote(WidgetRef ref) {
    final quote = ref.watch(
        homeViewModelProvider.select((selector) => selector.valueOrNull));
    return quote?.quote ?? '';
  }
}
