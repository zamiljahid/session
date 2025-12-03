import 'package:flutter/material.dart';
import 'package:session/shared_preferences.dart';
import 'package:session/user_screen.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import 'customized_text_field.dart';

class CustomizedTextFieldScreen extends StatefulWidget {
  const CustomizedTextFieldScreen({super.key,});

  @override
  State<CustomizedTextFieldScreen> createState() =>
      _CustomizedTextFieldScreenState();
}

class _CustomizedTextFieldScreenState extends State<CustomizedTextFieldScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController nidController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text("Session"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.orange,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Container(
                  color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomInputField(
                      label: "Name",
                      hint: "Enter your name",
                      controller: nameController,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Card(
                  color: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CustomInputField(
                      label: "Name",
                      hint: "Enter your name",
                      controller: nameController,
                    ),
                  ),
                ),
              ),
              Padding(
                // padding: const EdgeInsets.only(left: 8.0),
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CustomInputField(
                      label: "NID",
                      hint: "Enter your NID",
                      controller: nidController,
                    ),
                  ),
                ),
              ),
              Padding(
                // padding: const EdgeInsets.only(right: 8.0),
                padding: const EdgeInsets.all(10.0),
                child: CustomInputField(
                  label: "Age",
                  hint: "Enter your age",
                  controller: ageController,
                ),
              ),
              Padding(
                // padding: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(10.0),
                child: CustomInputField(
                  label: "Address",
                  hint: "Enter your address",
                  controller: addressController,
                ),
              ),
              Padding(
                // padding: const EdgeInsets.only(bottom: 8.0),
                padding: const EdgeInsets.all(10.0),
                child: CustomInputField(
                  label: "Phone Number",
                  hint: "Enter phone number",
                  controller: phoneController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: CustomInputField(
                  label: "Email",
                  hint: "Enter your email",
                  controller: emailController,
                ),
              ),
              ElevatedButton(onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) =>  ApiCardScreen()),
                );
                print('navigating to user list');
              }, child: Text('Show User List')),

              // Text(SharedPrefs.getString('name').toString(), style: TextStyle(color: Colors.white),)
            ],
          ),
        ),
      ),

    );
  }


}

