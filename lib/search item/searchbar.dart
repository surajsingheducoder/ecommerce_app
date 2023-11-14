import 'dart:convert';

import 'package:aapna_bazar/search%20item/userdata_list.dart';
import 'package:aapna_bazar/search%20item/usermodel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<UserDetail> _allUsers = [
    // {"id": 1, "name": "Ankit Patel", "Age": 22},
    // {"id": 2, "name": "Nitesh Patel", "Age": 23},
    // {"id": 3, "name": "Abhishek Kumar", "Age": 21},
    // {"id": 4, "name": "Sahil Kumar", "Age": 21},
    // {"id": 5, "name": "Suraj Singh", "Age": 20},
    // {"id": 6, "name": "Amit Singh", "Age": 21},
    // {"id": 7, "name": "Golden Kumar", "Age": 22},
    // {"id": 8, "name": "Arun Kumar", "Age": 20},
    // {"id": 9, "name": "Sonu Dright", "Age": 25},
    // {"id": 10, "name": "Anurag Kumar", "Age": 21},
    // {"id": 11, "name": "Sudish Kumar", "Age": 22},
    // {"id": 12, "name": "Nitish Kumar", "Age": 20},
    // {"id": 13, "name": "Chandan Singh", "Age": 19},
    // {"id": 14, "name": "Amarnath Kumar", "Age": 19},
    // {"id": 15, "name": "Priyanshu Kumar", "Age": 18},
    // {"id": 16, "name": "Ritesh Kumar", "Age": 20},
    // {"id": 17, "name": "Naushad Aalam", "Age": 22},
    // {"id": 18, "name": "Prince Kumar", "Age": 20},
    // {"id": 19, "name": "Rahul RAJ", "Age": 27},
    // {"id": 20, "name": "Ajit Kumar", "Age": 24},
  ];
  List<UserDetail> _origionalListData = [];

  searchUsers(String searchText) {
    List<UserDetail> _searchedData = [];

    if (searchText.isEmpty) {
      _searchedData = _origionalListData;
    } else {
      // _searchedData= _allUsers.where((element) => element["name"].toString().toLowerCase().contains(searchText)).toList();
      _searchedData = _allUsers
          .where((element) =>
          element.name.toString().toLowerCase().contains(searchText))
          .toList();
    }
    setState(() {
      _allUsers = _searchedData;
    });
  }

  @override
  void initState() {
    super.initState();

    getdata().then((value) {
      setState(() {
        _allUsers = value;
        _origionalListData = _allUsers;
      });
    });
  }

  Future<List<UserDetail>> getdata() async {
    final response = await http.get(
      Uri.parse('https://demo5896499.mockable.io/users'),
    );
    if (response.statusCode == 200) {
      List data = jsonDecode(response.body);
      var dataList = data.map((e) => UserDetail.fromJson(e)).toList();
      return dataList;
    } else {
      return List<UserDetail>.empty();
    }
    // Add this line to return an empty list if no data is retrieved
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              TextField(
                onChanged: (value) =>
                {searchUsers(value), debugPrint("$value: ")},
                decoration: InputDecoration(
                    labelText: 'Search', suffixIcon: Icon(Icons.search)),
              ),
              Expanded(
                  child: ListView.builder(
                      itemCount: _allUsers.length,
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ListDetails(
                                      name: _allUsers[index].name,
                                      id: _allUsers[index].id,
                                      age: _allUsers[index].age)));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Card(
                              child: ListTile(
                                subtitle: Text("${_allUsers[index].name}"),
                                title: Text(
                                  "${_allUsers[index].email}",
                                ),
                              )),
                        ),
                      )))
            ],
          ),
        ),
      ),
    );
  }
}
