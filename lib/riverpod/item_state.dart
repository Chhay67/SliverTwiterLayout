
enum LoadingState {
  initial,
  progress,
  success,
  error,
}

class NotificationsState {
  final List<String> items;
  final int page;
  final int count;
  final String errorMsg;
  final LoadingState loading;
  final bool hasMoreData;
  bool get refreshError => errorMsg != '' && items.length <= 10;

  NotificationsState(
      { this.count = 10,
        this.page = 1,
        this.hasMoreData = false,
        this.items = const [],
        this.errorMsg = '',
        this.loading = LoadingState.progress});
  NotificationsState copyWith({
    List<String>? items,
    String? errorMsg,
    int? count,
    int? page,
    bool? hasMoreData,
    LoadingState? loading,
  }) {
    return NotificationsState(
      items: items ?? this.items,
      page: page ?? this.page,
      hasMoreData: hasMoreData ?? this.hasMoreData,
      count: count ?? this.count,
      errorMsg: errorMsg ?? this.errorMsg,
      loading: loading ?? this.loading,
    );
  }
}
