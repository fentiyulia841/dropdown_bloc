class DataUser {
  String? error;
  List<UserModel>? users;

  DataUser.withError(String errorMessage) {
    error = errorMessage;
  }

  DataUser() {
    this.users;
  }

  DataUser.fromJson(List<dynamic> json) {
    if (json != null) {
      users = [];
      json.forEach((v) {
        users!.add(new UserModel.fromJson(v));
      });
    }
  }

  List<dynamic> toJson() {
    List<dynamic> data = [];

    if (this.users != null) {
      data = this.users!.map((v) => v.toJson()).toList();
    }

    return data;
  }
}

class UserModel {
  int? id;
  String? name;
  String? username;

  UserModel({
    this.id,
    this.name,
    this.username,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'username': username,
    };
  }
}
