enum BaseStateStatus {
  initial,
  loading,
  success,
  generalError,
  focusedError,
  noConnection,
  updateRequired,
  updateOptional,
}

class BaseState {
  BaseState({required this.status, this.callbackMessage = ''});
  BaseStateStatus status;
  String callbackMessage;

  T when<T>({
    required T Function(BaseState state) onState,
    T Function()? onError,
    T Function()? onNoConnection,
    T Function()? onLoading,
  }) {
    switch (status) {
      case BaseStateStatus.loading:
        return onLoading != null ? onLoading() : onState(this);
      case BaseStateStatus.generalError:
        return onError != null ? onError() : onState(this);
      case BaseStateStatus.noConnection:
        return onNoConnection != null ? onNoConnection() : onState(this);
      default:
        return onState(this);
    }
  }

  BaseState copyWith({
    BaseStateStatus? status,
    String? callbackMessage,
  }) {
    return BaseState(
      status: status ?? this.status,
      callbackMessage: callbackMessage ?? this.callbackMessage,
    );
  }
}
