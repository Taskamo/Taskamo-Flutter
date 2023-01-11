class ApiHandler<T> {
  T? data;
  ResponseStatus? status;
  late String massage;

  ApiHandler() {
    data = null;
    status = ResponseStatus.loading;
  }

  void setDataSuccess({required T data, String massage = ''}) {
    this.data = data;
    status = ResponseStatus.success;
    this.massage = massage;
  }

  void setDataError({required String errorMassage, T? data}) {
    this.data = data;
    status = ResponseStatus.error;
    massage = errorMassage;
  }

  String getMassage() {
    return status == ResponseStatus.error ? massage : '';
  }

  T? getData() {
    return data;
  }

  bool isSuccess() {
    return status == ResponseStatus.success;
  }

  ApiHandler<T> copyTo() {
    ApiHandler<T> res = ApiHandler();
    res.data = data;
    res.status = status;
    res.massage = massage;
    return res;
  }

  @override
  String toString() {
    return 'APIHandler{data: $data, status: $status, massage: $massage}';
  }
}

enum ResponseStatus { success, error, loading }
