import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:note_book/components/custom_text_form.dart';
import 'package:note_book/controller/login_contoller.dart';
import 'package:note_book/view/login.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  GlobalKey formKey=GlobalKey<FormState>();
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
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.pink,
                  child: CircleAvatar(
                    radius: 47,
                    backgroundColor: Colors.grey,
                  ),
                ),
                CircleAvatar(
                  backgroundColor: Colors.pink,
                  radius: 22,
                  child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.white,
                      child: IconButton(
                          color: Colors.black,
                          onPressed: () {},
                          icon:const Icon(Icons.camera_alt))),
                )
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * .05,
            ),
            CustomTextForm(
              controller: nameController,
              secure: false,
              hint: "name",
              type: TextInputType.name,
              icon: null,
              onpreseed: () {},
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
                shape:const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                padding:const EdgeInsetsDirectional.fromSTEB(50, 5, 50, 5),
                onPressed: () {
                  print('SignUp');
                },
                child: const Text(
                  "SignUp",
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
                  "Have an account ?",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.off(LoginScreen());
                  },
                  child:const Text('Login'),
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
