import 'package:flutter/material.dart';

class ListDetails extends StatefulWidget {
  final String name;
  final int id;
  final int age;

  const ListDetails({super.key, required this.name, required this.id, required this.age});

  @override
  State<ListDetails> createState() => _ListDetailsState();
}

class _ListDetailsState extends State<ListDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Column(
      children: [
        Text("${widget.name}"),
        Text("${ widget.id} "),
        Text("${widget.age}")
      ],
    ));
  }
}
