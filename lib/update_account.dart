import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'Account.dart';
import 'Model/UserModel.dart';

class UpdateAccount extends StatefulWidget {
  const UpdateAccount({Key? key, required this.imageUrl}) : super(key: key);

  final String imageUrl;

  @override
  State<UpdateAccount> createState() => _UpdateAccountState();
}

class _UpdateAccountState extends State<UpdateAccount> {

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  UserModel? userDataModel;

  PickedFile? imageFile;
  final picker = ImagePicker();

  String? imageUrl;

  @override
  void initState() {
    super.initState();
    retrieveData().then((value) {
      userDataModel = value;
      setState(() {
        nameController.text = userDataModel?.name ?? "";
        addressController.text = userDataModel?.address ?? "";
      });
    });
  }

  Future<UserModel?> retrieveData() async {
    var auth = FirebaseAuth.instance.currentUser?.uid;
    var user = await FirebaseFirestore.instance.collection("users").doc(auth).get();
    var userModal = UserModel.fromJson(user.data()!);
    return userModal;
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await picker.getImage(source: source);
    setState(() {
      imageFile = pickedFile;
    });
  }

  Future<void> uploadImageToFirebase() async {
    final auth = FirebaseAuth.instance.currentUser?.uid;
    if (imageFile != null) {
      File file = File(imageFile!.path);
      var ref = FirebaseStorage.instance
          .ref()
          .child('usersImage')
          .child('$auth.jpg');
      UploadTask uploadTask = ref.putFile(file);
      TaskSnapshot snapshot = await uploadTask;
      imageUrl = await snapshot.ref.getDownloadURL();
    }
  }

  void updateUser() async {
    var auth = FirebaseAuth.instance.currentUser?.uid;
    await uploadImageToFirebase();
    FirebaseFirestore.instance.collection("users").doc(auth).update({
      "name": nameController.text.trim(),
      "address": addressController.text.trim(),
      "imageUrl": imageUrl,
    }).then((value) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const AccountBottomNav(),
        ),
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(onPressed: () {
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AccountBottomNav(),));
        }, icon: const Icon(Icons.arrow_back)),
      ),
      body: ListView(
        children: [
          Column(
          children: [
              Container(
                height: 160,
                color: Colors.green,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Center(
                    child: SizedBox(
                      height: 100,
                      width: 100,
                      child : Stack(
                        children: [
                          imageFile != null ?
                          CircleAvatar(
                              radius: 50,
                              backgroundImage: FileImage(File(imageFile!.path))
                          ):
                          CircleAvatar(
                            radius: 50,
                            backgroundImage: widget.imageUrl != "" ? NetworkImage(widget.imageUrl) : NetworkImage('https://media.licdn.com/dms/image/D4D03AQFo9m--m9fwmQ/profile-displayphoto-shrink_800_800/0/1680501705686?e=1689811200&v=beta&t=gDH9Za-Tz9IqY0NBE6znPshdtvx-cCMo3CrpJ6Epfvc')
                            // widget.imagePath != null ? FileImage(File(imageFile!.path)) : null,
                          ),
                          // const CircleAvatar(
                          //     radius: 100,
                          //     backgroundColor: Colors.white,
                          //     backgroundImage: NetworkImage('https://media.licdn.com/dms/image/D4D03AQFo9m--m9fwmQ/profile-displayphoto-shrink_800_800/0/1680501705686?e=1689811200&v=beta&t=gDH9Za-Tz9IqY0NBE6znPshdtvx-cCMo3CrpJ6Epfvc'),
                          //   ):
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: Container(
                                width: 35,
                                height: 35,
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white),
                                    borderRadius: BorderRadius.circular(100), color: Colors.green),
                                child: IconButton( icon: const Icon(Icons.edit, color: Colors.white,size: 20,),
                                  onPressed: () {
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return Wrap(
                                          children: [
                                            ListTile(
                                              leading: const Icon(
                                                Icons.camera_alt,
                                                color: Colors.black,
                                              ),
                                              title: const Text('Camera'),
                                              onTap: () {
                                                pickImage(ImageSource.camera);
                                                Navigator.pop(context);
                                              },
                                            ),
                                            ListTile(
                                              leading: const Icon(
                                                Icons.image,
                                                color: Colors.black,
                                              ),
                                              title: const Text('Gallery'),
                                              onTap: () {
                                                pickImage(ImageSource.gallery);
                                                Navigator.pop(context);
                                              },
                                            ),
                                          ],
                                        );
                                      },
                                    );
                                  },)
                            ),
                          )
                        ],
                      ),

                    ),
                  ),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  hintText: '${userDataModel?.name}',
                  labelText: 'Name',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                  labelText: 'Address',
                  hintText: '${userDataModel?.address}'
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextButton(onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AccountBottomNav(),));

              }, child: const Text('SUBMIT', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),)),
            ),

            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixText: 'Update',
                  suffixStyle: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),
                  labelText: 'Mobile Number',
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  suffixText: 'Update',
                  suffixStyle: TextStyle(color: Colors.green, fontSize: 14, fontWeight: FontWeight.bold),
                  labelText: 'Email',
                ),
              ),
            )
          ],
        ),
  ]
      ),
    );
  }
}
