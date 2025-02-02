import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = "https://student.valuxapps.com/api/";
  final Dio _dio;
  
  ApiService(this._dio);

  Future<Map<String, dynamic>> post({required endPoint, required data}) async {
    var response = await _dio.post('$_baseUrl$endPoint', data: data,options: Options(

      
      headers: {
        
      }
    ));
    return response.data;
  }
}
