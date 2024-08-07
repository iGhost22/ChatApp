import 'package:chatapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  HomeView({Key? key}) : super(key: key);

  final List<Widget> myChats = List.generate(
    20,
    (index) => ListTile(
      onTap: () => Get.toNamed(Routes.CHAT_ROOM),
      leading: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.black,
        child: Image.asset(
          "assets/logo/noimage.png",
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        "User ${index + 1}",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
      ),
      subtitle: Text(
        "This is the last message ${index + 1}",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: Chip(
        label: Text("3"),
      ),
    ),
  ).reversed.toList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Material(
            elevation: 5,
            child: Container(
              margin: EdgeInsets.only(top: context.mediaQueryPadding.top),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: Colors.black38,
                  ),
                ),
              ),
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              // padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Chats",
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Material(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.red[900],
                    child: InkWell(
                      onTap: () {
                        Get.toNamed(Routes.PROFILE);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(5),
                        child: const Icon(
                          Icons.person,
                          size: 35,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: 20,
              itemBuilder: (context, index) => myChats[index],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.SEARCH),
        child: Icon(
          Icons.search,
          size: 35,
        ),
        backgroundColor: Colors.red[900],
        foregroundColor: Colors.white,
      ),
    );
  }
}
