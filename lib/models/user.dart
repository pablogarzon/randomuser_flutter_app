class User {
  Login login;
  String gender;
  String email;
  Name name;
  Picture picture;

  User();

  User.fromJson(Map json){
    this.login = Login.fromJson(json["login"]);
    this.gender = json["gender"];
    this.email = json["email"];
    this.name = Name.fromJson(json["name"]);
    this.picture = Picture.fromJson(json["picture"]);
  }
}

class Login {
  String uuid;
  String username;

  Login.fromJson(Map json){
    this.uuid = json["uuid"];
    this.username = json["login.username"];
  }
}

class Name {
  String first;
  String last;

  Name.fromJson(Map json){
    this.first = json["first"];
    this.last = json["last"];
  }
}

class Picture {
  String largePicture;
  String thumbnail;

  Picture.fromJson(Map json){
    this.largePicture = json["large"];
    this.thumbnail = json["thumbnail"];
  }
}
