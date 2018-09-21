class UserFilters {
  String gender;
  double age;
  String nationality;

  UserFilters.getDefault(){
    this.gender = "all";
    this.age = 100.0;
  }
}