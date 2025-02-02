import 'package:auth_app/core/utils/errors/failure.dart';
import 'package:auth_app/features/login/data/model/login_model.dart';
import 'package:dartz/dartz.dart';
abstract class LoginRepo {
 Future<Either<Failure,LoginModel>>loginUser({required String email,required password});
}