import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class NotificationBottomNav extends StatefulWidget {
  const NotificationBottomNav({Key? key}) : super(key: key);

  @override
  State<NotificationBottomNav> createState() => _NotificationBottomNavState();
}

class _NotificationBottomNavState extends State<NotificationBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('Notification'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_NODCLWy3iX.json'),
          ),
          const Text('Notification', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
