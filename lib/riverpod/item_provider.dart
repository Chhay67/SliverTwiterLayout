import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item_state.dart';

final itemsProvider = StateNotifierProvider.autoDispose<ItemsNotifier, NotificationsState>((ref) {
  return ItemsNotifier();
});


class ItemsNotifier extends StateNotifier<NotificationsState> {
  ItemsNotifier() : super(NotificationsState()){
    getItems();
  }

  Future<void> getItems() async {
    try {
      List<String> tempList = await Future.delayed(const Duration(seconds: 2),() => ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10']);
      if(state.items.length > 50){
        tempList = await Future.delayed(const Duration(seconds: 2),() => ['1', '2', '3', '4', '5', '6', ]);
      }
      state = state.copyWith(
        items: [...state.items, ...tempList],
        hasMoreData: tempList.length == state.count,
        loading: LoadingState.success,
        page: state.page + 1,
      );

    } catch (error) {
      state = state.copyWith(loading: LoadingState.error,errorMsg: error.toString());
    }
  }
}
