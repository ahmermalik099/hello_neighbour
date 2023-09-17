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
  final TextEditingController ageController = TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  String img = "";
  Color _iconColorFav = Colors.black;
  Color _iconColorEww = Colors.black;
  bool _isEditing = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
        backgroundColor: Colors.cyanAccent.shade700,
        actions: [
          _isEditing
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _isEditing = false;
                    });
                  },
                  icon: Icon(
                    Icons.check,
                  ),
                )
              :
          IconButton(
            onPressed: () {
              setState(() {
                _isEditing = true;
              });
            },
            icon: Icon(
              Icons.edit,
            ),
          ),
        ],
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
                      onTap: () async {
                        img = (await StorageService().selectFile())!;
                        img == "" ? null : setState(() {});
                      },
                      child: CircleAvatar(
                        backgroundColor: Colors.grey,
                        backgroundImage: AssetImage(
                          img == "" ? 'assets/1.webp' : img,
                        ),
                        radius: 80,
                      ),
                    ),
                  ),
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
                      enabled: _isEditing? true : false,
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
                    )),
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
                        Center(
                          child: SizedBox(
                            child: Column(
                              children: [
                                Icon(
                                  Icons.person,
                                  color: Colors.white,
                                  size: 30,
                                ),
                                Text(
                                  '21',
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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _iconColorFav = Colors.cyan;
                        _iconColorEww=Colors.black;
                      });
                    },
                    icon: Icon(
                      Icons.favorite,
                      size: 40,
                    ),
                    color: _iconColorFav,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _iconColorEww = Colors.cyan;
                        _iconColorFav=Colors.black;

                      });
                    },
                    icon: Icon(
                      Icons.heart_broken_outlined,
                      size: 40,
                    ),
                    color: _iconColorEww,
                  ),
                ],
              )
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
