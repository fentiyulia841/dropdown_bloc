import 'package:dropdown_bloc/models/user_model.dart';
import 'user_provider.dart';

class UserRepository {
  final _provider = UserProvider();

  
  Future<DataUser> fetchUserList() {
    return _provider.fetchUserList();
  }
}

class NetworkError extends Error {
  
}
