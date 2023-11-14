import 'package:aapna_bazar/theme/povider.dart';
import 'package:flutter/material.dart';

class HomeBottomNav extends StatefulWidget {
  const HomeBottomNav({Key? key}) : super(key: key);

  @override
  State<HomeBottomNav> createState() => _HomeBottomNavState();
}

class _HomeBottomNavState extends State<HomeBottomNav> {

  bool switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E9),
      appBar: AppBar(
        title: Text("AapnaBazar"),
        // backgroundColor: Colors.green,
        // title: Text('Aapna Bazar'),
        // leading: Icon(Icons.shopping_cart),
        // actions: [
        //   IconButton(onPressed: () {
        //     Navigator.push(context, MaterialPageRoute(builder: (context) => SearchPage(),));
        //   }, icon: Icon(Icons.search))
        // ],
      ),
        );
  }
}
