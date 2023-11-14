import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class StoreBottomNav extends StatefulWidget {
  const StoreBottomNav({Key? key}) : super(key: key);

  @override
  State<StoreBottomNav> createState() => _StoreBottomNavState();
}

class _StoreBottomNavState extends State<StoreBottomNav> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text('All Categories'),
        actions: [
          IconButton(onPressed: () {
            
          }, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {
            
          }, icon: const Icon(Icons.mic))
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Lottie.network('https://assets7.lottiefiles.com/packages/lf20_NODCLWy3iX.json'),
          ),
          const Text('Store', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
        ],
      ),
    );
  }
}
