import 'package:dio/dio.dart';
import 'package:intellij_tourism_designer/Network/config.dart';

class HttpRequest{
  static final BaseOptions baseOptions=BaseOptions(baseUrl:HttpConfig.baseURL,connectTimeout:HttpConfig.timeout);
  static final Dio dio=Dio(baseOptions);

  static Future<T> request<T>(String url,{String method="get"}) async{
    final options=Options(method:method);

    try{
      Response response = await dio.request(url, options: options);
      return response.data;
    } on DioError catch(e){
      return Future.error(e);
    }

  }
}