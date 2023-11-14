import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Account.dart';
import 'Cart.dart';
import 'Home.dart';
import 'Notification.dart';
import 'Store.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int selectedPageIndex = 0;
  var screens = [
    const HomeBottomNav(),
    const StoreBottomNav(),
    const NotificationBottomNav(),
    const AccountBottomNav(),
    const CartBottomNav()
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'home',
        debugShowCheckedModeBanner: false,
        home: Scaffold(
        body: screens[selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedPageIndex,
        selectedItemColor: Colors.green,
        items: const [
        BottomNavigationBarItem(
        backgroundColor: Colors.white,
        icon: Icon(Icons.home,color: Colors.green,),
    label: 'Home'),
    BottomNavigationBarItem(
    backgroundColor: Colors.white,
    icon: Icon(Icons.storefront,color: Colors.green,),
    label: 'Store'),
    BottomNavigationBarItem(
    backgroundColor: Colors.white,
    icon: Icon(Icons.notifications,color: Colors.green,),
    label: 'Notification'),
    BottomNavigationBarItem(
    backgroundColor: Colors.white,
    icon: Icon(Icons.person,color: Colors.green,),
    label: 'Account'),
    BottomNavigationBarItem(
    backgroundColor: Colors.white,
    icon: Icon(Icons.add_shopping_cart,color: Colors.green,),
    label: 'Cart')
    ],
    onTap: (index) {
    selectedPageIndex = index;
    setState(() {});
    },
    ),
    ),);
  }
}
