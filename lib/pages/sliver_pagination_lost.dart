import 'package:flutter/material.dart';

class SliverListView extends StatelessWidget {
  const SliverListView({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    required this.hasMoreData,
    this.separatorBuilder,
    this.emptyWidget,
    this.errorWidget,
    this.hasError = false,
  });

  final int itemCount;
  final bool hasMoreData;
  final IndexedWidgetBuilder itemBuilder;
  final IndexedWidgetBuilder? separatorBuilder;
  final Widget? emptyWidget;
  final Widget? errorWidget;
  final bool hasError;
  @override
  Widget build(BuildContext context) {
    if (itemCount <= 0) {
      return emptyWidget ?? const SizedBox.shrink();
    }
    return SliverList.separated(
      separatorBuilder:
          separatorBuilder ?? (context, index) => const SizedBox.shrink(),
      itemCount: itemCount + 1,
      itemBuilder: (context, index) {
        if (index == itemCount) {
          return LoadingMoreDataWidget(
            hasMoreData: hasMoreData,
            hasError: hasError,
          );
        }
        return itemBuilder(context, index);
      },
    );
  }
}

class LoadingMoreDataWidget extends StatelessWidget {
  const LoadingMoreDataWidget({
    super.key,
    this.hasError = false,
    this.hasMoreData = false,
    this.errorWidget,
  });
  final bool hasError;
  final bool hasMoreData;
  final Widget? errorWidget;
  @override
  Widget build(BuildContext context) {
    if (hasError) {
      return errorWidget ??
          const TextButton(
            onPressed: null,
            child: Text('something when wrong!'),
          );
    }
    if (hasMoreData && hasError == false) {
      return const CircularProgressIndicator();
    }
    return const SizedBox.shrink();
  }
}
