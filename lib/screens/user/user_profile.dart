// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:hello_neighbour/screens/user/components/profile_slider.dart';
import 'package:hello_neighbour/services/storage.dart';

class UserProfileScreen extends StatefulWidget {
  const UserProfileScreen({super.key});

  @override
  State<UserProfileScreen> createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  final TextEditingController bioController = TextEditingController();
  String img = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          'User NAme',
          style: TextStyle(color: Theme.of(context).primaryColor),
        ),
        centerTitle: false,
      ),
      body: ListView(
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: GestureDetector(
                      onTap: () async{
                        img = (await StorageService().selectFile())!;
                        img == "" ? null : setState(() {});
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(
                          img==""? 'assets/1.webp': img,
                        ),
                        radius: 80,
                      ),
                    ),
                  ),
                  // Expanded(
                  //   flex: 1,
                  //   child: Column(
                  //     children: [
                  //       Row(
                  //         mainAxisSize: MainAxisSize.max,
                  //         mainAxisAlignment:
                  //         MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           buildStatColumn(postLen, 'Posts'),
                  //           buildStatColumn(followers, 'Followers'),
                  //           buildStatColumn(following, 'Followings'),
                  //         ],
                  //       ),
                  //       Row(
                  //         mainAxisAlignment:
                  //         MainAxisAlignment.spaceEvenly,
                  //         children: [
                  //           FirebaseAuth.instance.currentUser!.uid ==
                  //               widget.uid
                  //               ? FollowButton(
                  //             text: 'Sign Out',
                  //             backgroundColor: Theme.of(context)
                  //                 .scaffoldBackgroundColor,
                  //             textColor:
                  //             Theme.of(context).primaryColor,
                  //             borderColor: Colors.grey,
                  //             function: () async {
                  //               AuthMethods().signOut();
                  //               Navigator.of(context)
                  //                   .push(MaterialPageRoute(
                  //                 builder: (context) =>
                  //                 const LoginScreen(),
                  //               ));
                  //             },
                  //           )
                  //               : isFollowing
                  //               ? FollowButton(
                  //             text: 'Unfollow',
                  //             backgroundColor: Colors.white,
                  //             textColor: Colors.black,
                  //             borderColor: Colors.grey,
                  //             function: () async {
                  //               await FirestoreMethods()
                  //                   .followUser(
                  //                   FirebaseAuth.instance
                  //                       .currentUser!.uid,
                  //                   userData['uid']);
                  //
                  //               setState(() {
                  //                 isFollowing = false;
                  //                 followers--;
                  //               });
                  //             },
                  //           )
                  //               : FollowButton(
                  //             text: 'Follow',
                  //             backgroundColor: Colors.blue,
                  //             textColor: primaryColor,
                  //             borderColor: Colors.blueAccent,
                  //             function: () async {
                  //               await FirestoreMethods()
                  //                   .followUser(
                  //                   FirebaseAuth.instance
                  //                       .currentUser!.uid,
                  //                   userData['uid']);
                  //
                  //               setState(() {
                  //                 isFollowing = true;
                  //                 followers++;
                  //               });
                  //             },
                  //           ),
                  //         ],
                  //       )
                  //     ],
                  //   ),
                  // ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(top: 15),
                  child: Text(
                    'NAME',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Container(
                  alignment: Alignment.centerLeft,
                  child: TextField(
                    controller: bioController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      labelText: 'BIO',
                    ),
                    onChanged: (newBio) {
                      // Update the bio whenever the user types in the TextField
                      setState(() {
                        // userData['bio'] = newBio;
                      });
                    },
                  )

                ),
              ),

              Container(
                height: MediaQuery.of(context).size.height * 0.1,
                color: Colors.cyanAccent.shade700,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Center(child: Expanded(child: Column(
                          children: [
                            Icon(Icons.person,color: Colors.white,size: 30,),
                            Text('21',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500,color: Colors.white),),
                          ],
                        ),
                        ),
                        ),
                        Center(
                          child: Expanded(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  'Islamabad',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Center(
                          child: Expanded(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.male,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  'Male',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),


                      ],
                    ),
                  ],
                ),
              ),
              ProfileSlider(),
            ],

          ),

          // FutureBuilder(
          //     future: FirebaseFirestore.instance
          //         .collection("posts")
          //         .where("uid", isEqualTo: widget.uid)
          //         .get(),
          //     builder: (context, snapshot) {
          //       if (snapshot.connectionState == ConnectionState.waiting) {
          //         return const Center(
          //           child: CircularProgressIndicator(),
          //         );
          //       }
          //
          //       return GridView.builder(
          //           shrinkWrap: true,
          //           itemCount: (snapshot.data! as dynamic).docs.length,
          //           gridDelegate:
          //           const SliverGridDelegateWithFixedCrossAxisCount(
          //             crossAxisCount: 3,
          //             crossAxisSpacing: 5,
          //             mainAxisSpacing: 1.5,
          //             childAspectRatio: 1,
          //           ),
          //           itemBuilder: (context, index) {
          //             DocumentSnapshot snap =
          //             (snapshot.data! as dynamic).docs[index];
          //
          //             return Container(
          //               child: Image(
          //                 image: NetworkImage(snap['postUrl']),
          //                 fit: BoxFit.cover,
          //               ),
          //             );
          //           });
          //     })
        ],
      ),
    );
  }
}