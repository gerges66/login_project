import 'package:auth_app/core/utils/api_service.dart';
import 'package:auth_app/core/utils/errors/failure.dart';
import 'package:auth_app/features/login/data/model/login_model.dart';
import 'package:auth_app/features/login/data/repositories/login_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

class LoginRepoImplemention implements LoginRepo {
  final ApiService apiService;

  LoginRepoImplemention(this.apiService);
  @override
  Future<Either<Failure, LoginModel>> loginUser(
      {required String email, required password}) async {
    try {
      var data = await apiService.post(endPoint: "login", data: {
        "email": email,
        "password": password,
      });
      return right(LoginModel.fromJson(data));
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioErorr(e));
      } else {
        return left(ServerFailure(e.toString()));
      }
    }
  }
}
