class User {
  int id;
  String email;
  String password;
  String token;
  String img;

  User({this.id, this.email, this.password, this.token, this.img});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    password = json['password'];
    token = json['token'];
    img = json['img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['password'] = this.password;
    data['token'] = this.token;
    data['img'] = this.img;
    return data;
  }
}
