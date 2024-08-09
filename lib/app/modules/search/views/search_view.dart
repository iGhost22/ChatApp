import 'package:chatapp/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/search_controller.dart';

class SearchView extends GetView<SearchhController> {
  SearchView({Key? key}) : super(key: key);

  final List<Widget> friends = List.generate(
    20,
    (index) => ListTile(
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
        "User${index + 1}@gmail.com",
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w400,
        ),
      ),
      trailing: GestureDetector(
        onTap: () => Get.toNamed(Routes.CHAT_ROOM),
        child: Chip(
          label: Text("Message"),
        ),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(140),
        child: AppBar(
          backgroundColor: Colors.red[900],
          title: const Text(
            'Search',
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
          ),
          flexibleSpace: Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: TextField(
                controller: controller.searchC,
                cursorColor: Colors.red[900],
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50),
                    borderSide: BorderSide(
                      color: Colors.white,
                      width: 1,
                    ),
                  ),
                  hintText: "Search your friend...",
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  suffixIcon: InkWell(
                    borderRadius: BorderRadius.circular(50),
                    onTap: () {},
                    child: Icon(
                      Icons.search,
                      color: Colors.red[900],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: friends.length == 0
          ? Center(
              child: Container(
                width: Get.width * 0.7,
                height: Get.width * 0.7,
                child: Lottie.asset("assets/lottie/empty.json"),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: friends.length,
              itemBuilder: (context, index) => friends[index],
            ),
    );
  }
}
