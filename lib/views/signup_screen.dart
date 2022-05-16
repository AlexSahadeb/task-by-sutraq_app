import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sutraq_app/const/app_colors.dart';
import 'package:sutraq_app/routes/routes.dart';
import 'package:lottie/lottie.dart';
import 'package:sutraq_app/views/auth/authLogic.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();

  TextEditingController _passwordController = TextEditingController();

  bool isChecked = false;
  bool _obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: 812.h,
            width: 375.w,
            child: Column(
              children: [
                Expanded(
                    flex: 2,
                    child: Center(
                      child: Lottie.asset("assets/files/welcome.json",
                          height: 150.h),
                    )),
                Expanded(
                    flex: 3,
                    child: Container(
                      decoration: BoxDecoration(
                          color: AppColors.appleColor,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30.r),
                            topRight: Radius.circular(30.r),
                          )),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 30, left: 25, right: 25),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text("Create your account",
                                  style: TextStyle(fontSize: 25)),
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                  "Lorem ipsum doller sit amet Lorem ipsum ",
                                  style: TextStyle()),
                            ),
                            SizedBox(height: 20.h),
                            TextFormField(
                              controller: _emailController,
                              keyboardType: TextInputType.emailAddress,
                              decoration: InputDecoration(
                                labelText: "E-mail",
                              ),
                            ),
                            TextFormField(
                              controller: _passwordController,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                labelText: "Password",
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    _obsecureText
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Theme.of(context).primaryColorDark,
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      _obsecureText = !_obsecureText;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Checkbox(
                                      value: isChecked,
                                      onChanged: (value) {
                                        setState(() {
                                          isChecked = value!;
                                        });
                                      },
                                    ),
                                    Text("Check recoarments")
                                  ],
                                ),
                                InkWell(
                                    onTap: () {},
                                    child: Text("Forget Password"))
                              ],
                            ),
                            SizedBox(
                              height: 60.h,
                            ),
                            InkWell(
                              onTap: () => AuthLogic().resgitration(
                                  _emailController.text,
                                  _passwordController.text,
                                  context),
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
                                child: Center(child: Text("Sign Up")),
                              ),
                            )
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
