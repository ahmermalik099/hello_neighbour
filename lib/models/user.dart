class MyUser{
  String userName;
  String? pfp_url;
  String lat;
  String long;
  String uid;
  String email;
  String gender;
  List<String>? images;
  String bio;
  String age;
  String city;


  MyUser(
    {
      this.userName = '',
      this.pfp_url,
      this.lat = '',
      this.long = '',
      this.uid = '',
      this.age = '',
      this.bio = '',
      this.city = '',
      this.email  ="",
      this.gender = "",
      this.images,
    }
  );


  

}