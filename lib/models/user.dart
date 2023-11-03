class MyUser {
  String userName;
  String? pfp_url;
  String? lat;
  String? long;
  String? uid;
  String? email;
  String? gender;
  List<String>? images;
  String? bio;
  String? age;
  String? city;

  MyUser({
    this.userName = '',
    this.pfp_url,
    this.lat = '33',
    this.long = '77',
    this.uid = '',
    this.age = '',
    this.bio = '',
    this.city = 'islamabad',
    this.email = "eh",
    this.gender = "male",
  });

  factory MyUser.fromMap(Map<String, dynamic> doc) {
    return MyUser(
      userName: doc['userName'],
      pfp_url: doc['pfp_url'] ??
          'https://i0.wp.com/thegeekiary.com/wp-content/uploads/2022/12/bleach-blades.jpg?resize=620%2C435&ssl=1',
      lat: doc['lat'],
      long: doc['long'],
      uid: doc['uid'],
      email: doc['email'],
      age: doc['age'],
      bio: doc['bio'],
      city: doc['city'],
      gender: doc['gender'],
    );
  }
}
