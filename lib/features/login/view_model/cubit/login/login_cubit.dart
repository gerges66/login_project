import 'package:auth_app/features/login/data/repositories/login_repo.dart';
import 'package:auth_app/features/login/data/repositories/repo_impl.dart';
import 'package:auth_app/features/login/view_model/cubit/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCubit extends Cubit <LoginState>{
  LoginCubit(/* LoginRepoImplemention loginRepoImplemention, */ {required this.loginRepo})
      : super(InitialLogin());
  LoginRepo loginRepo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;
  Future<void> loginUser() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    isLoading = true;
    emit(LoadingLoginState());
    var data = await loginRepo.loginUser(
        email: emailController.text, password: passwordController.text);
    data.fold((failure) {
      isLoading = false;
      emit(FailureLogin(failure.errorMessage));
    }, (token) {
      emit(SuccessLogin());
      isLoading = false;
      pref.setString("token", token.data!.token);
    });
  }
    void loginValidate(){
if(formKey.currentState!.validate()){
  loginUser();
}
    }
}
