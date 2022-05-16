import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class ForgetPassword extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 30, left: 25, right: 25),
        child: Column(
          children: [
            TextFormField(
              controller: _emailController,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            InkWell(
              onTap: () {
                FirebaseAuth.instance
                    .sendPasswordResetEmail(email: _emailController.text)
                    .then((value) {
                  Fluttertoast.showToast(msg: "Please Check your Mail");
                  Navigator.pop(context);
                });
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 50.w),
                height: 47.h,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 203, 221, 241),
                      blurRadius: 30.0,
                      spreadRadius: 5.0,
                      offset: Offset(
                        5.0,
                        20.0,
                      ),
                    )
                  ],
                ),
                child: Center(child: Text("Reset Password")),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
