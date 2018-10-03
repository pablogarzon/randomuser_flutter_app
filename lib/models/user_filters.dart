class UserFilters {
  String gender;
  double age;
  String nat;

  UserFilters({
    this.gender,
    this.age = 100.0,
    this.nat
  });

  UserFilters copy(){
    return UserFilters(
        gender: this.gender,
        age: this.age,
        nat: this.nat
    );
  }
}