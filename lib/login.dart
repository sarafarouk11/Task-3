import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task2/HomeNav.dart';
import 'package:task2/Task2.dart';
import 'package:task2/authentication.dart';
import 'package:task2/custom_elevated.dart';
import 'package:task2/custom_text.dart';
import 'package:task2/custom_text_field.dart';
import 'package:task2/register.dart';
import 'package:task2/validator.dart';

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController? EmailController = TextEditingController();
  TextEditingController? PasswordController = TextEditingController();
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
              CustomTextField(text: 'Welcome to Login'),
              const SizedBox(height: 30,),
              CustomText(
                Controller: EmailController,
                validator: AppValidator.validateText,
                prefixIcon: const Icon(Icons.mail),
                hintText: 'Enter your Email',
                  label: 'Email',

              ),
              const SizedBox(height: 30,),
              CustomText(
                Controller: PasswordController ,
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
              Align(
                child: CustomElevated(
                  textButton: 'login',
                  onPressed: () async{
                    if(formKey.currentState!.validate()){
                      Appauthentication.loginHere(email: EmailController!.text,
                          password: PasswordController!.text);
                      Navigator.pushAndRemoveUntil(context,
                        MaterialPageRoute(builder: (context) =>home()),
                            (route) =>false,);
                    }
                  },
                ),
              ),
              Align(
                child: TextButton(onPressed: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) =>Register(),));

                }, child: CustomTextField(text: 'Do not have an account',
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
