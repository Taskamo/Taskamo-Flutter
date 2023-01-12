import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskamo/data-models/register/register_req_model.dart';
import 'package:taskamo/data-models/token/token_model.dart';
import 'package:taskamo/services/local_services/hive_client.dart';
import 'package:taskamo/services/network_services/api_client.dart';
import 'package:taskamo/services/network_services/api_handler.dart';
import 'package:taskamo/utils/categories/api_categories.dart';
import 'package:taskamo/utils/categories/hive_categories.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  SignupModel signupModel = SignupModel();

  bool checkName() {
    if (signupModel.name != null) {
      return true;
    }
    return false;
  }

  bool checkEmail() {
    if (signupModel.email != null) {
      return true;
    }
    return false;
  }

  bool checkPassword() {
    if (signupModel.password != null) {
      return true;
    }
    return false;
  }

  bool checkPasswordMatch() {
    if (signupModel.passwordConfirmation != null &&
        signupModel.passwordConfirmation == signupModel.password) {
      return true;
    }
    return false;
  }

  SignupState checkValidations() {
    if (checkName() &&
        checkEmail() &&
        checkPassword() &&
        checkPasswordMatch()) {
      return SignupValidState();
    }
    return SignupInvalidState();
  }

  SignupBloc() : super(SignupInitial()) {
    on<SignupDataChangedEvent>(
      (event, emit) {
        if (event.name != null) {
          signupModel.name = event.name;
        }
        if (event.email != null) {
          signupModel.email = event.email;
        }
        if (event.password != null) {
          signupModel.password = event.password;
        }
        if (event.passwordConfirm != null) {
          signupModel.passwordConfirmation = event.passwordConfirm;
        }
        emit(checkValidations());
      },
    );
    on<SignupSubmitEvent>(
      (event, emit) async {
        emit(SignupLoadingState());
        ApiHandler api = await TaskamoApiClient.post(
          TaskamoAPICategories.register,
          auth: false,
          body: signupModelToMap(signupModel),
        );
        if (api.status == ResponseStatus.success) {
          TokenModel tokenModel = tokenModelFromMap(api.data);
          await TaskamoHiveClient.write(
            key: TaskamoHiveCategories.accessToken,
            value: tokenModel.data.token,
          );
          emit(SignupDoneState());
        } else {
          emit(SignupInvalidState());
        }
      },
    );
  }
}
