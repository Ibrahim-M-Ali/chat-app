class UserModel {
  String? userId;

  String? email;

  String? name;

  String? pic;

  UserModel({
    required this.userId,
    required this.email,
    required this.name,
    required this.pic,
  });

  UserModel.fromJson(map) {
    userId = map['userId'];
    email = map['email'];
    name = map['name'];
    pic = map['pic'];
  }

  toJson() {
    return {
      'userId': userId,
      'email': email,
      'name': name,
      'pic': pic,
    };
  }
}
