import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logger/logger.dart';
import 'package:taskamo/data-models/login/login_req_model.dart';
import 'package:taskamo/data-models/token/token_model.dart';
import 'package:taskamo/services/local_services/hive_client.dart';
import 'package:taskamo/services/network_services/api_client.dart';
import 'package:taskamo/services/network_services/api_handler.dart';
import 'package:taskamo/utils/categories/api_categories.dart';
import 'package:taskamo/utils/categories/hive_categories.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    LoginReqModel loginReqModel = LoginReqModel();
    bool checkEmail() {
      if (loginReqModel.email != null) {
        return true;
      }
      return false;
    }

    bool checkPassword() {
      if (loginReqModel.password != null) {
        return true;
      }
      return false;
    }

    LoginState checkValidations() {
      if (checkEmail() && checkPassword()) {
        return LoginValidState();
      }
      return LoginInValidState();
    }

    on<LoginDataChangedEvent>(
      (event, emit) {
        if (event.email != null) {
          loginReqModel.email = event.email;
        }
        if (event.password != null) {
          loginReqModel.password = event.password;
        }
        emit(checkValidations());
      },
    );
    on<LoginSubmitEvent>(
      (event, emit) async {
        ApiHandler api = await TaskamoApiClient.post(
          auth: false,
          TaskamoAPICategories.login,
          body: loginReqModelToMap(loginReqModel),
          // query: loginReqModelToMap(loginReqModel),
        );
        if (api.status == ResponseStatus.success) {
          TokenModel tokenModel = tokenModelFromMap(api.data);
          await TaskamoHiveClient.write(
            key: TaskamoHiveCategories.accessToken,
            value: tokenModel.data.token,
          );
          emit(LoginDoneState());
        }
      },
    );
  }
}
