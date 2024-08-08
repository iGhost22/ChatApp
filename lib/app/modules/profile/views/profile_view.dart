import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.logout),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            child: Column(
              children: [
                AvatarGlow(
                  // glowColor: Colors.black,
                  child: Container(
                    margin: EdgeInsets.all(15),
                    width: 175,
                    height: 175,
                    decoration: BoxDecoration(
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(100),
                      image: DecorationImage(
                        image: AssetImage("assets/logo/noimage.png"),
                      ),
                    ),
                  ),
                ),
                Text(
                  "Lorem Ipsum",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "LoremIpsum@gmail.com",
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: Column(
              children: [
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.note_add_outlined),
                  title: Text(
                    "Update Status",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.account_circle_outlined),
                  title: Text(
                    "Chang Profile",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  trailing: Icon(Icons.arrow_right),
                ),
                ListTile(
                  onTap: () {},
                  leading: Icon(Icons.color_lens),
                  title: Text(
                    "Change Theme",
                    style: TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  trailing: Text("Light"),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(bottom: context.mediaQueryPadding.bottom),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Chat App",
                  style: TextStyle(color: Colors.black54),
                ),
                Text(
                  "Version 1.0.0",
                  style: TextStyle(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
