import 'package:flutter/material.dart';
import 'package:order_now/majestic/ui/auth_page/widgets/section_separator.dart';
import 'package:order_now/views/components/custom_botton.dart';
import 'package:order_now/views/components/custom_text_field.dart';
import 'package:order_now/views/components/order_now_buttom.dart';

class Setup extends StatefulWidget {
  const Setup({super.key});

  @override
  State<Setup> createState() => _SetupState();
}

class _SetupState extends State<Setup> {
  final TextEditingController _passwordcontroller = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _addressController = TextEditingController();

  bool isEnabled = false;

  @override
  Widget build(BuildContext context) {
    _nameController.text = "ISHANK KUMAR";
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 230,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFFF939B), Color(0xFFEF2A39)],
                    ),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 0,
                  right: 0,
                  child: Align(
                    alignment: Alignment.center,
                    child: Card(
                      elevation: 9,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        height: 100,
                        width: 100,
                        child: Image.asset("assets/images/user.png"),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(height: 20),
                      CustomTextField(
                        controller: _nameController,
                        isPassword: false,
                        label: "Name",
                        hintText: "Enter Your Name",
                        isEnabled: isEnabled,
                      ),
                      CustomTextField(
                        controller: _emailController,
                        isPassword: false,
                        label: "Email",
                        hintText: "Enter your email",
                        isEnabled: isEnabled,
                      ),
                      CustomTextField(
                        controller: _addressController,
                        isPassword: false,
                        label: "Address",
                        hintText: "Enter you address",
                        isEnabled: isEnabled,
                      ),
                      CustomTextField(
                        controller: _passwordcontroller,
                        isPassword: true,
                        label: "Password",
                        hintText: "Enter you password",
                        isEnabled: false,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: SectionSeparator(text: "want to edit ?"),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEnabled = true;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEF2A39),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    foregroundColor: Colors.white,
                    fixedSize: Size(180, 50),
                  ),
                  child: Text("Edit Profile", style: TextStyle(fontSize: 20)),
                ),

                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isEnabled = false;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEF2A39),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    foregroundColor: Colors.white,
                    fixedSize: Size(180, 50),
                  ),
                  child: Text("Save Profile", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
