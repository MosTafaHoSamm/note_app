 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/components/custom_text_form.dart';
import 'package:note_book/controller/login_contoller.dart';
import 'package:note_book/view/signup.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: ListView(children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * .10,
            ),
            Image.asset(
              'assets/images/notes.png',
              height: 200,
              width: 200,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            CustomTextForm(
              controller: emailController,
              secure: false,
              hint: "email",
              type: TextInputType.emailAddress,
              icon: null,
              onpreseed: () {},
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            GetBuilder<LoginController>(
                init: LoginController(),
                builder: (controller) => CustomTextForm(
                      controller: passwordController,
                      secure: controller.secure,
                      hint: "password",
                      type: TextInputType.visiblePassword,
                      icon: controller.secure
                          ? Icons.visibility_off
                          : Icons.visibility,
                      onpreseed: () {
                        controller.changesecure();
                        print('${controller.secure}');
                      },
                    )),
            SizedBox(
              height: MediaQuery.of(context).size.height * .02,
            ),
            Container(
              clipBehavior: Clip.antiAlias,
              decoration:const BoxDecoration(
                  // borderRadius: BorderRadius.all(Radius.circular(10))
                  //
                  ),
              child: MaterialButton(
                shape:const  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding:const EdgeInsetsDirectional.fromSTEB(50, 5, 50, 5),
                onPressed: () {
                  print('Login');
                },
                child:const Text(
                  "Login",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.pink,
              ),
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * .05,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don\'t have an account ?",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.to(const SignUpScreen());
                  },
                  child:const Text('Signup'),
                  style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.pink)),
                )
              ],
            ),
          ],
        ),
      ),
    ])));
  }
}
