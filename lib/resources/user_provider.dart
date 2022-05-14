import 'package:dio/dio.dart';
import 'package:dropdown_bloc/models/user_model.dart';

class UserProvider {
  final Dio _dio = Dio();
  final String url = "https://jsonplaceholder.typicode.com/users";

  // future<UserModel> is empty
  Future<DataUser> fetchUserList() async {
    try {
      Response response = await _dio.get(url);
      return DataUser.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return DataUser.withError("Data not found / Connection issue");
    }
  }
}
