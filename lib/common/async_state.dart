import 'package:flutter/cupertino.dart';
import 'package:split_bill/common/enum/state_widget_type.dart';
import 'package:split_bill/common/widgets/error_view.dart';
import 'package:split_bill/common/widgets/loading_view.dart';
import 'package:split_bill/services/app_exeption.dart';

sealed class AsyncState<T> {
  Widget map(
          {required Function() loading,
          required Function(AppException error) error,
          required Function(T data) data}) =>
      switch (this) {
        LoadingState() => loading.call(),
        ErrorState(error: var err) => error.call(err),
        DataState(data: var value) => data.call(value),
      };

// geneerate a new state based on the current state
  Widget mapData(Function(T data) data,
          {StateWidgetType type = StateWidgetType.normal}) =>
      map(
        loading: () => LoadingView(type: type),
        error: (err) => ErrorView(type: type, error: err),
        data: data,
      );
}

class LoadingState<T> extends AsyncState<T> {}

class DataState<T> extends AsyncState<T> {
  final T data;
  DataState(this.data);
}

class ErrorState<T> extends AsyncState<T> {
  final AppException error;
  ErrorState(this.error);
}
