import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task2/HomeNav.dart';
import 'package:task2/authentication.dart';
import 'package:task2/custom_elevated.dart';
import 'package:task2/custom_text.dart';
import 'package:task2/custom_text_field.dart';
import 'package:task2/login.dart';
import 'package:task2/validator.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  TextEditingController? EmailRegisterController = TextEditingController();
  TextEditingController? PasswordRegisterController = TextEditingController();
  TextEditingController? phoneRegController = TextEditingController();
  TextEditingController? nameRegController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isVisbility = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Form(
              key: formKey ,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextField(text: 'Register here'),
                  const SizedBox(height: 30,),
                  CustomText(
                    Controller: EmailRegisterController,
                    validator: AppValidator.validateText,
                    prefixIcon: const Icon(Icons.mail),
                    hintText: 'Enter your Email',
                    label: 'Email',

                  ),
                  const SizedBox(height: 30,),
                  CustomText(
                    Controller: PasswordRegisterController ,
                    validator: AppValidator.validateText,
                    hintText: "Enter your Password",
                    label: 'Password',
                    obscureText: isVisbility,
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon:InkWell(
                        onTap: (){
                          isVisbility = !isVisbility;
                          setState(() {

                          });
                        },
                        child:isVisbility
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility)),
                  ),
                  const SizedBox(height: 30,),
                  CustomText(
                    Controller: phoneRegController,
                    validator: AppValidator.validateText,
                    prefixIcon: const Icon(Icons.phone),
                    hintText: 'Enter your Phone',
                    label: 'Phone',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomText(
                    Controller: nameRegController,
                    validator: AppValidator.validateText,
                    prefixIcon: const Icon(Icons.person),
                    hintText: 'Enter your Name',
                    label: 'Name',
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Align(
                    child: CustomElevated(
                      textButton: 'Register',
                      onPressed: () async{
                        if(formKey.currentState!.validate()){
                          await Appauthentication.register(email:EmailRegisterController!.text,
                              password:PasswordRegisterController!.text,
                              name: nameRegController!.text,
                              phone: phoneRegController!.text )
                        .then((value) {
                        if (value) {
                        Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => home()),
                        (route) => false);
                        }
                        });
                        }
                      },
                    ),
                  ),
                  Align(
                    child: TextButton(onPressed: (){
                      Navigator.pushAndRemoveUntil(context,
                          MaterialPageRoute(builder: (context) =>login(),),
                              (route) =>false);

                    }, child: CustomTextField(text: 'Already have an account',
                      sizeText: 15,
                      colorText: Colors.lightBlue,)),
                  )

                ],
              ),
            ),
          ),
        ));
  }
}