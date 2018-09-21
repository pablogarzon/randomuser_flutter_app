class User {
  String gender;
  String email;
  Login login;
  Name name;
  Dob dob;
  Picture picture;
  String nat;

  User();

  User.fromJson(Map json){
    this.gender = json["gender"];
    this.email = json["email"];
    this.login = Login.fromJson(json["login"]);
    this.name = Name.fromJson(json["name"]);
    this.dob = Dob.fromJson(json["dob"]);
    this.picture = Picture.fromJson(json["picture"]);
    this.nat = json["nat"];
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

class Login {
  String uuid;
  String username;

  Login.fromJson(Map json){
    this.uuid = json["uuid"];
    this.username = json["login.username"];
  }
}

class Dob {
  int age;

  Dob.fromJson(Map json){
    this.age = json["age"];
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
