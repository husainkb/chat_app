import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InviteFriendsPage extends StatelessWidget {
  const InviteFriendsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title:  Text(
          "Invite Friends Page",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),
        ),
      ),
      body: Column(
        children: [
          Text(
            "Invite Friends Page",
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
          ],
      ),
    );
  }
}
